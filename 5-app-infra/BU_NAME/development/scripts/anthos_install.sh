#!/bin/bash

## Script that registers the clusters to the Anthos and runs post apply configurations for Bank Of Anthos





#TODO cluster context specify

#TODO variablize paths for chdir
# REPO_NAME to be substituted with RNR_REPO_NAME variable from wrapper script

#Fetch container credentials
terraform -chdir=REPO_NAME/5-app-infra/BU_NAME/development init
export PROJECT_ID=$(terraform -chdir=REPO_NAME/5-app-infra/BU_NAME/development output -raw boa_project_id)
export CLUSTER_1_NAME=$(terraform -chdir=REPO_NAME/5-app-infra/BU_NAME/development output -raw gke_cluster_region1)
export CLUSTER_1_REGION=$(terraform -chdir=REPO_NAME/5-app-infra/BU_NAME/development output -raw gke_cluster1_region)
export CLUSTER_2_NAME=$(terraform -chdir=REPO_NAME/5-app-infra/BU_NAME/development output -raw gke_cluster_region2)
export CLUSTER_2_REGION=$(terraform -chdir=REPO_NAME/5-app-infra/BU_NAME/development output -raw gke_cluster2_region)

gcloud container clusters get-credentials ${CLUSTER_1_NAME} --project="${PROJECT_ID}" --region="${CLUSTER_1_REGION}"

gcloud container clusters get-credentials ${CLUSTER_2_NAME} --project="${PROJECT_ID}" --region="${CLUSTER_2_REGION}"



VIP=$(kubectl --context "gke_${PROJECT_ID}_${CLUSTER_2_REGION}_${CLUSTER_2_NAME}" describe mci frontend-global-ingress | grep "VIP: "  | awk '{print $2}')

if [ -z ${VIP} ]
then
# Installs kubectl and kubectx
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
export PATH=$PATH:~/.local/bin

echo -e "deb [trusted=yes] http://ftp.de.debian.org/debian buster main" > /etc/apt/sources.list.d/kubectx.list
apt-get update && apt-get install -y kubectx

kubectx cluster1="gke_${PROJECT_ID}_${CLUSTER_1_REGION}_${CLUSTER_1_NAME}"
kubectx cluster2="gke_${PROJECT_ID}_${CLUSTER_2_REGION}_${CLUSTER_2_NAME}"

#creating secret for connection to cloudSQL
terraform -chdir=REPO_NAME/5-app-infra/BU_NAME/development init
export INSTANCE_CONNECTION_NAME=$(terraform -chdir=REPO_NAME/5-app-infra/BU_NAME/development output -raw sql_connection)
export NAMESPACE="default"

kubectx cluster1
kubectl create secret -n ${NAMESPACE} generic cloud-sql-admin \
 --from-literal=username=admin --from-literal=password=admin \
 --from-literal=connectionName=${INSTANCE_CONNECTION_NAME}

kubectx cluster2
kubectl create secret -n ${NAMESPACE} generic cloud-sql-admin \
 --from-literal=username=admin --from-literal=password=admin \
 --from-literal=connectionName=${INSTANCE_CONNECTION_NAME}


 #Installing configmaps and populate-jobs
kubectx cluster2
kubectl apply  -n ${NAMESPACE} -f REPO_NAME/6-BU_NAME/kubernetes-manifests/config.yaml
kubectl apply -n ${NAMESPACE} -f REPO_NAME/6-BU_NAME/populate-jobs

sleep 5
kubectl get jobs

sleep 5

#Applying manifests for Bank Of Anthos
kubectx cluster1
kubectl apply  -n ${NAMESPACE} -f REPO_NAME/6-BU_NAME/kubernetes-manifests

kubectx cluster2
kubectl apply  -n ${NAMESPACE} -f REPO_NAME/6-BU_NAME/kubernetes-manifests

#Deleting frontend service from both the clusters
kubectx cluster1
kubectl delete svc frontend -n ${NAMESPACE}

kubectx cluster2
kubectl delete svc frontend -n ${NAMESPACE}

sleep 5

#register clusters to BU_NAME
export GKE_URI_1=$(gcloud --project=${PROJECT_ID} container clusters list --uri | head -1)
export GKE_URI_2=$(gcloud --project=${PROJECT_ID} container clusters list --uri | tail -1)

gcloud services enable --project=${PROJECT_ID} container.googleapis.com gkeconnect.googleapis.com gkehub.googleapis.com cloudresourcemanager.googleapis.com
gcloud services --project=${PROJECT_ID} enable BU_NAME.googleapis.com
gcloud services --project=${PROJECT_ID} enable multiclusteringress.googleapis.com
gcloud services --project=${PROJECT_ID} enable multiclusterservicediscovery.googleapis.com

sleep 10

gcloud container hub memberships register ${CLUSTER_1_NAME}     --project=${PROJECT_ID}     --gke-uri=${GKE_URI_1}     --enable-workload-identity
gcloud container hub memberships register ${CLUSTER_2_NAME}     --project=${PROJECT_ID}     --gke-uri=${GKE_URI_2}     --enable-workload-identity

sleep 5
gcloud container hub memberships list --project=${PROJECT_ID}


#Logic to enable ingress if not enabled and update if already present
INGRESS_STATUS=$(gcloud alpha container hub ingress describe --project=${PROJECT_ID} | grep configMembership | awk -F"/" '{print $NF}')
if [ -z ${INGRESS_STATUS} ]
then
 gcloud alpha container hub ingress enable   --config-membership=projects/${PROJECT_ID}/locations/global/memberships/${CLUSTER_2_NAME} --project=${PROJECT_ID}
elif [ ${INGRESS_STATUS} == ${CLUSTER_2_NAME} ]
then
 echo "Ingress already configured."
else
  gcloud alpha container hub ingress update --config-membership=projects/${PROJECT_ID}/locations/global/memberships/${CLUSTER_2_NAME}
fi


echo "configuring multicluster ingress on ${CLUSTER_2_NAME}"
sleep 5

kubectx cluster2
kubectl apply -f REPO_NAME/6-BU_NAME/multicluster-ingress.yaml


echo -e "Waiting to get the VIP for the Bank Of Anthos application. Check after 180s."

sleep 240

echo "Below is the IP Address to access Bank Of Anthos application."


kubectx cluster2; kubectl describe mci frontend-global-ingress | grep "VIP: "  | awk '{print $2}'

else
  echo "Application is accessible at ${VIP} , not making any changes"
fi

#!/bin/bash

#echo "Enter the GITHUB_TOKEN for the machine user."
##can be fetched from Google Secret in the cicd project
#read -s GITHUB_TOKEN

if [ $# == 1 ]
then
export GITHUB_TOKEN="${1}"

echo $GITHUB_TOKEN | wc -c

sleep 3

install_connector(){
    apt-get -y update
    apt-get install -y kubectl
    gcloud container clusters get-credentials ${CLUSTER_NAME} --region us-east1 --project ${CICD_PROJECT}
    kubectl apply -f config-connector.yaml
    sleep 180
    kubectl get po -n cnrm-system
    for i in $(ls -1 kcc-policies/templates)
    do
      kubectl apply -f kcc-policies/templates/${i}
    done
    sleep 120
    kubectl get secret -n config-management-system git-creds > /dev/null 2>&1 || kubectl create secret generic git-creds --namespace="config-management-system" --from-literal=username=varunchandak-godmode --from-literal=token=${GITHUB_TOKEN}
}


if grep -E "SYNC_BRANCH|SYNC_REPO" terraform.tfvars > /dev/null
then

terraform -chdir=../0-bootstrap init -reconfigure
PRJ_NAME=$(terraform -chdir=../0-bootstrap output -raw project_name || exit 1)
SYNC_BRANCH="${PRJ_NAME}-main"
REPO_OWNER=$(terraform -chdir=../0-bootstrap output -raw runner_repo_owner || exit 1)
REPO_NAME=$(terraform -chdir=../0-bootstrap output -raw runner_repo_name || exit 1)
SYNC_REPO="${REPO_OWNER}/${REPO_NAME}"

sed -i "s/SYNC_BRANCH/${SYNC_BRANCH}/g" terraform.tfvars
sed -i "s+SYNC_REPO+${SYNC_REPO}+g" terraform.tfvars

fi

terraform init -reconfigure
terraform apply -target=google_project_services.cc_services -auto-approve
sleep 10
terraform apply -auto-approve

export CICD_PROJECT=$(terraform output cicd_project | sed 's/"//g')
export CLUSTER_NAME=$(terraform output cluster_name | sed 's/"//g')
export SERVICE_ACCOUNT="cnrmsa@${CICD_PROJECT}.iam.gserviceaccount.com"

sed "s/SERVICEACCOUNT/${SERVICE_ACCOUNT}/" config-connector.tpl > config-connector.yaml
#rm -f config-connector.tpl

sleep 180

echo "Waiting for the cluster to be RUNNING."

while true
do
  if gcloud container clusters list --project ${CICD_PROJECT} | grep ${CLUSTER_NAME} | grep RUNNING > /dev/null
  then
    install_connector
    break
  fi
done

else

echo "Exiting the script requires 1 argument"
fi

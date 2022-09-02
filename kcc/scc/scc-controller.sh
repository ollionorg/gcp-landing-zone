#!/bin/bash
command -v kpt
if [[ $( echo $? ) != "0" ]]
then
    UNAME=$(uname)
    if [ “${UNAME}” == “Linux”  ]
    then
        echo "Kpt is not install, Installing kpt command"
        apt-get install google-cloud-sdk-kpt
    else
        echo "Kpt is not install, Installing kpt command"
        echo y | gcloud components install kpt
    fi
fi
echo "Installing Kubectl command"
sleep 5
apt-get install -y kubectl

#Getting source name
SOURCE_NAME=$(./gatekeeper-securitycenter sources list \
--organization $ORGANIZATION_ID | jq -r '.[] | [.name, .display_name] | @tsv' | grep $SCC_SOURCE_NAME | awk '{print $1}')
gcloud container clusters get-credentials lz-config-controller-cluster --region us-east1 --project $PROJECT_ID
echo "SourceNme=$SOURCE_NAME"

#Setting up Security Command Center source name
 CLUSTER_NAME=$(kubectl config current-context)
 echo "Cluster name=$CLUSTER_NAME"

###
OS=$(uname)

if [ "${OS}" == "Linux" ]
then
SED="sed -i "
else
SED="sed -i.bkp.lock -e  "
fi


for i in $(ls -1 manifests)
do
${SED} "s+<UPDATE_CLUSTER_NAME>+$CLUSTER_NAME+" manifests/${i}
${SED} "s+<UPDATE_SOURCE_NAME>+$SOURCE_NAME+" manifests/${i}
${SED} "s+FINDING_SA_NAME+$FINDINGS_EDITOR_SA+" manifests/${i}
done

rm -f manifests/*.bkp.lock

#initializing the controller packages
kpt live init manifests

#Applying the controller packages
kpt live apply manifests --reconcile-timeout 10m --output table

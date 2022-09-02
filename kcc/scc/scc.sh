#!/bin/bash
export SOURCES_ADMIN_SA=$(gcloud iam service-accounts create \
    securitycenter-sources-af \
    --display-name "Security Command Center sources admin" \
    --format 'value(email)')
echo "Source created"
export ORGANIZATION_ID=$(gcloud projects get-ancestors $GOOGLE_CLOUD_PROJECT \
    --format json | jq -r '.[] | select (.type=="organization") | .id')
echo "Org fetched"
export gcloud organizations add-iam-policy-binding $ORGANIZATION_ID \
    --member "serviceAccount:$SOURCES_ADMIN_SA" \
    --role roles/securitycenter.sourcesAdmin
echo "Binging sa done"
export gcloud organizations add-iam-policy-binding $ORGANIZATION_ID \
    --member "serviceAccount:$SOURCES_ADMIN_SA" \
    --role roles/serviceusage.serviceUsageConsumer
echo "sa binding created"
export gcloud iam service-accounts add-iam-policy-binding \
    $SOURCES_ADMIN_SA \
    --member "user:$(gcloud config get-value account)" \
    --role roles/iam.serviceAccountTokenCreator
echo "sa sa binding done"
echo "going to sleep"
sleep 10
VERSION=v0.3.0

curl -Lo gatekeeper-securitycenter "https://github.com/GoogleCloudPlatform/gatekeeper-securitycenter/releases/download/${VERSION}/gatekeeper-securitycenter_$(uname -s)_$(uname -m)"

chmod +x gatekeeper-securitycenter

export SOURCE_NAME=$(./gatekeeper-securitycenter sources create \
    --organization $ORGANIZATION_ID \
    --display-name "Gatekeeper-tfsec" \
    --description "Reports violations from Policy Controller audits" \
    --impersonate-service-account $SOURCES_ADMIN_SA | jq -r '.name')
echo "Source created"
export FINDINGS_EDITOR_SA=$(gcloud iam service-accounts create \
    gatekeeper-securitycenter-af \
    --display-name "Security Command Center Gatekeeper findings editor" \
    --format 'value(email)')
echo "finding sa created"
./gatekeeper-securitycenter sources add-iam-policy-binding \
    --source $SOURCE_NAME \
    --member "serviceAccount:$FINDINGS_EDITOR_SA" \
    --role roles/securitycenter.findingsEditor \
    --impersonate-service-account $SOURCES_ADMIN_SA
echo "proving fa-sa finding editor permission"
gcloud organizations add-iam-policy-binding $ORGANIZATION_ID \
    --member "serviceAccount:$FINDINGS_EDITOR_SA" \
    --role roles/serviceusage.serviceUsageConsumer
echo "finding-sa permission"
gcloud iam service-accounts add-iam-policy-binding \
    $FINDINGS_EDITOR_SA \
    --member "user:$(gcloud config get-value account)" \
    --role roles/iam.serviceAccountTokenCreator
echo "finding-sa token-creator"
# ./gatekeeper-securitycenter findings sync \
#     --source $SOURCE_NAME \
#     --impersonate-service-account $FINDINGS_EDITOR_SA
    

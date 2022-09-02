#!/bin/zsh
VERSION=v0.3.0
echo "Downloading gatekeper"
curl -Lo gatekeeper-securitycenter "https://github.com/GoogleCloudPlatform/gatekeeper-securitycenter/releases/download/${VERSION}/gatekeeper-securitycenter_$(uname -s)_$(uname -m)"
echo "Download complete"
chmod +x gatekeeper-securitycenter
    echo "Starting Source_Creation"
    sleep 180
    echo "Extracting Source_Name"
    SOURCE_NAME=$(./gatekeeper-securitycenter sources create \
        --organization $ORGANIZATION_ID \
        --display-name $SCC_SOURCE_NAME \
        --description "Reports violations from Policy Controller audits" \
        --impersonate-service-account $SOURCES_ADMIN_SA | jq -r '.name')
    echo "Starting Source_findings"
    echo $SOURCE_NAME #organizations/542139653104/sources/8760982881831208956
    sleep 200
    echo "Sourcename=$SOURCE_NAME"
    ./gatekeeper-securitycenter sources add-iam-policy-binding \
        --source $SOURCE_NAME \
        --member "serviceAccount:$FINDINGS_EDITOR_SA" \
        --role roles/securitycenter.findingsEditor \
        --impersonate-service-account $SOURCES_ADMIN_SA
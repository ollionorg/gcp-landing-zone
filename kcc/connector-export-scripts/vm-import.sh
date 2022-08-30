#!/bin/bash
## please pass project name as argument while executing this script


gcloud compute instances list --format="value(selfLink.name())" > vms.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf '%s\n'
  ZONE=$(gcloud compute instances list --filter="$p" --format "get(zone)" | awk -F/ '{print $NF}')
  INSTANCE_ASSET='{"name":"//compute.googleapis.com/projects/'"$1"'/zones/'"${ZONE}"'/instances/'"${p}"'","asset_type":"compute.googleapis.com/Instance"}'
  echo "$INSTANCE_ASSET $ZONE"
  echo ${INSTANCE_ASSET} | config-connector bulk-export >> instance-$p.yml
done < vms.txt
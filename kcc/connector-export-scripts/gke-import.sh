#!/bin/bash

## please pass project name as argument while executing this script
gcloud container clusters list --format='value(name)' > gke.txt
while IFS="" read -r p || [ -n "$p" ]
do
  printf '%s\n'
  ZONE=$(gcloud container clusters list --filter="$p" --format='value(location)' | awk -F/ '{print $NF}')
  INSTANCE_ASSET='{"name":"//container.googleapis.com/projects/'"$1"'/locations/'"${ZONE}"'/clusters/'"${p}"'","asset_type":"container.googleapis.com/Cluster"}'
  echo "$INSTANCE_ASSET $ZONE"
  echo ${INSTANCE_ASSET} | config-connector bulk-export >> gke-$p.yml
done < gke.txt
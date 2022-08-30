#!/bin/bash

  echo "Copying tar file for the config-connector binary"
  gsutil cp gs://cnrm/latest/cli.tar.gz .
  mkdir config-connector ; tar -zxvf cli.tar.gz -C config-connector
  UNAME=$(uname | tr '[:upper:]' '[:lower:]')
  [ $(arch) == "x86_64" ] && ARCH="amd64" || ARCH="arm64"

  CC_PATH="$(pwd)/config-connector/${UNAME}/${ARCH}/config-connector"
  mkdir -p resource-manifests/{projects,folders,organizations}

  while getopts p:f:o: flag
  do
    case "${flag}" in
      p)  ${CC_PATH} bulk-export --project ${OPTARG} --on-error continue --output "resource-manifests/projects/${OPTARG}/"
          ;;
      f)  ${CC_PATH} bulk-export --folder ${OPTARG} --on-error continue --output "resource-manifests/folders/${OPTARG}/"
          ;;
      o)  ${CC_PATH} bulk-export --organization ${OPTARG} --on-error continue --output "resource-manifests/organizations/${OPTARG}/"
    esac
  done

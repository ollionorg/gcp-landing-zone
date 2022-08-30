#!/bin/bash
gsutil cp gs://cnrm/latest/cli.tar.gz .
tar zxf cli.tar.gz
mv linux/amd64/config-connector /usr/local/bin
gcloud services enable cloudasset.googleapis.com

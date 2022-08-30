# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM gcr.io/gcp-runtimes/ubuntu_18_0_4

# Use ARG so that values can be overriden by user/cloudbuild
ARG TERRAFORM_VERSION=1.0.9
ARG TERRAFORM_VALIDATOR_RELEASE=v0.4.0

ENV ENV_TERRAFORM_VERSION=$TERRAFORM_VERSION
ENV ENV_TERRAFORM_VALIDATOR_RELEASE=$TERRAFORM_VALIDATOR_RELEASE

RUN apt-get update && \
    apt-get install git wget curl jq unzip git ca-certificates software-properties-common apt-transport-https ca-certificates gnupg -y && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install google-cloud-sdk -y && \
    apt-get install google-cloud-sdk-terraform-tools && \
    apt-get install python3.8 -y && \
    ln -sf /usr/bin/python3.8 /usr/bin/python && \
    wget https://releases.hashicorp.com/terraform/${ENV_TERRAFORM_VERSION}/terraform_${ENV_TERRAFORM_VERSION}_linux_amd64.zip && \
    mkdir -p /builder/terraform && \
    unzip terraform_${ENV_TERRAFORM_VERSION}_linux_amd64.zip -d /builder/terraform && \
    rm -f terraform_${ENV_TERRAFORM_VERSION}_linux_amd64.zip && \
    gsutil cp gs://terraform-validator/releases/${ENV_TERRAFORM_VALIDATOR_RELEASE}/terraform-validator-linux-amd64 /builder/terraform/terraform-validator && \
    chmod +x /builder/terraform/terraform-validator

ENV PATH=/builder/terraform:$PATH
ENTRYPOINT ["/bin/bash"]

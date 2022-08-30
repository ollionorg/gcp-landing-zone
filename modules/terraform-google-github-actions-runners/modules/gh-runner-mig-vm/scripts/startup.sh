#!/bin/bash

# install docker
apt-get update
apt-get upgrade -y
apt-get install -y jq unzip zip curl wget ca-certificates curl gnupg lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
curl https://get.docker.com/ | bash
systemctl enable docker && systemctl start docker

secretUri=$(curl -sS "http://metadata.google.internal/computeMetadata/v1/instance/attributes/secret-id" -H "Metadata-Flavor: Google")
#secrets URI is of the form projects/$PROJECT_NUMBER/secrets/$SECRET_NAME/versions/$SECRET_VERSION
#split into array based on `/` delimeter
IFS="/" read -r -a secretsConfig <<<"$secretUri"
#get SECRET_NAME and SECRET_VERSION
SECRET_NAME=${secretsConfig[3]}
SECRET_VERSION=${secretsConfig[5]}
#access secret from secretsmanager
secrets=$(gcloud secrets versions access "$SECRET_VERSION" --secret="$SECRET_NAME")
#set secrets as env vars
# shellcheck disable=SC2046
# we want to use wordsplitting
export $(echo "$secrets" | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]")

mkdir /runner-tmp
# shellcheck disable=SC2164
mkdir "$HOME/actions-runner" && cd "$HOME/actions-runner"
curl -o actions-runner-linux-x64-2.287.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.287.1/actions-runner-linux-x64-2.287.1.tar.gz

tar -zxf actions-runner-linux-x64-2.287.1.tar.gz && rm -f actions-runner-linux-x64-2.287.1.tar.gz
# shellcheck disable=SC2034
# ACTIONS_RUNNER_INPUT_NAME is used by config.sh
ACTIONS_RUNNER_INPUT_NAME=$HOSTNAME
if [[ -z $REPO_NAME ]]; then
    # Add action runner for an organisation
    POST_URL="https://api.github.com/orgs/${REPO_OWNER}/actions/runners/registration-token"
    GH_URL="https://github.com/${REPO_OWNER}"
else
    # Add action runner for a repo
    POST_URL="https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/actions/runners/registration-token"
    GH_URL="https://github.com/${REPO_OWNER}/${REPO_NAME}"
fi

# Register runner
ACTIONS_RUNNER_INPUT_TOKEN="$(curl -sS --request POST --url "$POST_URL" --header "authorization: Bearer ${GITHUB_TOKEN}" --header 'content-type: application/json' | jq -r .token)"
#configure runner
RUNNER_ALLOW_RUNASROOT=1 $HOME/actions-runner/config.sh --unattended --replace --work "/runner-tmp" --url "$GH_URL" --token "$ACTIONS_RUNNER_INPUT_TOKEN" --labels "$LABELS"

#install and start runner service
cd $HOME/actions-runner/ || exit
./svc.sh install
./svc.sh start

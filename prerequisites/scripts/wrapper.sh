#!/bin/bash

RED=$(tput setaf 1)

echo -e "${RED}Please run this script from prerequisites/scripts/ path"
echo "Press Enter to continue with running the script..."
read -r

#echo -e "Enter GitHub Token to continue: "
#read -s GITHUB_PAT

if [[ -n "$GITHUB_PAT" ]]; then
  echo "Wrapper Script being executed..."
  sleep 1
  echo "Initialising Terraform for 0-bootstrap locally"
  sleep 1
  terraform -chdir=../../0-bootstrap init || exit 1
  echo "Planning terraform locally"
  sleep 1

  OS_NAME=$(uname -s)

  case "${OS_NAME}" in
  Linux*)
    if [ -f /etc/os-release ]; then
      LINUX=$(awk -F= '/^ID=/{print $2}' /etc/os-release)
      if [ ${LINUX} == "ubuntu" ]; then
        sudo apt-get -y -qq update || exit 23
        sudo apt-get -y -qq install m4 || exit 23
      elif [ ${LINUX} == "redhat" ]; then
        sudo yum -y -d 0 -e 0 install m4 || exit 23
      fi
    else
      echo "Error: Unknown Linux Operating System. Exiting."
      exit 33
    fi
    ;;
  Darwin*)
    brew install m4 || exit 43
    ;;
  *)
    echo "Error: Unknown Operating System. Exiting. The script works only on Ubuntu, RedHat, OSX."
    ;;
  esac

  if [[ -d "../../0-bootstrap" ]]; then
    terraform -chdir=../../0-bootstrap plan --var gh_token="$GITHUB_PAT" -target=module.seed_bootstrap -target=module.cloudbuild_bootstrap || exit 1
    echo -e "\nPlease review the plan, press Enter to continue with apply..."
    read -r
    echo "Spinning up cicd and seed project and getting bucket name for setting up of backend"
    terraform -chdir=../../0-bootstrap apply -var=gh_token="$GITHUB_PAT" -target=module.seed_bootstrap -target=module.cloudbuild_bootstrap --auto-approve || exit 1
    ## complete deployment
    terraform -chdir=../../0-bootstrap apply -var=gh_token="$GITHUB_PAT" --auto-approve || exit 1
    BKT_NAME=$(terraform -chdir=../../0-bootstrap output -raw gcs_bucket_tfstate || exit 1)
    PRJ_CICD_NAME=$(terraform -chdir=../../0-bootstrap output -raw cloudbuild_project_id || exit 1)
    RUNNER_LABEL=$(terraform -chdir=../../0-bootstrap output -json | jq -r '.runner_labels.value' || exit 1)
    REPO_NAME=$(terraform -chdir=../../0-bootstrap output -raw gar_repo_name || exit 1)
    GCP_REGION=$(terraform -chdir=../../0-bootstrap output -raw gcp_region || exit 1)
    PRJ_NAME=$(terraform -chdir=../../0-bootstrap output -raw project_name || exit 1)
    export GITHUB_OWNER=$(terraform -chdir=../../0-bootstrap output -raw runner_repo_owner || exit 1)
    RNR_REPO_NAME=$(terraform -chdir=../../0-bootstrap output -raw runner_repo_name || exit 1)
    SECRET_KEY=$(terraform -chdir=../../0-bootstrap output -raw git_pvt_key_scrt_name || exit 1)
    echo "Updating backend.tf with bucket name: $BKT_NAME"
    ## Updating the backend.tf file in the 0-bootstrap
    ## shellcheck disable=SC2086
    m4 -D UPDATE_BACKEND_BUCKET=${BKT_NAME} ../../0-bootstrap/backend.tf.example >../../0-bootstrap/backend.tf
    cat ../../0-bootstrap/backend.tf
    rm ../../0-bootstrap/backend.tf.example

    echo "Migrating terraform to remote bucket: $BKT_NAME"

    cat ../../0-bootstrap/backend.tf
    echo yes | terraform -chdir=../../0-bootstrap init -migrate-state || exit 1
    echo "Deploying the runners in managed instance-group inside cicd project..."
    terraform -chdir=../../0-bootstrap apply -var=gh_token="$GITHUB_PAT" --auto-approve || exit 1
  else
    echo -e "${RED}0-bootstrap directory not found. Quitting" && exit 1
  fi

  ## convert workflow file templates to yml and update project id / runner labels
  if [[ -d "../../.github/workflows/" ]]; then
    for f in ../../.github/workflows/*.yml.example; do
    if echo $f | grep  ".*BU_NAME.*" > /dev/null
    then
      echo "BU_NAME found in the workflow filename $f. Skipping, execute create_bu to create the BU structure."
    else
    m4 \
      -D PRJ_B_CICD_XXXX=${PRJ_CICD_NAME} \
      -D INSERT_RUNNER_LABEL=${RUNNER_LABEL} \
      -D INSERT_MAIN_BRANCH="${PRJ_NAME}-main" \
      -D GITHUB_OWNER=${GITHUB_OWNER} \
      -D INSERT_BUCKET_NAME=${BKT_NAME} \
      -D INSERT_GAR_REGION=${GCP_REGION} \
      -D INSERT_SECRET_KEY=${SECRET_KEY} \
      -D REPO_NAME=${RNR_REPO_NAME} ${f} >"${f%.yml.example}.yml"
    rm ${f}
    fi
    done

    find ../.. -not -path "*/4-projects/*" -not -path "*/5-app-infra/*" -type f \( -name 'backend.tf' -o -name 'remote-state.tf' -o -name 'locals.tf' \) -prune ! -type l -print -print -exec bash -c "m4 -D UPDATE_BACKEND_BUCKET=${BKT_NAME} {} > {}.m4 && cat {}.m4 > {} && rm {}.m4" \;

    if [[ -d "../../build/" ]]; then
      find ../../build -type f -iname "*.yml" -exec bash -c "m4 -D UPDATE_BACKEND_BUCKET=${BKT_NAME} -D GCP_REGION=${GCP_REGION} -D GAR_REPO_NAME=${REPO_NAME} -D INSERT_SECRET_KEY=${SECRET_KEY} -D PRJ_NAME=${PRJ_NAME} -D RNR_REPO_NAME=${RNR_REPO_NAME} -D INSERT_GAR_REGION=${GCP_REGION} {} > {}.m4  && cat {}.m4 > {} && rm {}.m4" \;
    fi

    m4 \
    -D REPO_NAME=${RNR_REPO_NAME} \
    -D INSERT_MAIN_BRANCH="${PRJ_NAME}-main" ../../README.md >../../README.md.m4
    cat ../../README.md.m4 >../../README.md
    rm ../../README.md.m4

    ## deploying gh-secret
    terraform -chdir=../ init || exit 1
    terraform -chdir=../ apply -var=gh_token=$GITHUB_PAT -var=runner_repo_name=$RNR_REPO_NAME -var=project_id=$PRJ_CICD_NAME -var=project_name=$PRJ_NAME -var=git_pvt_key_scrt_name=$SECRET_KEY --auto-approve || exit 1
  else
    echo -e "${RED}.github/workflows/ directory not found. Quitting" && exit 1
  fi
else
  echo -e "${RED} environment variable GITHUB_PAT not found or contains null value\n Please set the environment variable. \n Exiting..."
  exit 3
fi

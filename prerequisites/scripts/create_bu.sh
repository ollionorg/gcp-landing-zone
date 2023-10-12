#!/bin/bash

# This script will be executed to create the folder structure under 4-projects and later stages according to the Business Units provided
# The script will take bu_name and bu_code

if [ $# == 2 ]
then

  PWD=$(pwd | awk -F"/" '{print $(NF-1)"/"$NF}')

  if [ ${PWD} == "prerequisites/scripts" ]
  then

    BKT_NAME=$(terraform -chdir=../../0-bootstrap output -raw gcs_bucket_tfstate || exit 1)
    PRJ_CICD_NAME=$(terraform -chdir=../../0-bootstrap output -raw cloudbuild_project_id || exit 1)
    RUNNER_LABEL=$(terraform -chdir=../../0-bootstrap output -json | jq -r '.runner_labels.value' || exit 1)
    REPO_NAME=$(terraform -chdir=../../0-bootstrap output -raw gar_repo_name || exit 1)
    GCP_REGION=$(terraform -chdir=../../0-bootstrap output -raw gcp_region || exit 1)
    PRJ_NAME=$(terraform -chdir=../../0-bootstrap output -raw project_name || exit 1)
    export GITHUB_OWNER=$(terraform -chdir=../../0-bootstrap output -raw runner_repo_owner || exit 1)
    RNR_REPO_NAME=$(terraform -chdir=../../0-bootstrap output -raw runner_repo_name || exit 1)

    BU_NAME="${1}"
    BU_CODE="${2}"

    #4-projects
    NEW_BU_FOLDER="../../4-projects/${BU_NAME}"

    cp -r ../../4-projects/BU_NAME ${NEW_BU_FOLDER}

    echo -e "bu_name = \"${BU_NAME}\"\nbu_code = \"${BU_CODE}\"" > ${NEW_BU_FOLDER}/development/bu.auto.tfvars
    echo -e "bu_name = \"${BU_NAME}\"\nbu_code = \"${BU_CODE}\"" > ${NEW_BU_FOLDER}/staging/bu.auto.tfvars
    echo -e "bu_name = \"${BU_NAME}\"\nbu_code = \"${BU_CODE}\"" > ${NEW_BU_FOLDER}/production/bu.auto.tfvars
    echo -e "bu_name = \"${BU_NAME}\"\nbu_code = \"${BU_CODE}\"" > ${NEW_BU_FOLDER}/shared/bu.auto.tfvars


    find ${NEW_BU_FOLDER} -type f -iname "*.md"\
    -exec bash -c "m4 -D BU_NAME=${BU_NAME} -D BU_NAME_shared=${BU_NAME}_shared \
    -D BU_NAME_development=${BU_NAME}_development \
    -D BU_NAME_shared=${BU_NAME}_shared -D BU_NAME_staging=${BU_NAME}_staging \
    -D BU_NAME_production=${BU_NAME}_production {} > {}.m4  && cat {}.m4 > {} && rm {}.m4" \;

    find ${NEW_BU_FOLDER} -type f \( -name 'backend.tf' -o -name 'remote-state.tf' -o -name 'locals.tf' \) \
    -prune ! -type l -print -print  -exec bash -c "m4 \
    -D BU_NAME=${BU_NAME} -D BU_NAME_shared=${BU_NAME}_shared \
    -D BU_NAME_development=${BU_NAME}_development \
    -D BU_NAME_staging=${BU_NAME}_staging -D BU_NAME_production=${BU_NAME}_production \
    -D UPDATE_BACKEND_BUCKET=${BKT_NAME} {} > {}.m4 && cat {}.m4 > {} && rm {}.m4" \;

    #5-app-infra
    NEW_BU_FOLDER_APP="../../5-app-infra/${BU_NAME}"

    cp -r ../../5-app-infra/BU_NAME ${NEW_BU_FOLDER_APP}

    echo -e "bu_name = \"${BU_NAME}\"\nbu_code = \"${BU_CODE}\"" > ${NEW_BU_FOLDER_APP}/development/bu.auto.tfvars
    echo -e "bu_name = \"${BU_NAME}\"\nbu_code = \"${BU_CODE}\"" > ${NEW_BU_FOLDER_APP}/staging/bu.auto.tfvars
    echo -e "bu_name = \"${BU_NAME}\"\nbu_code = \"${BU_CODE}\"" > ${NEW_BU_FOLDER_APP}/production/bu.auto.tfvars

    find ${NEW_BU_FOLDER_APP} -type f -iname "*.md"\
    -exec bash -c "m4 -D BU_NAME=${BU_NAME} -D BU_NAME_shared=${BU_NAME}_shared \
    -D BU_NAME_development=${BU_NAME}_development \
    -D BU_NAME_shared=${BU_NAME}_shared -D BU_NAME_staging=${BU_NAME}_staging \
    -D BU_NAME_production=${BU_NAME}_production {} > {}.m4  && cat {}.m4 > {} && rm {}.m4" \;

    find ${NEW_BU_FOLDER_APP} -type f \( -name 'backend.tf' -o -name 'remote-state.tf' -o -name 'locals.tf' \) \
    -prune ! -type l -print -print  -exec bash -c "m4 \
    -D BU_NAME=${BU_NAME} -D BU_NAME_shared=${BU_NAME}_shared \
    -D BU_NAME_development=${BU_NAME}_development \
    -D BU_NAME_staging=${BU_NAME}_staging -D BU_NAME_production=${BU_NAME}_production \
    -D UPDATE_BACKEND_BUCKET=${BKT_NAME} {} > {}.m4 && cat {}.m4 > {} && rm {}.m4" \;
    find ../../.github/workflows -type f -iname "*BU_NAME*.yml.example" -exec bash -c ' cp $0 ${0/BU_NAME/'$BU_NAME'}' {} \;

    for f in ../../.github/workflows/*${BU_NAME}*
    do
      m4 \
        -D BU_NAME=${BU_NAME} \
        -D PRJ_B_CICD_XXXX=${PRJ_CICD_NAME} \
        -D INSERT_RUNNER_LABEL=${RUNNER_LABEL} \
        -D INSERT_MAIN_BRANCH="${PRJ_NAME}-main" \
        -D GITHUB_OWNER=${GITHUB_OWNER} \
        -D INSERT_BUCKET_NAME=${BKT_NAME} \
        -D REPO_NAME=${RNR_REPO_NAME}\
        ${f} >"${f%.yml.example}.yml"
    done

    rm ../../.github/workflows/*${BU_NAME}*.example

  else
    echo "The script should be executed from prerequisites/scripts folder."
  fi

else
  echo "$0 bu_name bu_code"
fi
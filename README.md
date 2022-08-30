changequote(,)
# Landing zone using Google Cloud Foundation

## Status Checks
| Stage Name                          | Plan Status                                                                                                                                                                                                                                              | Deployment Status                                                                                                                                                                                                                                                           |
|-------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0-bootstrap                         | [![0-bootstrap](https://github.com/cldcvr/REPO_NAME/actions/workflows/0-bootstrap.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/0-bootstrap.yml)                                                       | [![0-bootstrap - deploy](https://github.com/cldcvr/REPO_NAME/actions/workflows/0-bootstrap-main.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/0-bootstrap-main.yml)                                                       |
| 1-org                               | [![1-org](https://github.com/cldcvr/REPO_NAME/actions/workflows/1-org.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/1-org.yml)                                                                         | [![1-org - deploy](https://github.com/cldcvr/REPO_NAME/actions/workflows/1-org-main.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/1-org-main.yml)                                                                         |
| 2-env (development)                 | [![2-env - development](https://github.com/cldcvr/REPO_NAME/actions/workflows/2-env-development.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/2-env-development.yml)                                   | [![2-env - development - deploy](https://github.com/cldcvr/REPO_NAME/actions/workflows/2-env-development-main.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/2-env-development-main.yml)                                   |
| 2-env (staging)                     | [![2-env - staging](https://github.com/cldcvr/REPO_NAME/actions/workflows/2-env-staging.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/2-env-staging.yml)                                               | [![2-env - staging - deploy](https://github.com/cldcvr/REPO_NAME/actions/workflows/2-env-staging-main.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/2-env-staging-main.yml)                                               |
| 2-env (production)                  | [![2-env - production](https://github.com/cldcvr/REPO_NAME/actions/workflows/2-env-production.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/2-env-production.yml)                                      | [![2-env - production - deploy](https://github.com/cldcvr/REPO_NAME/actions/workflows/2-env-production-main.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/2-env-production-main.yml)                                      |
| 3-networks (shared)                 | [![3-networks - shared](https://github.com/cldcvr/REPO_NAME/actions/workflows/3-networks-shared.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/3-networks-shared.yml)                                   | [![3-networks - shared - deploy](https://github.com/cldcvr/REPO_NAME/actions/workflows/3-networks-shared-main.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/3-networks-shared-main.yml)                                   |
| 3-networks (development)            | [![3-networks - development](https://github.com/cldcvr/REPO_NAME/actions/workflows/3-networks-development.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/3-networks-development.yml)                    | [![3-networks - development - deploy](https://github.com/cldcvr/REPO_NAME/actions/workflows/3-networks-development-main.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/3-networks-development-main.yml)                    |
| 3-networks (staging)                | [![3-networks - staging](https://github.com/cldcvr/REPO_NAME/actions/workflows/3-networks-staging.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/3-networks-staging.yml)                                | [![3-networks - staging - deploy](https://github.com/cldcvr/REPO_NAME/actions/workflows/3-networks-staging-main.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/3-networks-staging-main.yml)                                |
| 3-networks (production)             | [![3-networks - production](https://github.com/cldcvr/REPO_NAME/actions/workflows/3-networks-production.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/3-networks-production.yml)                       | [![3-networks - production - deploy](https://github.com/cldcvr/REPO_NAME/actions/workflows/3-networks-production-main.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/3-networks-production-main.yml)                       |
| 4-projects - BU_NAME (shared)       | [![4-projects - shared](https://github.com/cldcvr/REPO_NAME/actions/workflows/4-projects-shared-BU_NAME.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/4-projects-shared-BU_NAME.yml)                   | [![4-projects - shared - deploy](https://github.com/cldcvr/REPO_NAME/actions/workflows/4-projects-shared-main-BU_NAME.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/4-projects-shared-main-BU_NAME.yml)                   |
| 4-projects - BU_NAME (development)  | [![4-projects - development](https://github.com/cldcvr/REPO_NAME/actions/workflows/4-projects-development-BU_NAME.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/4-projects-development-BU_NAME.yml)    | [![4-projects - development - deploy](https://github.com/cldcvr/REPO_NAME/actions/workflows/4-projects-development-main-BU_NAME.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/4-projects-development-main-BU_NAME.yml)    |
| 4-projects - BU_NAME (staging)      | [![4-projects - staging](https://github.com/cldcvr/REPO_NAME/actions/workflows/4-projects-staging-BU_NAME.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/4-projects-development-BU_NAME.yml)            | [![4-projects - development - deploy](https://github.com/cldcvr/REPO_NAME/actions/workflows/4-projects-staging-main-BU_NAME.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/4-projects-staging-main-BU_NAME.yml)            |
| 4-projects - BU_NAME (production)   | [![4-projects - production](https://github.com/cldcvr/REPO_NAME/actions/workflows/4-projects-production-BU_NAME.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/4-projects-production-BU_NAME.yml)       | [![4-projects - production - deploy](https://github.com/cldcvr/REPO_NAME/actions/workflows/4-projects-production-main-BU_NAME.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/4-projects-production-main-BU_NAME.yml)       |
| 5-app-infra - BU_NAME (development) | [![5-app-infra - development](https://github.com/cldcvr/REPO_NAME/actions/workflows/5-app-infra-development-BU_NAME.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/5-app-infra-development-BU_NAME.yml) | [![5-app-infra - development - deploy](https://github.com/cldcvr/REPO_NAME/actions/workflows/5-app-infra-development-main-BU_NAME.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/5-app-infra-development-main-BU_NAME.yml) |
| 5-app-infra - BU_NAME (staging)     | [![5-app-infra - staging](https://github.com/cldcvr/REPO_NAME/actions/workflows/5-app-infra-staging-BU_NAME.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/5-app-infra-staging-BU_NAME.yml)             | [![5-app-infra - staging - deploy](https://github.com/cldcvr/REPO_NAME/actions/workflows/5-app-infra-staging-main-BU_NAME.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/5-app-infra-staging-main-BU_NAME.yml)             |
| 5-app-infra - BU_NAME (production)  | [![5-app-infra - production](https://github.com/cldcvr/REPO_NAME/actions/workflows/5-app-infra-production-BU_NAME.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/5-app-infra-production-BU_NAME.yml)    | [![5-app-infra - production - deploy](https://github.com/cldcvr/REPO_NAME/actions/workflows/5-app-infra-production-main-BU_NAME.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/5-app-infra-production-main-BU_NAME.yml)    |
| KCC (Add-On)                        | [![KCC](https://github.com/cldcvr/REPO_NAME/actions/workflows/kcc-configure.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/kcc-configure.yml)                                                           | [![KCC - deploy](https://github.com/cldcvr/REPO_NAME/actions/workflows/kcc-configure.yml/badge.svg?branch=INSERT_MAIN_BRANCH)](https://github.com/cldcvr/REPO_NAME/actions/workflows/kcc-configure.yml)                                                                     |

# Resources
https://cloud.google.com/architecture/security-foundations/using-example-terraform


# Repo directory structure

Please follow the below directory structure

```
repo:
|- 0-bootstrap
   |- <terraform_code>
|- 1-org
   |- <terraform_code>
|- 2-env
   |- <terraform_code>
|- 3-networks
   |- <terraform_code>
|- 4-projects
   |- <terraform_code>
|- 5-app-infra
   |- <terraform_code>
|- 6-anthos
   |- <application_manifests>   
|- kcc
   |- <terraform_code>
   |- <resource_manifests>
|- modules
   |- <terraform_module_folder_1>
   |- <terraform_module_folder_2>
```

---

## Prerequisites

To run the commands described in this document, you need to have the following
installed:

- The [Google Cloud SDK](https://cloud.google.com/sdk/install) version 319.0.0 or later
- [Terraform](https://www.terraform.io/downloads.html) version 1.0.9.
- An existing project which the user has access to be used by terraform-validator.

> Make sure that you use the same version of Terraform throughout this series. Otherwise, you might experience Terraform state snapshot lock errors.

1. Set up a Google Cloud [organization](https://cloud.google.com/resource-manager/docs/creating-managing-organization).
2. Set up a Google Cloud [billing account](https://cloud.google.com/billing/docs/how-to/manage-billing-account).
   * Make note of the billing ID.
   * Add it to the tfvars in the 0-bootstrap.
   * **Ensure the quotas for associating projects with billing account is increased to 50.**
3. Configure Authentication - Create Cloud Identity or Google Workspace (formerly G Suite) groups for organization and billing admins.
4. Create a group in gcp which will act as `group_org_admins` and grant that group below permissions
   * `roles/resourcemanager.projectCreator`
   * `roles/resourcemanager.organizationAdmin`
   * `roles/billing.admin`
   * `roles/resourcemanager.folderCreator`
5. Ensure the user deploying the initial code should be present in the `group_org_admins` group.
6. Add the service account associated with GitHub Actions and Cloud Build to the `group_org_admins` group. They must be in this group, or they won't have `roles/resourcemanager.projectCreator` access.

For more information about the permissions that are required, and the resources that are created, see the organization bootstrap module [documentation.](https://github.com/terraform-google-modules/terraform-google-bootstrap)

# Deploying with GitHub Actions/Cloud Build

* `REPO_NAME` code is present on GitHub, with Github Actions enabled.
* GitHub Actions will plan and on success, will submit builds to Cloud Build, depending on the type of workflow defined.
* Cloud Build will deploy the terraform code accordingly.

## Deployment Process
1. Create a new branch from the main branch which will be in template form, New branch name should be `${bu_name}-init`.
2. Create bot machine user and a GitHub Token with repo `read:org` and `read:discussions`.
3. Add relevant values to the terraform.tfvars of 0-bootstrap in the new branch. [Understanding user inputs for LZ](https://cldcvr.atlassian.net/wiki/spaces/GCF/pages/18562875393)
4. Add correct billing ID in the terraform.tfvars file for the initial deployment of the 0-bootstrap stage.
5. `bu_code` variables must **not be greater than 3 characters**.
6. Create Slack WebHook Secret in GitHub `GCF_SLACK_WEBHOOK`, GitHub Token Secret in GitHub as `GH_TOKEN`.
7. Setup `GH_TOKEN` as `$GITHUB_PAT` environment variable and execute the wrapper script using below commands:
```bash
$ cd ./prerequisites/scripts

$ read -s GITHUB_PAT
<enter_github_token_obtained_in_step_9>

$ chmod +x wrapper.sh ; ./wrapper.sh
```
8. After execution of wrapper script, add cloudbuild service account from cicd project as a principal in the billing account with `billing.administrator` and `billing.user`
9. Wrapper script will create following branch protection rules for branch `${prj_name}-main`
```bash
Require a pull request before merging.
Required two number of approvals before merging
Dismiss stale pull request approvals when new commits are pushed
Require review from Code Owners
Require status checks to pass before merging
Require branches to be up to date before merging
Require conversation resolution before merging.
Require signed commits.
Requires administrator
Allow auto-merge and allow auto-deletion of branches
```
10. Commit and push changes from `.github/workflows`, `build`, `0-bootstrap`, `README.md` to `${prj_name}-init` and ensure everything gets successfully applied.
11. On GitHub, create a new branch `${prj_name}-main` from the main branch and create a pull request to merge the changes from step 14 into `${prj_name}-main` from `${bu_name}-init`.
12. Start deployment by raising PRs for subsequent stages by pushing the backend.tf changes made by wrapper script for each stage in `${prj_name}-init`.
    For more information refer [GCF Landing Zone Prerequisites Checklist](https://cldcvr.atlassian.net/l/c/1pEg9eMn)

## Troubleshooting

Please refer to [troubleshooting](../docs/TROUBLESHOOTING.md) if you run into issues during this step.

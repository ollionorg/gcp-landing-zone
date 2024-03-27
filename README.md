
![OLLION](https://github.com/ollionorg/gcp-landing-zone/assets/88661454/464b63a2-b85b-4a82-a376-f11b72b639bf)

# Google Cloud Foundation Landing Zone

[![Documentation](https://img.shields.io/badge/Wiki-User_Guide-red?logo=read-the-docs)](https://github.com/ollionorg/gcp-landing-zone/wiki/User-Guide)
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Discord](https://discordapp.com/api/guilds/1212635303412506694/widget.png?style=shield)](https://discord.gg/PCyyu2Xq)
[![Reports](https://img.shields.io/badge/Compliance_report-100%25-green.svg)](https://github.com/ollionorg/gcp-landing-zone/wiki/User-Guide#how-compliant-your-landing-zone-to-well-known-best-practices)


This repository contains the Terraform code necessary to set up a Landing Zone using the Google Cloud Platform (GCP). It is designed to follow best practices outlined in the Google Cloud Architecture's Security Foundations. By leveraging this code, users can create a secure, scalable, and efficient cloud environment that aligns with Google's recommended practices.


**[Landing Zone User Guide](https://github.com/ollionorg/gcp-landing-zone/wiki/User-Guide)**

## Repository Directory Structure

To maintain organization and facilitate navigation, this repository is structured as follows:

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

## Software Prerequisites 

To run the commands described in this document, you need to have the following installed:

- **Google Cloud SDK:** Version 319.0.0 or later. [Install Guide](https://cloud.google.com/sdk/install)
- **Terraform:** Version 1.0.9. [Download](https://www.terraform.io/downloads.html)
- **Git:** Version v2.38.1


## Prerequisites

Before you begin deploying the Landing Zone, ensure you have the following prerequisites in place:

> **Note:** Consistency in Terraform version is crucial to avoid state lock errors. Follow the steps below to set up your environment correctly:

1. **Google Cloud Organization:** Set up as described [here](https://cloud.google.com/resource-manager/docs/creating-managing-organization).
2. **Billing Account:** Create and manage as per instructions [here](https://cloud.google.com/billing/docs/how-to/manage-billing-account). Remember to:
   - Note the billing ID.
   - Increase the quota for associating projects to 50.
3. **Authentication:** Configure by creating Cloud Identity or Google Workspace groups for admins.
4. **Permissions:** Create a `group_org_admins` group and assign necessary roles including 
     - `roles/resourcemanager.projectCreator`
     - `roles/resourcemanager.folderCreator `
     - `roles/resourcemanager.organizationAdmin`
     - `roles/billing.admin`.
5. **Service Accounts:** Ensure GitHub Actions and Cloud Build service accounts are added to the `group_org_admins`.

For a detailed setup, refer to the [organization bootstrap module documentation](https://github.com/terraform-google-modules/terraform-google-bootstrap).

## Deployment Process

### Step 0 - Forking Github repo

Follow the steps to fork or clone the landing zone GITHUB repo on your local machine:

1. Create bot machine user and create a personal access token (PAT) on GitHub for user .
   Grants access to PAT as following permission `read:org` and `read:discussions`.   
   `Goto GitHub profile` > `Settings` > `Developer Settings` > `Personal Access Tokens` > `Generate New Token`. Note the new token value.
2. Create GitHub Token Secret in GitHub as  `GH_TOKEN`.
3. Clone the repo:
      ```
      git clone https://github.com/ollionorg/gcp-landing-zone.git
      ```

### Step 1 - Collect configuration information

> The following steps should be executed on your local system to initialize and run the bootstrap phase for the GCP landing zone.

1. Ensure the tf variable file inside the file [0-bootstrap/terraform.tfvars](https://github.com/ollionorg/gcp-landing-zone/blob/main/0-bootstrap/terraform.tfvars) are properly set and commit the changes to the repository. For setting the parameters, please refer to the [input documentation](https://github.com/ollionorg/gcp-landing-zone/blob/main/0-bootstrap/README.md#inputs).
2. Add correct billing ID in the `0-bootstrap/terraform.tfvars` file for the initial deployment of the 0-bootstrap stage.
3. Optional if required, Create Slack WebHook Secret in GitHub `GCF_SLACK_WEBHOOK`.
5. Setup `GH_TOKEN` as `$GITHUB_PAT` environment variable and execute the [wrapper script](https://github.com/ollionorg/gcp-landing-zone/blob/main/prerequisites/scripts/wrapper.sh) using below commands (Ensure .terraform directories created locally from previous runs are deleted):
   ```
      $ cd ./prerequisites/scripts

         $ read -s token
         <enter_github_token_obtained_in_step_9>

         $ export GITHUB_PAT=$token

         $ chmod +x wrapper.sh ; ./wrapper.sh
   ```
6. After execution of wrapper script, add cloudbuild service account from cicd project as a principal in the billing account with `billing.administrator` and `billing.user`
7. Wrapper script will create following branch protection rules for branch `${bu_name}-main`.
   ```
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
8. Commit and push changes from `.github/workflows`, `build`, `0-bootstrap`, `README.md` to `${bu_name}-init` and ensure everything gets successfully applied. 
9. Start deployment by raising PRs for subsequent stages by pushing the backend.tf changes made by wrapper script for each stage in ${bu_name}-init.

      
## Troubleshooting

Describe the problem clearly and send an email to lzhelp@ollion.com.


![OLLION](img/OLLION_BANNER.png)

# AWS Landing Zone
[![Documentation](https://img.shields.io/badge/Wiki-User_Guide-red?logo=read-the-docs)](https://github.com/ollionorg/aws-landing-zone/wiki/User-Guide)
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Discord](https://discordapp.com/api/guilds/1212635303412506694/widget.png?style=shield)](https://discord.gg/aY8EBx4t)
[![Reports](https://img.shields.io/badge/Compliance_report-100%25-green.svg)](https://github.com/ollionorg/aws-landing-zone/wiki/User-Guide#how-compliant-your-landing-zone-to-well-known-best-practices)



# Google Cloud Foundation Landing Zone

This repository contains the Terraform code necessary to set up a Landing Zone using the Google Cloud Platform (GCP). It is designed to follow best practices outlined in the Google Cloud Architecture's Security Foundations. By leveraging this code, users can create a secure, scalable, and efficient cloud environment that aligns with Google's recommended practices.

## Resources

- **Security Foundations Guide:** [Google Cloud Architecture's Security Foundations](https://cloud.google.com/architecture/security-foundations/using-example-terraform)
- **Landing Zone User Guide:** [Download Here](https://drive.google.com/file/d/1KY_WSmBY3_T5dyMH05WuYZ8siKpDDCZW/view?usp=sharing)

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

## Prerequisites

Before you begin deploying the Landing Zone, ensure you have the following prerequisites in place:

- **Google Cloud SDK:** Version 319.0.0 or later. [Install Guide](https://cloud.google.com/sdk/install)
- **Terraform:** Version 1.0.9. [Download](https://www.terraform.io/downloads.html)
- **Project Access:** You should have access to a Google Cloud project to be used by terraform-validator.

**Note:** Consistency in Terraform version is crucial to avoid state lock errors. Follow the steps below to set up your environment correctly:

1. **Google Cloud Organization:** Set up as described [here](https://cloud.google.com/resource-manager/docs/creating-managing-organization).
2. **Billing Account:** Create and manage as per instructions [here](https://cloud.google.com/billing/docs/how-to/manage-billing-account). Remember to:
   - Note the billing ID.
   - Increase the quota for associating projects to 50.
3. **Authentication:** Configure by creating Cloud Identity or Google Workspace groups for admins.
4. **Permissions:** Create a `group_org_admins` group and assign necessary roles including `roles/resourcemanager.projectCreator`, `roles/billing.admin`, etc.
5. **Service Accounts:** Ensure GitHub Actions and Cloud Build service accounts are added to the `group_org_admins`.

For a detailed setup, refer to the [organization bootstrap module documentation](https://github.com/terraform-google-modules/terraform-google-bootstrap).

## Deployment via GitHub Actions/Cloud Build

To deploy using GitHub Actions and Cloud Build, follow these steps:

1. **Fork the Repository:** Start by forking this repo.
2. **Branch Creation:** Create a `${prj_name}-init` branch from the main branch for template use.
3. **Configure Tokens and Secrets:** Set up a bot machine user, GitHub Token, and Slack WebHook Secret as needed.
4. **Update `terraform.tfvars`:** Include necessary values, especially the correct billing ID in the `0-bootstrap` stage.
5. **Execution of Wrapper Script:** Use the provided script to set up the environment and permissions.
6. **Branch Protection Rules:** Apply rules for PRs, approvals, and status checks as described.

Detailed steps including bot user creation, token configuration, and branch protection rules setup are provided within the deployment section.

## Troubleshooting

Encounter issues? Refer to our [troubleshooting guide](https://drive.google.com/file/d/1KY_WSmBY3_T5dyMH05WuYZ8siKpDDCZW/view) for common problems and solutions.

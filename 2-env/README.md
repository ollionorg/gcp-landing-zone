# 2-environments

## Purpose

The purpose of this step is to setup development, non-production, and production environments within the Google Cloud organization that you've created.

## Prerequisites

1. 0-bootstrap executed successfully.
2. 1-org executed successfully.
3. Cloud Identity / Google Workspace group for monitoring admins.
4. Membership in the monitoring admins group for user running Terraform.
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google.impersonate"></a> [google.impersonate](#provider\_google.impersonate) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_service_account_access_token.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account_access_token) | data source |
| [terraform_remote_state.bootstrap](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.org](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_parent_folder"></a> [parent\_folder](#input\_parent\_folder) | Optional - for an organization with existing projects or for development/validation. It will place all the example foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist. Must be the same value used in previous step. | `string` | `""` | no |

## Outputs

No outputs.

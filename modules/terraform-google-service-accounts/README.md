## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.89 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_billing_account_iam_member.billing_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_account_iam_member) | resource |
| [google_organization_iam_member.billing_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.organization_viewer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.xpn_admin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_project_iam_member.project-roles](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.service_accounts](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_key.keys](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_billing_account_id"></a> [billing\_account\_id](#input\_billing\_account\_id) | If assigning billing role, specificy a billing account (default is to assign at the organizational level). | `string` | `""` | no |
| <a name="input_description"></a> [description](#input\_description) | Default description of the created service accounts (defaults to no description) | `string` | `""` | no |
| <a name="input_descriptions"></a> [descriptions](#input\_descriptions) | List of descriptions for the created service accounts (elements default to the value of `description`) | `list(string)` | `[]` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Display names of the created service accounts (defaults to 'Terraform-managed service account') | `string` | `"Terraform-managed service account"` | no |
| <a name="input_generate_keys"></a> [generate\_keys](#input\_generate\_keys) | Generate keys for service accounts. | `bool` | `false` | no |
| <a name="input_grant_billing_role"></a> [grant\_billing\_role](#input\_grant\_billing\_role) | Grant billing user role. | `bool` | `false` | no |
| <a name="input_grant_xpn_roles"></a> [grant\_xpn\_roles](#input\_grant\_xpn\_roles) | Grant roles for shared VPC management. | `bool` | `true` | no |
| <a name="input_names"></a> [names](#input\_names) | Names of the service accounts to create. | `list(string)` | `[]` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Id of the organization for org-level roles. | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix applied to service account names. | `string` | `""` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project id where service account will be created. | `string` | n/a | yes |
| <a name="input_project_roles"></a> [project\_roles](#input\_project\_roles) | Common roles to apply to all service accounts, project=>role as elements. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_email"></a> [email](#output\_email) | Service account email (for single use). |
| <a name="output_emails"></a> [emails](#output\_emails) | Service account emails by name. |
| <a name="output_emails_list"></a> [emails\_list](#output\_emails\_list) | Service account emails as list. |
| <a name="output_iam_email"></a> [iam\_email](#output\_iam\_email) | IAM-format service account email (for single use). |
| <a name="output_iam_emails"></a> [iam\_emails](#output\_iam\_emails) | IAM-format service account emails by name. |
| <a name="output_iam_emails_list"></a> [iam\_emails\_list](#output\_iam\_emails\_list) | IAM-format service account emails as list. |
| <a name="output_key"></a> [key](#output\_key) | Service account key (for single use). |
| <a name="output_keys"></a> [keys](#output\_keys) | Map of service account keys. |
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | Service account resource (for single use). |
| <a name="output_service_accounts"></a> [service\_accounts](#output\_service\_accounts) | Service account resources as list. |
| <a name="output_service_accounts_map"></a> [service\_accounts\_map](#output\_service\_accounts\_map) | Service account resources by name. |

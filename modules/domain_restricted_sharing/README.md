
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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_allowed-policy-member-domains"></a> [allowed-policy-member-domains](#module\_allowed-policy-member-domains) | ../../modules/org_policies | n/a |

## Resources

| Name | Type |
|------|------|
| [google_organization.orgs](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domains_to_allow"></a> [domains\_to\_allow](#input\_domains\_to\_allow) | The list of domains to allow users from | `list(string)` | n/a | yes |
| <a name="input_exclude_folders"></a> [exclude\_folders](#input\_exclude\_folders) | Set of folders to exclude from the policy | `set(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_exclude_projects"></a> [exclude\_projects](#input\_exclude\_projects) | Set of projects to exclude from the policy | `set(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The folder id for putting the policy | `string` | `null` | no |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | The organization id for putting the policy | `string` | `null` | no |
| <a name="input_policy_for"></a> [policy\_for](#input\_policy\_for) | Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project id for putting the policy | `string` | `null` | no |

## Outputs

No outputs.

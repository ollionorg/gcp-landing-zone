
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_compute-skip-default-network"></a> [compute-skip-default-network](#module\_compute-skip-default-network) | ../../modules/org_policies | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_exclude_folders"></a> [exclude\_folders](#input\_exclude\_folders) | List of folders to exclude from the policy | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_exclude_projects"></a> [exclude\_projects](#input\_exclude\_projects) | Set of projects to exclude from the policy | `set(string)` | <pre>[<br>  ""<br>]</pre> | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The folder id for putting the policy | `string` | `null` | no |
| <a name="input_organization_id"></a> [organization\_id](#input\_organization\_id) | The organization id for putting the policy | `string` | `null` | no |
| <a name="input_policy_for"></a> [policy\_for](#input\_policy\_for) | Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project id for putting the policy | `string` | `null` | no |

## Outputs

No outputs.

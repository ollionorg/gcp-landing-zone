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
| [google_access_context_manager_access_policy.access_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_access_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_parent_id"></a> [parent\_id](#input\_parent\_id) | The parent of this AccessPolicy in the Cloud Resource Hierarchy. As of now, only organization are accepted as parent. | `string` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | The policy's name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | Resource name of the AccessPolicy. |
| <a name="output_policy_name"></a> [policy\_name](#output\_policy\_name) | The policy's name. |

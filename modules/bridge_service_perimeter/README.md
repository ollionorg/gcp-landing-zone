
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
| [google_access_context_manager_service_perimeter.bridge_service_perimeter](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_service_perimeter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description of the bridge perimeter | `string` | `""` | no |
| <a name="input_perimeter_name"></a> [perimeter\_name](#input\_perimeter\_name) | Name of the perimeter. Should be one unified string. Must only be letters, numbers and underscores | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | Name of the parent policy | `string` | n/a | yes |
| <a name="input_resources"></a> [resources](#input\_resources) | A list of GCP resources that are inside of the service perimeter. Currently only projects are allowed. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resources"></a> [resources](#output\_resources) | A list of GCP resources that are inside of the service perimeter. Currently only projects are allowed. |

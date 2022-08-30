
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | >= 3.89 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_vpc_access_connector.connector_beta](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_vpc_access_connector) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project in which the vpc connector will be deployed. | `string` | n/a | yes |
| <a name="input_vpc_connectors"></a> [vpc\_connectors](#input\_vpc\_connectors) | List of VPC serverless connectors. | `list(map(string))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connector_ids"></a> [connector\_ids](#output\_connector\_ids) | VPC serverless connector ID. |

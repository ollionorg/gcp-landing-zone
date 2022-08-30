
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.89 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_organization.org](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | The domain name | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the group. | `string` | `""` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organization ID. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain"></a> [domain](#output\_domain) | The domain of the group's organization. |
| <a name="output_email"></a> [email](#output\_email) | The email address of the group. |
| <a name="output_name"></a> [name](#output\_name) | The username portion of the email address of the group. |

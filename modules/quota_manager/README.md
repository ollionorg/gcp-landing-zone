
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89 |
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
| [google-beta_google_service_usage_consumer_quota_override.override](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_service_usage_consumer_quota_override) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_consumer_quotas"></a> [consumer\_quotas](#input\_consumer\_quotas) | The quotas configuration you want to override for the project. | <pre>list(object({<br>    service = string,<br>    metric  = string,<br>    limit   = string,<br>    value   = string,<br>  }))</pre> | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The GCP project where you want to manage the consumer quotas | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_quota_overrides"></a> [quota\_overrides](#output\_quota\_overrides) | The server-generated names of the quota override. |

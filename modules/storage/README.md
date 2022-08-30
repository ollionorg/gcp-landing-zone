
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
| [google_project_service.enable_destination_api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_storage_bucket.bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_iam_member.storage_sink_member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_expiration_days"></a> [expiration\_days](#input\_expiration\_days) | Object expiration time. If unset logs will never be deleted. | `number` | `null` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | When deleting a bucket, this boolean option will delete all contained objects. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The location of the storage bucket. | `string` | `"US"` | no |
| <a name="input_log_sink_writer_identity"></a> [log\_sink\_writer\_identity](#input\_log\_sink\_writer\_identity) | The service account that logging uses to write log entries to the destination. (This is available as an output coming from the root module). | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which the storage bucket will be created. | `string` | n/a | yes |
| <a name="input_retention_policy"></a> [retention\_policy](#input\_retention\_policy) | Configuration of the bucket's data retention policy for how long objects in the bucket should be retained. | <pre>object({<br>    is_locked             = bool<br>    retention_period_days = number<br>  })</pre> | `null` | no |
| <a name="input_storage_bucket_name"></a> [storage\_bucket\_name](#input\_storage\_bucket\_name) | The name of the storage bucket to be created and used for log entries matching the filter. | `string` | n/a | yes |
| <a name="input_storage_class"></a> [storage\_class](#input\_storage\_class) | The storage class of the storage bucket. | `string` | `"STANDARD"` | no |
| <a name="input_uniform_bucket_level_access"></a> [uniform\_bucket\_level\_access](#input\_uniform\_bucket\_level\_access) | Enables Uniform bucket-level access to a bucket. | `bool` | `true` | no |
| <a name="input_versioning"></a> [versioning](#input\_versioning) | Toggles bucket versioning, ability to retain a non-current object version when the live object version gets replaced or deleted. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_console_link"></a> [console\_link](#output\_console\_link) | The console link to the destination storage bucket |
| <a name="output_destination_uri"></a> [destination\_uri](#output\_destination\_uri) | The destination URI for the storage bucket. |
| <a name="output_project"></a> [project](#output\_project) | The project in which the storage bucket was created. |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | The resource id for the destination storage bucket |
| <a name="output_resource_name"></a> [resource\_name](#output\_resource\_name) | The resource name for the destination storage bucket |
| <a name="output_self_link"></a> [self\_link](#output\_self\_link) | The self\_link URI for the destination storage bucket |

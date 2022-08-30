
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
| [google_logging_billing_account_sink.sink](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_billing_account_sink) | resource |
| [google_logging_folder_sink.sink](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_folder_sink) | resource |
| [google_logging_organization_sink.sink](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_organization_sink) | resource |
| [google_logging_project_sink.sink](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_project_sink) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bigquery_options"></a> [bigquery\_options](#input\_bigquery\_options) | (Optional) Options that affect sinks exporting data to BigQuery. use\_partitioned\_tables - (Required) Whether to use BigQuery's partition tables. | <pre>object({<br>    use_partitioned_tables = bool<br>  })</pre> | `null` | no |
| <a name="input_destination_uri"></a> [destination\_uri](#input\_destination\_uri) | The self\_link URI of the destination resource (This is available as an output coming from one of the destination submodules) | `string` | n/a | yes |
| <a name="input_filter"></a> [filter](#input\_filter) | The filter to apply when exporting logs. Only log entries that match the filter are exported. Default is '' which exports all logs. | `string` | `""` | no |
| <a name="input_include_children"></a> [include\_children](#input\_include\_children) | Only valid if 'organization' or 'folder' is chosen as var.parent\_resource.type. Determines whether or not to include children organizations/folders in the sink export. If true, logs associated with child projects are also exported; otherwise only logs relating to the provided organization/folder are included. | `bool` | `false` | no |
| <a name="input_log_sink_name"></a> [log\_sink\_name](#input\_log\_sink\_name) | The name of the log sink to be created. | `string` | n/a | yes |
| <a name="input_parent_resource_id"></a> [parent\_resource\_id](#input\_parent\_resource\_id) | The ID of the GCP resource in which you create the log sink. If var.parent\_resource\_type is set to 'project', then this is the Project ID (and etc). | `string` | n/a | yes |
| <a name="input_parent_resource_type"></a> [parent\_resource\_type](#input\_parent\_resource\_type) | The GCP resource in which you create the log sink. The value must not be computed, and must be one of the following: 'project', 'folder', 'billing\_account', or 'organization'. | `string` | `"project"` | no |
| <a name="input_unique_writer_identity"></a> [unique\_writer\_identity](#input\_unique\_writer\_identity) | Whether or not to create a unique identity associated with this sink. If false (the default), then the writer\_identity used is serviceAccount:cloud-logs@system.gserviceaccount.com. If true, then a unique service account is created and used for the logging sink. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_filter"></a> [filter](#output\_filter) | The filter to be applied when exporting logs. |
| <a name="output_log_sink_resource_id"></a> [log\_sink\_resource\_id](#output\_log\_sink\_resource\_id) | The resource ID of the log sink that was created. |
| <a name="output_log_sink_resource_name"></a> [log\_sink\_resource\_name](#output\_log\_sink\_resource\_name) | The resource name of the log sink that was created. |
| <a name="output_parent_resource_id"></a> [parent\_resource\_id](#output\_parent\_resource\_id) | The ID of the GCP resource in which you create the log sink. |
| <a name="output_writer_identity"></a> [writer\_identity](#output\_writer\_identity) | The service account that logging uses to write log entries to the destination. |

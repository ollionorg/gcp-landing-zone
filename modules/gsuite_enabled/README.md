
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_gsuite"></a> [gsuite](#requirement\_gsuite) | ~> 0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gsuite"></a> [gsuite](#provider\_gsuite) | ~> 0.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_budget"></a> [budget](#module\_budget) | ../budget | n/a |
| <a name="module_gsuite_group"></a> [gsuite\_group](#module\_gsuite\_group) | ../gsuite_group | n/a |
| <a name="module_project-factory"></a> [project-factory](#module\_project-factory) | ../core_project_factory/ | n/a |
| <a name="module_project_quota_manager"></a> [project\_quota\_manager](#module\_project\_quota\_manager) | ../../modules/quota_manager | n/a |

## Resources

| Name | Type |
|------|------|
| [gsuite_group.group](https://registry.terraform.io/providers/DeviaVir/gsuite/latest/docs/resources/group) | resource |
| [gsuite_group_member.api_s_account_api_sa_group_member](https://registry.terraform.io/providers/DeviaVir/gsuite/latest/docs/resources/group_member) | resource |
| [gsuite_group_member.service_account_sa_group_member](https://registry.terraform.io/providers/DeviaVir/gsuite/latest/docs/resources/group_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | The list of apis to activate within the project | `list(string)` | <pre>[<br>  "compute.googleapis.com"<br>]</pre> | no |
| <a name="input_api_sa_group"></a> [api\_sa\_group](#input\_api\_sa\_group) | A G Suite group to place the Google APIs Service Account for the project in | `string` | `""` | no |
| <a name="input_auto_create_network"></a> [auto\_create\_network](#input\_auto\_create\_network) | Create the default network | `bool` | `false` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate this project with | `any` | n/a | yes |
| <a name="input_bucket_location"></a> [bucket\_location](#input\_bucket\_location) | The location for a GCS bucket to create (optional) | `string` | `""` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | A name for a GCS bucket to create (in the bucket\_project project), useful for Terraform state (optional) | `string` | `""` | no |
| <a name="input_bucket_project"></a> [bucket\_project](#input\_bucket\_project) | A project to create a GCS bucket (bucket\_name) in, useful for Terraform state (optional) | `string` | `""` | no |
| <a name="input_bucket_versioning"></a> [bucket\_versioning](#input\_bucket\_versioning) | Enable versioning for a GCS bucket to create (optional) | `bool` | `false` | no |
| <a name="input_budget_alert_pubsub_topic"></a> [budget\_alert\_pubsub\_topic](#input\_budget\_alert\_pubsub\_topic) | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` | `string` | `null` | no |
| <a name="input_budget_alert_spent_percents"></a> [budget\_alert\_spent\_percents](#input\_budget\_alert\_spent\_percents) | A list of percentages of the budget to alert on when threshold is exceeded | `list(number)` | <pre>[<br>  0.5,<br>  0.7,<br>  1<br>]</pre> | no |
| <a name="input_budget_amount"></a> [budget\_amount](#input\_budget\_amount) | The amount to use for a budget alert | `number` | `null` | no |
| <a name="input_budget_monitoring_notification_channels"></a> [budget\_monitoring\_notification\_channels](#input\_budget\_monitoring\_notification\_channels) | A list of monitoring notification channels in the form `[projects/{project_id}/notificationChannels/{channel_id}]`. A maximum of 5 channels are allowed. | `list(string)` | `[]` | no |
| <a name="input_consumer_quotas"></a> [consumer\_quotas](#input\_consumer\_quotas) | The quotas configuration you want to override for the project. | <pre>list(object({<br>    service = string,<br>    metric  = string,<br>    limit   = string,<br>    value   = string,<br>  }))</pre> | `[]` | no |
| <a name="input_create_group"></a> [create\_group](#input\_create\_group) | Whether to create the group or not | `bool` | `false` | no |
| <a name="input_create_project_sa"></a> [create\_project\_sa](#input\_create\_project\_sa) | Whether the default service account for the project shall be created | `bool` | `true` | no |
| <a name="input_credentials_path"></a> [credentials\_path](#input\_credentials\_path) | Path to a service account credentials file with rights to run the Project Factory. If this file is absent Terraform will fall back to Application Default Credentials. | `string` | `""` | no |
| <a name="input_default_service_account"></a> [default\_service\_account](#input\_default\_service\_account) | Project default service account setting: can be one of `delete`, `deprivilege`, `disable`, or `keep`. | `string` | `"disable"` | no |
| <a name="input_disable_dependent_services"></a> [disable\_dependent\_services](#input\_disable\_dependent\_services) | Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed. | `bool` | `true` | no |
| <a name="input_disable_services_on_destroy"></a> [disable\_services\_on\_destroy](#input\_disable\_services\_on\_destroy) | Whether project services will be disabled when the resources are destroyed | `bool` | `true` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | The domain name (optional). | `string` | `""` | no |
| <a name="input_enable_shared_vpc_host_project"></a> [enable\_shared\_vpc\_host\_project](#input\_enable\_shared\_vpc\_host\_project) | If this project is a shared VPC host project. If true, you must *not* set shared\_vpc variable. Default is false. | `bool` | `false` | no |
| <a name="input_enable_shared_vpc_service_project"></a> [enable\_shared\_vpc\_service\_project](#input\_enable\_shared\_vpc\_service\_project) | If shared VPC should be used | `bool` | `false` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of a folder to host this project | `string` | `""` | no |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | A group to control the project by being assigned group\_role - defaults to ${project\_name}-editors | `string` | `""` | no |
| <a name="input_group_role"></a> [group\_role](#input\_group\_role) | The role to give the controlling group (group\_name) over the project (defaults to project editor) | `string` | `"roles/editor"` | no |
| <a name="input_impersonate_service_account"></a> [impersonate\_service\_account](#input\_impersonate\_service\_account) | An optional service account to impersonate. If this service account is not specified, Terraform will fall back to credential file or Application Default Credentials. | `string` | `""` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Map of labels for project | `map(string)` | `{}` | no |
| <a name="input_lien"></a> [lien](#input\_lien) | Add a lien on the project to prevent accidental deletion | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name for the project | `any` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organization ID. | `any` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID to give the project. If not provided, the `name` will be used. | `string` | `""` | no |
| <a name="input_project_sa_name"></a> [project\_sa\_name](#input\_project\_sa\_name) | Default service account name for the project. | `string` | `"project-service-account"` | no |
| <a name="input_random_project_id"></a> [random\_project\_id](#input\_random\_project\_id) | Adds a suffix of 4 random characters to the `project_id` | `bool` | `false` | no |
| <a name="input_sa_group"></a> [sa\_group](#input\_sa\_group) | A G Suite group to place the default Service Account for the project in | `string` | `""` | no |
| <a name="input_sa_role"></a> [sa\_role](#input\_sa\_role) | A role to give the default Service Account for the project (defaults to none) | `string` | `""` | no |
| <a name="input_shared_vpc"></a> [shared\_vpc](#input\_shared\_vpc) | The ID of the host project which hosts the shared VPC | `string` | `""` | no |
| <a name="input_shared_vpc_subnets"></a> [shared\_vpc\_subnets](#input\_shared\_vpc\_subnets) | List of subnets fully qualified subnet IDs (ie. projects/$project\_id/regions/$region/subnetworks/$subnet\_id) | `list(string)` | `[]` | no |
| <a name="input_usage_bucket_name"></a> [usage\_bucket\_name](#input\_usage\_bucket\_name) | Name of a GCS bucket to store GCE usage reports in (optional) | `string` | `""` | no |
| <a name="input_usage_bucket_prefix"></a> [usage\_bucket\_prefix](#input\_usage\_bucket\_prefix) | Prefix in the GCS bucket to store GCE usage reports in (optional) | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain"></a> [domain](#output\_domain) | The organization's domain |
| <a name="output_group_email"></a> [group\_email](#output\_group\_email) | The email of the created G Suite group with group\_name |
| <a name="output_group_name"></a> [group\_name](#output\_group\_name) | The group\_name of the G Suite group |
| <a name="output_project_bucket_self_link"></a> [project\_bucket\_self\_link](#output\_project\_bucket\_self\_link) | Project's bucket selfLink |
| <a name="output_project_bucket_url"></a> [project\_bucket\_url](#output\_project\_bucket\_url) | Project's bucket url |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | n/a |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | n/a |
| <a name="output_project_number"></a> [project\_number](#output\_project\_number) | n/a |
| <a name="output_service_account_display_name"></a> [service\_account\_display\_name](#output\_service\_account\_display\_name) | The display name of the default service account |
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | The email of the default service account |
| <a name="output_service_account_id"></a> [service\_account\_id](#output\_service\_account\_id) | The id of the default service account |
| <a name="output_service_account_name"></a> [service\_account\_name](#output\_service\_account\_name) | The fully-qualified name of the default service account |
| <a name="output_service_account_unique_id"></a> [service\_account\_unique\_id](#output\_service\_account\_unique\_id) | The unique id of the default service account |


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
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_base_shared_vpc_host_project"></a> [base\_shared\_vpc\_host\_project](#module\_base\_shared\_vpc\_host\_project) | ../../modules/base_shared_vpc_host_project | n/a |
| <a name="module_env_secrets"></a> [env\_secrets](#module\_env\_secrets) | ../../modules/env_secrets | n/a |
| <a name="module_monitoring_project"></a> [monitoring\_project](#module\_monitoring\_project) | ../../modules/monitoring_project | n/a |
| <a name="module_restricted_shared_vpc_host_project"></a> [restricted\_shared\_vpc\_host\_project](#module\_restricted\_shared\_vpc\_host\_project) | ../../modules/restricted_shared_vpc_host_project | n/a |

## Resources

| Name | Type |
|------|------|
| [google_folder.env](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_project_iam_member.monitoring_editor](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [random_id.billing_code_random_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [google_active_folder.common](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/active_folder) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_network_project_alert_pubsub_topic"></a> [base\_network\_project\_alert\_pubsub\_topic](#input\_base\_network\_project\_alert\_pubsub\_topic) | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` for the base networks project | `string` | `null` | no |
| <a name="input_base_network_project_alert_spent_percents"></a> [base\_network\_project\_alert\_spent\_percents](#input\_base\_network\_project\_alert\_spent\_percents) | A list of percentages of the budget to alert on when threshold is exceeded for the base networks project | `list(number)` | <pre>[<br>  0.5,<br>  0.75,<br>  0.9,<br>  0.95<br>]</pre> | no |
| <a name="input_base_network_project_budget_amount"></a> [base\_network\_project\_budget\_amount](#input\_base\_network\_project\_budget\_amount) | The amount to use as the budget for the base networks project | `number` | `1000` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate this project with | `string` | n/a | yes |
| <a name="input_bu"></a> [bu](#input\_bu) | It contains the bu name | `string` | `""` | no |
| <a name="input_bu_code"></a> [bu\_code](#input\_bu\_code) | It contains the Business unit code | `string` | `""` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment to prepare (ex. development) | `string` | n/a | yes |
| <a name="input_environment_code"></a> [environment\_code](#input\_environment\_code) | A short form of the folder level resources (environment) within the Google Cloud organization (ex. d). | `string` | n/a | yes |
| <a name="input_folder_prefix"></a> [folder\_prefix](#input\_folder\_prefix) | Name prefix to use for folders created. | `string` | `"fldr"` | no |
| <a name="input_monitoring_project_alert_pubsub_topic"></a> [monitoring\_project\_alert\_pubsub\_topic](#input\_monitoring\_project\_alert\_pubsub\_topic) | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` for the monitoring project. | `string` | `null` | no |
| <a name="input_monitoring_project_alert_spent_percents"></a> [monitoring\_project\_alert\_spent\_percents](#input\_monitoring\_project\_alert\_spent\_percents) | A list of percentages of the budget to alert on when threshold is exceeded for the monitoring project. | `list(number)` | <pre>[<br>  0.5,<br>  0.75,<br>  0.9,<br>  0.95<br>]</pre> | no |
| <a name="input_monitoring_project_budget_amount"></a> [monitoring\_project\_budget\_amount](#input\_monitoring\_project\_budget\_amount) | The amount to use as the budget for the monitoring project. | `number` | `1000` | no |
| <a name="input_monitoring_workspace_users"></a> [monitoring\_workspace\_users](#input\_monitoring\_workspace\_users) | Google Workspace or Cloud Identity group that have access to Monitoring Workspaces. | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organization id for the associated services | `string` | n/a | yes |
| <a name="input_parent_id"></a> [parent\_id](#input\_parent\_id) | The parent folder or org for environments | `string` | n/a | yes |
| <a name="input_primary_contact"></a> [primary\_contact](#input\_primary\_contact) | Email of primary contact | `string` | n/a | yes |
| <a name="input_project_prefix"></a> [project\_prefix](#input\_project\_prefix) | Name prefix to use for projects created. | `string` | `"prj"` | no |
| <a name="input_restricted_network_project_alert_pubsub_topic"></a> [restricted\_network\_project\_alert\_pubsub\_topic](#input\_restricted\_network\_project\_alert\_pubsub\_topic) | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` for the restricted networks project | `string` | `null` | no |
| <a name="input_restricted_network_project_alert_spent_percents"></a> [restricted\_network\_project\_alert\_spent\_percents](#input\_restricted\_network\_project\_alert\_spent\_percents) | A list of percentages of the budget to alert on when threshold is exceeded for the restricted networks project. | `list(number)` | <pre>[<br>  0.5,<br>  0.75,<br>  0.9,<br>  0.95<br>]</pre> | no |
| <a name="input_restricted_network_project_budget_amount"></a> [restricted\_network\_project\_budget\_amount](#input\_restricted\_network\_project\_budget\_amount) | The amount to use as the budget for the restricted networks project. | `number` | `1000` | no |
| <a name="input_secondary_contact"></a> [secondary\_contact](#input\_secondary\_contact) | Email of seconday contact | `string` | n/a | yes |
| <a name="input_secret_project_alert_pubsub_topic"></a> [secret\_project\_alert\_pubsub\_topic](#input\_secret\_project\_alert\_pubsub\_topic) | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` for the secrets project. | `string` | `null` | no |
| <a name="input_secret_project_alert_spent_percents"></a> [secret\_project\_alert\_spent\_percents](#input\_secret\_project\_alert\_spent\_percents) | A list of percentages of the budget to alert on when threshold is exceeded for the secrets project. | `list(number)` | <pre>[<br>  0.5,<br>  0.75,<br>  0.9,<br>  0.95<br>]</pre> | no |
| <a name="input_secret_project_budget_amount"></a> [secret\_project\_budget\_amount](#input\_secret\_project\_budget\_amount) | The amount to use as the budget for the secrets project. | `number` | `1000` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | It contains the stage name | `string` | `""` | no |
| <a name="input_terraform_service_account"></a> [terraform\_service\_account](#input\_terraform\_service\_account) | Service account email of the account to impersonate to run Terraform. | `string` | n/a | yes |
| <a name="input_vpc_prefix"></a> [vpc\_prefix](#input\_vpc\_prefix) | VPC prefix used to create the vpc | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_base_shared_vpc_project_id"></a> [base\_shared\_vpc\_project\_id](#output\_base\_shared\_vpc\_project\_id) | Project for base shared VPC network. |
| <a name="output_env_folder"></a> [env\_folder](#output\_env\_folder) | Environment folder created under parent. |
| <a name="output_env_secrets_project_id"></a> [env\_secrets\_project\_id](#output\_env\_secrets\_project\_id) | Project for environment secrets. |
| <a name="output_monitoring_project_id"></a> [monitoring\_project\_id](#output\_monitoring\_project\_id) | Project for monitoring infra. |
| <a name="output_restricted_shared_vpc_project_id"></a> [restricted\_shared\_vpc\_project\_id](#output\_restricted\_shared\_vpc\_project\_id) | Project for restricted shared VPC network. |

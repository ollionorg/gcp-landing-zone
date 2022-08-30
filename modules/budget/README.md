
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.89.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.89.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | >= 3.89.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_billing_budget.budget](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_billing_budget) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_pubsub_topic"></a> [alert\_pubsub\_topic](#input\_alert\_pubsub\_topic) | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` | `string` | `null` | no |
| <a name="input_alert_spent_percents"></a> [alert\_spent\_percents](#input\_alert\_spent\_percents) | A list of percentages of the budget to alert on when threshold is exceeded | `list(number)` | <pre>[<br>  0.5,<br>  0.7,<br>  1<br>]</pre> | no |
| <a name="input_amount"></a> [amount](#input\_amount) | The amount to use as the budget | `number` | n/a | yes |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | ID of the billing account to set a budget on | `string` | n/a | yes |
| <a name="input_create_budget"></a> [create\_budget](#input\_create\_budget) | If the budget should be created | `bool` | `true` | no |
| <a name="input_credit_types_treatment"></a> [credit\_types\_treatment](#input\_credit\_types\_treatment) | Specifies how credits should be treated when determining spend for threshold calculations | `string` | `"INCLUDE_ALL_CREDITS"` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name of the budget. If not set defaults to `Budget For <projects[0]|All Projects>` | `string` | `null` | no |
| <a name="input_monitoring_notification_channels"></a> [monitoring\_notification\_channels](#input\_monitoring\_notification\_channels) | A list of monitoring notification channels in the form `[projects/{project_id}/notificationChannels/{channel_id}]`. A maximum of 5 channels are allowed. | `list(string)` | `[]` | no |
| <a name="input_projects"></a> [projects](#input\_projects) | The project ids to include in this budget. If empty budget will include all projects | `list(string)` | n/a | yes |
| <a name="input_services"></a> [services](#input\_services) | A list of services ids to be included in the budget. If omitted, all services will be included in the budget. Service ids can be found at https://cloud.google.com/skus/ | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | Resource name of the budget. Values are of the form `billingAccounts/{billingAccountId}/budgets/{budgetId}.` |

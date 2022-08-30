
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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project"></a> [project](#module\_project) | ../terraform-google-project-factory | n/a |

## Resources

| Name | Type |
|------|------|
| [google_folder_iam_member.folder_browser](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_iam_member) | resource |
| [google_folder_iam_member.folder_network_viewer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_iam_member) | resource |
| [google_project_iam_member.app_infra_pipeline_sa_roles](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account_iam_member.cloudbuild_terraform_sa_impersonate_permissions](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [google_compute_network.shared_vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) | data source |
| [google_projects.projects](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | The api to activate for the GCP project | `list(string)` | `[]` | no |
| <a name="input_alert_pubsub_topic"></a> [alert\_pubsub\_topic](#input\_alert\_pubsub\_topic) | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` | `string` | `null` | no |
| <a name="input_alert_spent_percents"></a> [alert\_spent\_percents](#input\_alert\_spent\_percents) | A list of percentages of the budget to alert on when threshold is exceeded | `list(number)` | <pre>[<br>  0.5,<br>  0.75,<br>  0.9,<br>  0.95<br>]</pre> | no |
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | The name of application where GCP resources relate | `string` | n/a | yes |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associated this project with | `string` | n/a | yes |
| <a name="input_billing_code"></a> [billing\_code](#input\_billing\_code) | The code that's used to provide chargeback information | `string` | n/a | yes |
| <a name="input_bu"></a> [bu](#input\_bu) | It contains the bu name | `string` | `""` | no |
| <a name="input_budget_amount"></a> [budget\_amount](#input\_budget\_amount) | The amount to use as the budget | `number` | `1000` | no |
| <a name="input_business_code"></a> [business\_code](#input\_business\_code) | The code that describes which business unit owns the project | `string` | `"abcd"` | no |
| <a name="input_cloudbuild_sa"></a> [cloudbuild\_sa](#input\_cloudbuild\_sa) | The Cloud Build SA used for deploying infrastructure in this project. It will impersonate the new default SA created | `string` | `""` | no |
| <a name="input_enable_cloudbuild_deploy"></a> [enable\_cloudbuild\_deploy](#input\_enable\_cloudbuild\_deploy) | Enable infra deployment using Cloud Build | `bool` | `false` | no |
| <a name="input_enable_hub_and_spoke"></a> [enable\_hub\_and\_spoke](#input\_enable\_hub\_and\_spoke) | Enable Hub-and-Spoke architecture. | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment the single project belongs to | `string` | n/a | yes |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The folder id where project will be created | `string` | n/a | yes |
| <a name="input_impersonate_service_account"></a> [impersonate\_service\_account](#input\_impersonate\_service\_account) | Service account email of the account to impersonate to run Terraform | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organization id for the associated services | `string` | n/a | yes |
| <a name="input_primary_contact"></a> [primary\_contact](#input\_primary\_contact) | The primary email contact for the project | `string` | n/a | yes |
| <a name="input_project_prefix"></a> [project\_prefix](#input\_project\_prefix) | Name prefix to use for projects created. | `string` | `"prj"` | no |
| <a name="input_project_suffix"></a> [project\_suffix](#input\_project\_suffix) | The name of the GCP project. Max 16 characters with 3 character business unit code. | `string` | n/a | yes |
| <a name="input_sa_roles"></a> [sa\_roles](#input\_sa\_roles) | A list of roles to give the Service Account for the project (defaults to none) | `list(string)` | `[]` | no |
| <a name="input_secondary_contact"></a> [secondary\_contact](#input\_secondary\_contact) | The secondary email contact for the project | `string` | `""` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | It contains the stage name | `string` | `""` | no |
| <a name="input_vpc_service_control_attach_enabled"></a> [vpc\_service\_control\_attach\_enabled](#input\_vpc\_service\_control\_attach\_enabled) | Whether the project will be attached to a VPC Service Control Perimeter | `bool` | `false` | no |
| <a name="input_vpc_service_control_perimeter_name"></a> [vpc\_service\_control\_perimeter\_name](#input\_vpc\_service\_control\_perimeter\_name) | The name of a VPC Service Control Perimeter to add the created project to | `string` | `null` | no |
| <a name="input_vpc_type"></a> [vpc\_type](#input\_vpc\_type) | The type of VPC to attach the project to. Possible options are base or restricted. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_enabled_apis"></a> [enabled\_apis](#output\_enabled\_apis) | VPC Service Control services. |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | Project sample project id. |
| <a name="output_project_number"></a> [project\_number](#output\_project\_number) | Project sample project number. |
| <a name="output_sa"></a> [sa](#output\_sa) | Project SA email |

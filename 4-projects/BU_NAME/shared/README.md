## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 3.89.0 |
| <a name="provider_google.impersonate"></a> [google.impersonate](#provider\_google.impersonate) | 3.89.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_infra_cloudbuild_project"></a> [app\_infra\_cloudbuild\_project](#module\_app\_infra\_cloudbuild\_project) | ../../../modules/single_project | n/a |
| <a name="module_infra_pipelines"></a> [infra\_pipelines](#module\_infra\_pipelines) | ../../../modules/infra_pipelines | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.build_group_editor_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.security_build_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_active_folder.common](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/active_folder) | data source |
| [google_service_account_access_token.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account_access_token) | data source |
| [terraform_remote_state.bootstrap](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.env](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.networks](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.org](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_pubsub_topic"></a> [alert\_pubsub\_topic](#input\_alert\_pubsub\_topic) | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` | `string` | `null` | no |
| <a name="input_alert_spent_percents"></a> [alert\_spent\_percents](#input\_alert\_spent\_percents) | A list of percentages of the budget to alert on when threshold is exceeded | `list(number)` | <pre>[<br>  0.5,<br>  0.75,<br>  0.9,<br>  0.95<br>]</pre> | no |
| <a name="input_app"></a> [app](#input\_app) | Application name | `string` | n/a | yes |
| <a name="input_base_suffix"></a> [base\_suffix](#input\_base\_suffix) | Base shared VPC suffix name | `string` | n/a | yes |
| <a name="input_base_vpc_type"></a> [base\_vpc\_type](#input\_base\_vpc\_type) | Base shared VPC type | `string` | n/a | yes |
| <a name="input_billing_code"></a> [billing\_code](#input\_billing\_code) | billing code for application | `string` | n/a | yes |
| <a name="input_bu_code"></a> [bu\_code](#input\_bu\_code) | Name to create the business unit | `string` | n/a | yes |
| <a name="input_bu_name"></a> [bu\_name](#input\_bu\_name) | Name to create the business unit | `string` | n/a | yes |
| <a name="input_budget_amount"></a> [budget\_amount](#input\_budget\_amount) | The amount to use as the budget | `number` | `1000` | no |
| <a name="input_floating_suffix"></a> [floating\_suffix](#input\_floating\_suffix) | floating project suffix | `string` | n/a | yes |
| <a name="input_infra_suffix"></a> [infra\_suffix](#input\_infra\_suffix) | inrfa\_pipeline project suffix | `string` | `null` | no |
| <a name="input_parent_folder"></a> [parent\_folder](#input\_parent\_folder) | Optional - for an organization with existing projects or for development/validation. It will place all the example foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist. Must be the same value used in previous step. | `string` | `""` | no |
| <a name="input_peer_base"></a> [peer\_base](#input\_peer\_base) | peering base name suffix | `string` | n/a | yes |
| <a name="input_peer_fw_name"></a> [peer\_fw\_name](#input\_peer\_fw\_name) | peering firewall name prefix | `string` | n/a | yes |
| <a name="input_peer_suffix"></a> [peer\_suffix](#input\_peer\_suffix) | Peering VPC suffix name | `string` | n/a | yes |
| <a name="input_res_suffix"></a> [res\_suffix](#input\_res\_suffix) | Restricted shared VPC suffix nam | `string` | n/a | yes |
| <a name="input_res_vpc_type"></a> [res\_vpc\_type](#input\_res\_vpc\_type) | Restricted shared VPC type | `string` | n/a | yes |
| <a name="input_stage_name"></a> [stage\_name](#input\_stage\_name) | it contains the stage name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_infra_pipeline_cloudbuild_sa"></a> [app\_infra\_pipeline\_cloudbuild\_sa](#output\_app\_infra\_pipeline\_cloudbuild\_sa) | n/a |
| <a name="output_apply_triggers"></a> [apply\_triggers](#output\_apply\_triggers) | CB apply triggers |
| <a name="output_artifact_buckets"></a> [artifact\_buckets](#output\_artifact\_buckets) | GCS Buckets to store Cloud Build Artifacts |
| <a name="output_cloudbuild_project_id"></a> [cloudbuild\_project\_id](#output\_cloudbuild\_project\_id) | n/a |
| <a name="output_cloudbuild_sa"></a> [cloudbuild\_sa](#output\_cloudbuild\_sa) | Cloud Build service account |
| <a name="output_plan_triggers"></a> [plan\_triggers](#output\_plan\_triggers) | CB plan triggers |
| <a name="output_repos"></a> [repos](#output\_repos) | CSRs to store source code |
| <a name="output_state_buckets"></a> [state\_buckets](#output\_state\_buckets) | GCS Buckets to store TF state |
| <a name="output_tf_runner_artifact_repo"></a> [tf\_runner\_artifact\_repo](#output\_tf\_runner\_artifact\_repo) | GAR Repo created to store runner images |

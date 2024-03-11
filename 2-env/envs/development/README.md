Copyright 2021 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
**/

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.65.2 |
| <a name="provider_google.impersonate"></a> [google.impersonate](#provider\_google.impersonate) | 4.65.2 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_env"></a> [env](#module\_env) | ../../../modules/env_baseline | n/a |

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.base_network_operations](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.prod_logging](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.prod_monitoring](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.prod_secrets](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account_access_token.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account_access_token) | data source |
| [terraform_remote_state.bootstrap](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.org](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_parent_folder"></a> [parent\_folder](#input\_parent\_folder) | Optional - for an organization with existing projects or for development/validation. It will place all the example foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist. Must be the same value used in previous step. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_base_shared_vpc_project_id"></a> [base\_shared\_vpc\_project\_id](#output\_base\_shared\_vpc\_project\_id) | Project for base shared VPC. |
| <a name="output_env_folder"></a> [env\_folder](#output\_env\_folder) | Environment folder created under parent. |
| <a name="output_env_secrets_project_id"></a> [env\_secrets\_project\_id](#output\_env\_secrets\_project\_id) | Project for environment related secrets. |
| <a name="output_logging_project_id"></a> [logging\_project\_id](#output\_logging\_project\_id) | Project for logging sink. |
| <a name="output_monitoring_project_id"></a> [monitoring\_project\_id](#output\_monitoring\_project\_id) | Project for monitoring infra. |
| <a name="output_restricted_shared_vpc_project_id"></a> [restricted\_shared\_vpc\_project\_id](#output\_restricted\_shared\_vpc\_project\_id) | Project for restricted shared VPC. |

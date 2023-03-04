changequote(,)


<!-- BEGIN_TF_DOCS -->
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

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_google.impersonate"></a> [google.impersonate](#provider\_google.impersonate) | n/a |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_wif"></a> [wif](#module\_wif) | ../../../modules/workload-identity | n/a |
| <a name="module_wif2"></a> [wif2](#module\_wif2) | ../../../modules/workload-identity | n/a |

## Resources

| Name | Type |
|------|------|
| [google-beta_google_monitoring_monitored_project.primary](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_monitoring_monitored_project) | resource |
| [google_compute_subnetwork_iam_binding.binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork_iam_binding) | resource |
| [google_compute_subnetwork_iam_binding.binding2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork_iam_binding) | resource |
| [google_container_cluster.gke](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) | resource |
| [google_container_cluster.gke2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) | resource |
| [google_container_node_pool.general](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |
| [google_container_node_pool.general2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |
| [google_project_iam_binding.container-engine](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [google_project_service.cloudtrace_api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_project_service.containerapi](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_project_service.sql_service_1](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_project_service.sql_service_2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.compute_engine_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_sql_database.boa_database_1](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database.boa_database_2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database) | resource |
| [google_sql_database_instance.boa_sql](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_user.boa_db_admin_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user) | resource |
| [null_resource.kubectl_config](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.kubectl_config2](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_id.db_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [google_active_folder.env](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/active_folder) | data source |
| [google_projects.monitoring_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |
| [google_projects.my_org_projects](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |
| [google_service_account_access_token.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account_access_token) | data source |
| [terraform_remote_state.BU_NAME_shared](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.BU_NAME_staging](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.bootstrap](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.env](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.networks](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.org](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bu_code"></a> [bu\_code](#input\_bu\_code) | BU Code | `string` | n/a | yes |
| <a name="input_bu_name"></a> [bu\_name](#input\_bu\_name) | BU Name | `string` | n/a | yes |
| <a name="input_dbps"></a> [dbps](#input\_dbps) | SQL Database instance | `string` | n/a | yes |
| <a name="input_parent_folder"></a> [parent\_folder](#input\_parent\_folder) | Optional - for an organization with existing projects or for staging/validation. It will place all the example foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist. Must be the same value used in previous step. | `string` | `""` | no |
| <a name="input_stage_name"></a> [stage\_name](#input\_stage\_name) | it contains the stage name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_boa_project_id"></a> [boa\_project\_id](#output\_boa\_project\_id) | n/a |
| <a name="output_gke_cluster1_region"></a> [gke\_cluster1\_region](#output\_gke\_cluster1\_region) | n/a |
| <a name="output_gke_cluster2_region"></a> [gke\_cluster2\_region](#output\_gke\_cluster2\_region) | n/a |
| <a name="output_gke_cluster_region1"></a> [gke\_cluster\_region1](#output\_gke\_cluster\_region1) | GKE Cluster in region1. |
| <a name="output_gke_cluster_region1_uri"></a> [gke\_cluster\_region1\_uri](#output\_gke\_cluster\_region1\_uri) | n/a |
| <a name="output_gke_cluster_region2"></a> [gke\_cluster\_region2](#output\_gke\_cluster\_region2) | GKE Cluster in region2. |
| <a name="output_gke_cluster_region2_uri"></a> [gke\_cluster\_region2\_uri](#output\_gke\_cluster\_region2\_uri) | n/a |
| <a name="output_sql_connection"></a> [sql\_connection](#output\_sql\_connection) | CloudSQL instance connection. |
<!-- END_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 3.89.0 |
| <a name="provider_google.impersonate"></a> [google.impersonate](#provider\_google.impersonate) | 3.89.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_base_shared_vpc_project"></a> [base\_shared\_vpc\_project](#module\_base\_shared\_vpc\_project) | ../../../modules/single_project | n/a |
| <a name="module_env_secrets_project"></a> [env\_secrets\_project](#module\_env\_secrets\_project) | ../../../modules/single_project | n/a |
| <a name="module_floating_project"></a> [floating\_project](#module\_floating\_project) | ../../../modules/single_project | n/a |
| <a name="module_gcs_buckets"></a> [gcs\_buckets](#module\_gcs\_buckets) | ../../../modules/simple_bucket | n/a |
| <a name="module_kms"></a> [kms](#module\_kms) | ../../../modules/kms | n/a |
| <a name="module_peering"></a> [peering](#module\_peering) | ../../../modules/network-peering | n/a |
| <a name="module_peering_network"></a> [peering\_network](#module\_peering\_network) | ../../../modules/terraform-google-network | n/a |
| <a name="module_peering_project"></a> [peering\_project](#module\_peering\_project) | ../../../modules/single_project | n/a |
| <a name="module_restricted_shared_vpc_project"></a> [restricted\_shared\_vpc\_project](#module\_restricted\_shared\_vpc\_project) | ../../../modules/single_project | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.allow_iap_rdp](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow_iap_ssh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow_lb](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow_private_api_egress](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow_windows_activation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.deny_all_egress](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_project_iam_member.floating_project_build](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.floating_project_operations](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.peering_project_build](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.peering_project_operations](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.secrets_project_build](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.secrets_project_operations](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.shared_vpc_build](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.shared_vpc_operations](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [random_string.bucket_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [google_active_folder.env](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/active_folder) | data source |
| [google_compute_network.shared_vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) | data source |
| [google_netblock_ip_ranges.health_checkers](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/netblock_ip_ranges) | data source |
| [google_netblock_ip_ranges.iap_forwarders](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/netblock_ip_ranges) | data source |
| [google_netblock_ip_ranges.legacy_health_checkers](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/netblock_ip_ranges) | data source |
| [google_projects.projects](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |
| [google_service_account_access_token.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account_access_token) | data source |
| [google_storage_project_service_account.gcs_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/storage_project_service_account) | data source |
| [terraform_remote_state.BU_NAME_shared](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
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
| <a name="input_firewall_enable_logging"></a> [firewall\_enable\_logging](#input\_firewall\_enable\_logging) | Toggle firewall logging for VPC Firewalls. | `bool` | `true` | no |
| <a name="input_floating_suffix"></a> [floating\_suffix](#input\_floating\_suffix) | floating project suffix | `string` | n/a | yes |
| <a name="input_gcs_bucket_prefix"></a> [gcs\_bucket\_prefix](#input\_gcs\_bucket\_prefix) | Name prefix to be used for GCS Bucket | `string` | `"cmek-encrypted-bucket"` | no |
| <a name="input_infra_suffix"></a> [infra\_suffix](#input\_infra\_suffix) | prefix used to attach for infra-pipeline project | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name to be used for KMS Key | `string` | `"crypto-key-example"` | no |
| <a name="input_key_rotation_period"></a> [key\_rotation\_period](#input\_key\_rotation\_period) | Rotation period in seconds to be used for KMS Key | `string` | `"7776000s"` | no |
| <a name="input_keyring_name"></a> [keyring\_name](#input\_keyring\_name) | Name to be used for KMS Keyring | `string` | `"sample-keyring"` | no |
| <a name="input_location_gcs"></a> [location\_gcs](#input\_location\_gcs) | Case-Sensitive Location for GCS Bucket (Should be same region as the KMS Keyring) | `string` | `"US"` | no |
| <a name="input_location_kms"></a> [location\_kms](#input\_location\_kms) | Case-Sensitive Location for KMS Keyring (Should be same region as the GCS Bucket) | `string` | `"us"` | no |
| <a name="input_optional_fw_rules_enabled"></a> [optional\_fw\_rules\_enabled](#input\_optional\_fw\_rules\_enabled) | Toggle creation of optional firewall rules: IAP SSH, IAP RDP and Internal & Global load balancing health check and load balancing IP ranges. | `bool` | `false` | no |
| <a name="input_parent_folder"></a> [parent\_folder](#input\_parent\_folder) | Optional - for an organization with existing projects or for development/validation. It will place all the example foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist. Must be the same value used in previous step. | `string` | `""` | no |
| <a name="input_peer_base"></a> [peer\_base](#input\_peer\_base) | peering base name suffix | `string` | n/a | yes |
| <a name="input_peer_fw_name"></a> [peer\_fw\_name](#input\_peer\_fw\_name) | peering firewall name prefix | `string` | n/a | yes |
| <a name="input_peer_suffix"></a> [peer\_suffix](#input\_peer\_suffix) | Peering VPC suffix name | `string` | n/a | yes |
| <a name="input_peering_module_depends_on"></a> [peering\_module\_depends\_on](#input\_peering\_module\_depends\_on) | List of modules or resources peering module depends on. | `list(any)` | `[]` | no |
| <a name="input_res_suffix"></a> [res\_suffix](#input\_res\_suffix) | Restricted shared VPC suffix nam | `string` | n/a | yes |
| <a name="input_res_vpc_type"></a> [res\_vpc\_type](#input\_res\_vpc\_type) | Restricted shared VPC type | `string` | n/a | yes |
| <a name="input_secrets_prj_suffix"></a> [secrets\_prj\_suffix](#input\_secrets\_prj\_suffix) | Name suffix to use for secrets project created. | `string` | `"env-secrets"` | no |
| <a name="input_stage_name"></a> [stage\_name](#input\_stage\_name) | it contains the stage name | `string` | n/a | yes |
| <a name="input_windows_activation_enabled"></a> [windows\_activation\_enabled](#input\_windows\_activation\_enabled) | Enable Windows license activation for Windows workloads. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_context_manager_policy_id"></a> [access\_context\_manager\_policy\_id](#output\_access\_context\_manager\_policy\_id) | Access Context Manager Policy ID. |
| <a name="output_base_shared_vpc_project"></a> [base\_shared\_vpc\_project](#output\_base\_shared\_vpc\_project) | Project sample base project. |
| <a name="output_base_shared_vpc_project_number"></a> [base\_shared\_vpc\_project\_number](#output\_base\_shared\_vpc\_project\_number) | Base Project number. |
| <a name="output_base_shared_vpc_project_sa"></a> [base\_shared\_vpc\_project\_sa](#output\_base\_shared\_vpc\_project\_sa) | Project sample base project SA. |
| <a name="output_bucket"></a> [bucket](#output\_bucket) | The created storage bucket |
| <a name="output_env_secrets_project"></a> [env\_secrets\_project](#output\_env\_secrets\_project) | Project sample peering project id. |
| <a name="output_floating_project"></a> [floating\_project](#output\_floating\_project) | Project sample floating project. |
| <a name="output_keyring"></a> [keyring](#output\_keyring) | The name of the keyring. |
| <a name="output_keys"></a> [keys](#output\_keys) | List of created key names. |
| <a name="output_peering_complete"></a> [peering\_complete](#output\_peering\_complete) | Output to be used as a module dependency. |
| <a name="output_peering_network"></a> [peering\_network](#output\_peering\_network) | Peer network peering resource. |
| <a name="output_peering_project"></a> [peering\_project](#output\_peering\_project) | Project sample peering project id. |
| <a name="output_restricted_enabled_apis"></a> [restricted\_enabled\_apis](#output\_restricted\_enabled\_apis) | Activated APIs. |
| <a name="output_restricted_shared_vpc_project"></a> [restricted\_shared\_vpc\_project](#output\_restricted\_shared\_vpc\_project) | Project sample restricted project id. |
| <a name="output_restricted_shared_vpc_project_number"></a> [restricted\_shared\_vpc\_project\_number](#output\_restricted\_shared\_vpc\_project\_number) | Project sample restricted project. |
| <a name="output_vpc_service_control_perimeter_name"></a> [vpc\_service\_control\_perimeter\_name](#output\_vpc\_service\_control\_perimeter\_name) | VPC Service Control name. |

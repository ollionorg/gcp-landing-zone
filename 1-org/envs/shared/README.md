## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.47.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | < 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | n/a |
| <a name="provider_google"></a> [google](#provider\_google) | 4.47.0 |
| <a name="provider_google.impersonate"></a> [google.impersonate](#provider\_google.impersonate) | 4.47.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_base_network_hub"></a> [base\_network\_hub](#module\_base\_network\_hub) | ../../../modules/base_network_hub | n/a |
| <a name="module_bigquery_destination"></a> [bigquery\_destination](#module\_bigquery\_destination) | ../../../modules/bigquery | n/a |
| <a name="module_bigquery_destination_operations"></a> [bigquery\_destination\_operations](#module\_bigquery\_destination\_operations) | ../../../modules/bigquery | n/a |
| <a name="module_bigquery_destination_security"></a> [bigquery\_destination\_security](#module\_bigquery\_destination\_security) | ../../../modules/bigquery | n/a |
| <a name="module_dns_hub"></a> [dns\_hub](#module\_dns\_hub) | ../../../modules/base_network_hub | n/a |
| <a name="module_log_export_to_biqquery"></a> [log\_export\_to\_biqquery](#module\_log\_export\_to\_biqquery) | ../../../modules/bigquery_destination | n/a |
| <a name="module_log_export_to_biqquery_operations"></a> [log\_export\_to\_biqquery\_operations](#module\_log\_export\_to\_biqquery\_operations) | ../../../modules/bigquery_destination | n/a |
| <a name="module_log_export_to_biqquery_security"></a> [log\_export\_to\_biqquery\_security](#module\_log\_export\_to\_biqquery\_security) | ../../../modules/bigquery_destination | n/a |
| <a name="module_log_export_to_pubsub"></a> [log\_export\_to\_pubsub](#module\_log\_export\_to\_pubsub) | ../../../modules/bigquery_destination | n/a |
| <a name="module_log_export_to_storage"></a> [log\_export\_to\_storage](#module\_log\_export\_to\_storage) | ../../../modules/bigquery_destination | n/a |
| <a name="module_log_export_to_storage_operations"></a> [log\_export\_to\_storage\_operations](#module\_log\_export\_to\_storage\_operations) | ../../../modules/bigquery_destination | n/a |
| <a name="module_log_export_to_storage_security"></a> [log\_export\_to\_storage\_security](#module\_log\_export\_to\_storage\_security) | ../../../modules/bigquery_destination | n/a |
| <a name="module_notrust_interconnect"></a> [notrust\_interconnect](#module\_notrust\_interconnect) | ../../../modules/base_network_hub | n/a |
| <a name="module_org_audit_logs"></a> [org\_audit\_logs](#module\_org\_audit\_logs) | ../../../modules/base_network_hub | n/a |
| <a name="module_org_billing_logs"></a> [org\_billing\_logs](#module\_org\_billing\_logs) | ../../../modules/base_network_hub | n/a |
| <a name="module_org_cloudsql_external_ip_access"></a> [org\_cloudsql\_external\_ip\_access](#module\_org\_cloudsql\_external\_ip\_access) | ../../../modules/org_policies | n/a |
| <a name="module_org_compute_disable_guest_attributes_access"></a> [org\_compute\_disable\_guest\_attributes\_access](#module\_org\_compute\_disable\_guest\_attributes\_access) | ../../../modules/org_policies | n/a |
| <a name="module_org_disable_automatic_iam_grants_on_default_service_accounts"></a> [org\_disable\_automatic\_iam\_grants\_on\_default\_service\_accounts](#module\_org\_disable\_automatic\_iam\_grants\_on\_default\_service\_accounts) | ../../../modules/org_policies | n/a |
| <a name="module_org_disable_nested_virtualization"></a> [org\_disable\_nested\_virtualization](#module\_org\_disable\_nested\_virtualization) | ../../../modules/org_policies | n/a |
| <a name="module_org_disable_sa_key_creation"></a> [org\_disable\_sa\_key\_creation](#module\_org\_disable\_sa\_key\_creation) | ../../../modules/org_policies | n/a |
| <a name="module_org_disable_serial_port_access"></a> [org\_disable\_serial\_port\_access](#module\_org\_disable\_serial\_port\_access) | ../../../modules/org_policies | n/a |
| <a name="module_org_domain_restricted_sharing"></a> [org\_domain\_restricted\_sharing](#module\_org\_domain\_restricted\_sharing) | ../../../modules/domain_restricted_sharing | n/a |
| <a name="module_org_enforce_bucket_level_access"></a> [org\_enforce\_bucket\_level\_access](#module\_org\_enforce\_bucket\_level\_access) | ../../../modules/org_policies | n/a |
| <a name="module_org_operations_logs"></a> [org\_operations\_logs](#module\_org\_operations\_logs) | ../../../modules/base_network_hub | n/a |
| <a name="module_org_secrets"></a> [org\_secrets](#module\_org\_secrets) | ../../../modules/base_network_hub | n/a |
| <a name="module_org_security_logs"></a> [org\_security\_logs](#module\_org\_security\_logs) | ../../../modules/base_network_hub | n/a |
| <a name="module_org_shared_require_os_login"></a> [org\_shared\_require\_os\_login](#module\_org\_shared\_require\_os\_login) | ../../../modules/org_policies | n/a |
| <a name="module_org_shared_vpc_lien_removal"></a> [org\_shared\_vpc\_lien\_removal](#module\_org\_shared\_vpc\_lien\_removal) | ../../../modules/org_policies | n/a |
| <a name="module_org_skip_default_network"></a> [org\_skip\_default\_network](#module\_org\_skip\_default\_network) | ../../../modules/org_policies | n/a |
| <a name="module_org_vm_external_ip_access"></a> [org\_vm\_external\_ip\_access](#module\_org\_vm\_external\_ip\_access) | ../../../modules/org_policies | n/a |
| <a name="module_output_bucket"></a> [output\_bucket](#module\_output\_bucket) | ../../../modules/storage | n/a |
| <a name="module_pubsub_destination"></a> [pubsub\_destination](#module\_pubsub\_destination) | ../../../modules/pubsub | n/a |
| <a name="module_restricted_network_hub"></a> [restricted\_network\_hub](#module\_restricted\_network\_hub) | ../../../modules/base_network_hub | n/a |
| <a name="module_scc_notifications"></a> [scc\_notifications](#module\_scc\_notifications) | ../../../modules/base_network_hub | n/a |
| <a name="module_storage_destination"></a> [storage\_destination](#module\_storage\_destination) | ../../../modules/storage | n/a |
| <a name="module_storage_destination_operations"></a> [storage\_destination\_operations](#module\_storage\_destination\_operations) | ../../../modules/storage | n/a |
| <a name="module_storage_destination_security"></a> [storage\_destination\_security](#module\_storage\_destination\_security) | ../../../modules/storage | n/a |
| <a name="module_trust_interconnect"></a> [trust\_interconnect](#module\_trust\_interconnect) | ../../../modules/base_network_hub | n/a |

## Resources

| Name | Type |
|------|------|
| [google_access_context_manager_access_policy.access_policy](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/access_context_manager_access_policy) | resource |
| [google_bigquery_dataset.billing_dataset](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/bigquery_dataset) | resource |
| [google_billing_account_iam_member.billing_admin_user](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/billing_account_iam_member) | resource |
| [google_cloud_scheduler_job.cto_scheduler](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/cloud_scheduler_job) | resource |
| [google_cloudfunctions_function.monitoring_ctos](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/cloudfunctions_function) | resource |
| [google_cloudfunctions_function_iam_member.invoker](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/cloudfunctions_function_iam_member) | resource |
| [google_folder.common](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/folder) | resource |
| [google_folder_iam_audit_config.folder_config](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/folder_iam_audit_config) | resource |
| [google_folder_iam_member.network_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/folder_iam_member) | resource |
| [google_folder_iam_member.org_admin_user](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/folder_iam_member) | resource |
| [google_folder_iam_member.organization_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/folder_iam_member) | resource |
| [google_folder_iam_member.security_reviewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/folder_iam_member) | resource |
| [google_kms_crypto_key.audit_logs_key](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/kms_crypto_key) | resource |
| [google_kms_crypto_key.org_operations_logs_key](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/kms_crypto_key) | resource |
| [google_kms_crypto_key.storage_destination_security_key](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/kms_crypto_key) | resource |
| [google_kms_key_ring.audit_logs_keyring](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/kms_key_ring) | resource |
| [google_kms_key_ring.org_operations_logs_keyring](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/kms_key_ring) | resource |
| [google_kms_key_ring.storage_destination_security_keyring](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/kms_key_ring) | resource |
| [google_organization_iam_audit_config.org_config](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/organization_iam_audit_config) | resource |
| [google_organization_iam_member.billing_creator_user](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.billing_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.network_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.org_admin_user](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.organization_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.security_reviewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/organization_iam_member) | resource |
| [google_project_iam_member.audit_bq_data_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.audit_log_bq_data_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.audit_log_bq_user](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.audit_log_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.audit_private_logviewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.billing_bq_user](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.billing_bq_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.cto_base_network_ops_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.cto_dns_hub_network_ops_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.cto_nt_network_ops_network_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.cto_nt_network_ops_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.cto_operations_log_bq_data_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.cto_operations_log_bq_user](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.cto_operations_logging_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.cto_t_network_ops_network_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.cto_t_network_ops_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.elevated_security_ops_log_admin](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.elevated_security_ops_log_bq_data_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.elevated_security_ops_log_bq_user](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.global_secrets_admin](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.grant-google-audit-encrypt-decrypt](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.grant-google-ops-encrypt-decrypt](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.grant-google-sec-encrypt-decrypt](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.scc_admin](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.security_ops_log_bq_data_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.security_ops_log_bq_user](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.security_ops_logging_viewer](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/project_iam_member) | resource |
| [google_pubsub_subscription.scc_notification_subscription](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/pubsub_subscription) | resource |
| [google_pubsub_topic.scc_notification_topic](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/pubsub_topic) | resource |
| [google_scc_notification_config.scc_notification_config](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/scc_notification_config) | resource |
| [google_storage_bucket.cf_default](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_object.cf_object](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/resources/storage_bucket_object) | resource |
| [random_string.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [archive_file.default](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [google_service_account_access_token.default](https://registry.terraform.io/providers/hashicorp/google/4.47.0/docs/data-sources/service_account_access_token) | data source |
| [terraform_remote_state.bootstrap](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_audit_logs_table_delete_contents_on_destroy"></a> [audit\_logs\_table\_delete\_contents\_on\_destroy](#input\_audit\_logs\_table\_delete\_contents\_on\_destroy) | (Optional) If set to true, delete all the tables in the dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present. | `bool` | `true` | no |
| <a name="input_audit_logs_table_expiration_days"></a> [audit\_logs\_table\_expiration\_days](#input\_audit\_logs\_table\_expiration\_days) | Period before tables expire for all audit logs in milliseconds. Default is 30 days. | `number` | `30` | no |
| <a name="input_base_net_hub_project_alert_pubsub_topic"></a> [base\_net\_hub\_project\_alert\_pubsub\_topic](#input\_base\_net\_hub\_project\_alert\_pubsub\_topic) | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` for the base net hub project. | `string` | `null` | no |
| <a name="input_base_net_hub_project_alert_spent_percents"></a> [base\_net\_hub\_project\_alert\_spent\_percents](#input\_base\_net\_hub\_project\_alert\_spent\_percents) | A list of percentages of the budget to alert on when threshold is exceeded for the base net hub project. | `list(number)` | <pre>[<br>  0.5,<br>  0.75,<br>  0.9,<br>  0.95<br>]</pre> | no |
| <a name="input_base_net_hub_project_budget_amount"></a> [base\_net\_hub\_project\_budget\_amount](#input\_base\_net\_hub\_project\_budget\_amount) | The amount to use as the budget for the base net hub project. | `number` | `1000` | no |
| <a name="input_create_access_context_manager_access_policy"></a> [create\_access\_context\_manager\_access\_policy](#input\_create\_access\_context\_manager\_access\_policy) | Whether to create access context manager access policy | `bool` | `true` | no |
| <a name="input_data_access_logs_enabled"></a> [data\_access\_logs\_enabled](#input\_data\_access\_logs\_enabled) | Enable Data Access logs of types DATA\_READ, DATA\_WRITE and ADMIN\_READ for all GCP services. Enabling Data Access logs might result in your organization being charged for the additional logs usage. See https://cloud.google.com/logging/docs/audit#data-access | `bool` | `true` | no |
| <a name="input_dns_hub_project_alert_pubsub_topic"></a> [dns\_hub\_project\_alert\_pubsub\_topic](#input\_dns\_hub\_project\_alert\_pubsub\_topic) | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` for the DNS hub project. | `string` | `null` | no |
| <a name="input_dns_hub_project_alert_spent_percents"></a> [dns\_hub\_project\_alert\_spent\_percents](#input\_dns\_hub\_project\_alert\_spent\_percents) | A list of percentages of the budget to alert on when threshold is exceeded for the DNS hub project. | `list(number)` | <pre>[<br>  0.5,<br>  0.75,<br>  0.9,<br>  0.95<br>]</pre> | no |
| <a name="input_dns_hub_project_budget_amount"></a> [dns\_hub\_project\_budget\_amount](#input\_dns\_hub\_project\_budget\_amount) | The amount to use as the budget for the DNS hub project. | `number` | `1000` | no |
| <a name="input_enable_os_login_policy"></a> [enable\_os\_login\_policy](#input\_enable\_os\_login\_policy) | Enable OS Login Organization Policy. | `bool` | `false` | no |
| <a name="input_gcp_audit_viewer"></a> [gcp\_audit\_viewer](#input\_gcp\_audit\_viewer) | Members are part of an audit team and view audit logs in the logging project. | `string` | `null` | no |
| <a name="input_gcp_billing_admin_user"></a> [gcp\_billing\_admin\_user](#input\_gcp\_billing\_admin\_user) | Identity that has billing administrator permissions | `string` | `null` | no |
| <a name="input_gcp_billing_creator_user"></a> [gcp\_billing\_creator\_user](#input\_gcp\_billing\_creator\_user) | Identity that can create billing accounts. | `string` | `null` | no |
| <a name="input_gcp_global_secrets_admin"></a> [gcp\_global\_secrets\_admin](#input\_gcp\_global\_secrets\_admin) | G Suite or Cloud Identity group that members are responsible for putting secrets into Secrets Manager. | `string` | `null` | no |
| <a name="input_gcp_network_viewer"></a> [gcp\_network\_viewer](#input\_gcp\_network\_viewer) | G Suite or Cloud Identity group that members are part of the networking team and review network configurations | `string` | `null` | no |
| <a name="input_gcp_org_admin_user"></a> [gcp\_org\_admin\_user](#input\_gcp\_org\_admin\_user) | Identity that has organization administrator permissions. | `string` | `null` | no |
| <a name="input_gcp_platform_viewer"></a> [gcp\_platform\_viewer](#input\_gcp\_platform\_viewer) | G Suite or Cloud Identity group that have the ability to view resource information across the Google Cloud organization. | `string` | `null` | no |
| <a name="input_gcp_scc_admin"></a> [gcp\_scc\_admin](#input\_gcp\_scc\_admin) | G Suite or Cloud Identity group that can administer Security Command Center. | `string` | `null` | no |
| <a name="input_gcp_security_reviewer"></a> [gcp\_security\_reviewer](#input\_gcp\_security\_reviewer) | G Suite or Cloud Identity group that members are part of the security team responsible for reviewing cloud security. | `string` | `null` | no |
| <a name="input_interconnect_project_alert_pubsub_topic"></a> [interconnect\_project\_alert\_pubsub\_topic](#input\_interconnect\_project\_alert\_pubsub\_topic) | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` for the Dedicated Interconnect project. | `string` | `null` | no |
| <a name="input_interconnect_project_alert_spent_percents"></a> [interconnect\_project\_alert\_spent\_percents](#input\_interconnect\_project\_alert\_spent\_percents) | A list of percentages of the budget to alert on when threshold is exceeded for the Dedicated Interconnect project. | `list(number)` | <pre>[<br>  0.5,<br>  0.75,<br>  0.9,<br>  0.95<br>]</pre> | no |
| <a name="input_interconnect_project_budget_amount"></a> [interconnect\_project\_budget\_amount](#input\_interconnect\_project\_budget\_amount) | The amount to use as the budget for the Dedicated Interconnect project. | `number` | `1000` | no |
| <a name="input_key_algorithm"></a> [key\_algorithm](#input\_key\_algorithm) | The algorithm to use when creating a version based on this template. See the https://cloud.google.com/kms/docs/reference/rest/v1/CryptoKeyVersionAlgorithm for possible inputs. | `string` | `"GOOGLE_SYMMETRIC_ENCRYPTION"` | no |
| <a name="input_key_protection_level"></a> [key\_protection\_level](#input\_key\_protection\_level) | The protection level to use when creating a version based on this template. Default value: "SOFTWARE" Possible values: ["SOFTWARE", "HSM"] | `string` | `"SOFTWARE"` | no |
| <a name="input_key_rotation_period"></a> [key\_rotation\_period](#input\_key\_rotation\_period) | n/a | `string` | `"7776000s"` | no |
| <a name="input_log_export_storage_force_destroy"></a> [log\_export\_storage\_force\_destroy](#input\_log\_export\_storage\_force\_destroy) | (Optional) If set to true, delete all contents when destroying the resource; otherwise, destroying the resource will fail if contents are present. | `bool` | `true` | no |
| <a name="input_log_export_storage_location"></a> [log\_export\_storage\_location](#input\_log\_export\_storage\_location) | The location of the storage bucket used to export logs. | `string` | `"US"` | no |
| <a name="input_log_export_storage_retention_policy"></a> [log\_export\_storage\_retention\_policy](#input\_log\_export\_storage\_retention\_policy) | Configuration of the bucket's data retention policy for how long objects in the bucket should be retained. | <pre>object({<br>    is_locked             = bool<br>    retention_period_days = number<br>  })</pre> | `null` | no |
| <a name="input_log_export_storage_versioning"></a> [log\_export\_storage\_versioning](#input\_log\_export\_storage\_versioning) | (Optional) Toggles bucket versioning, ability to retain a non-current object version when the live object version gets replaced or deleted. | `bool` | `true` | no |
| <a name="input_org_audit_logs_project_alert_pubsub_topic"></a> [org\_audit\_logs\_project\_alert\_pubsub\_topic](#input\_org\_audit\_logs\_project\_alert\_pubsub\_topic) | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` for the org audit logs project. | `string` | `null` | no |
| <a name="input_org_audit_logs_project_alert_spent_percents"></a> [org\_audit\_logs\_project\_alert\_spent\_percents](#input\_org\_audit\_logs\_project\_alert\_spent\_percents) | A list of percentages of the budget to alert on when threshold is exceeded for the org audit logs project. | `list(number)` | <pre>[<br>  0.5,<br>  0.75,<br>  0.9,<br>  0.95<br>]</pre> | no |
| <a name="input_org_audit_logs_project_budget_amount"></a> [org\_audit\_logs\_project\_budget\_amount](#input\_org\_audit\_logs\_project\_budget\_amount) | The amount to use as the budget for the org audit logs project. | `number` | `1000` | no |
| <a name="input_org_billing_logs_project_alert_pubsub_topic"></a> [org\_billing\_logs\_project\_alert\_pubsub\_topic](#input\_org\_billing\_logs\_project\_alert\_pubsub\_topic) | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` for the org billing logs project. | `string` | `null` | no |
| <a name="input_org_billing_logs_project_alert_spent_percents"></a> [org\_billing\_logs\_project\_alert\_spent\_percents](#input\_org\_billing\_logs\_project\_alert\_spent\_percents) | A list of percentages of the budget to alert on when threshold is exceeded for the org billing logs project. | `list(number)` | <pre>[<br>  0.5,<br>  0.75,<br>  0.9,<br>  0.95<br>]</pre> | no |
| <a name="input_org_billing_logs_project_budget_amount"></a> [org\_billing\_logs\_project\_budget\_amount](#input\_org\_billing\_logs\_project\_budget\_amount) | The amount to use as the budget for the org billing logs project. | `number` | `1000` | no |
| <a name="input_org_secrets_project_alert_pubsub_topic"></a> [org\_secrets\_project\_alert\_pubsub\_topic](#input\_org\_secrets\_project\_alert\_pubsub\_topic) | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` for the org secrets project. | `string` | `null` | no |
| <a name="input_org_secrets_project_alert_spent_percents"></a> [org\_secrets\_project\_alert\_spent\_percents](#input\_org\_secrets\_project\_alert\_spent\_percents) | A list of percentages of the budget to alert on when threshold is exceeded for the org secrets project. | `list(number)` | <pre>[<br>  0.5,<br>  0.75,<br>  0.9,<br>  0.95<br>]</pre> | no |
| <a name="input_org_secrets_project_budget_amount"></a> [org\_secrets\_project\_budget\_amount](#input\_org\_secrets\_project\_budget\_amount) | The amount to use as the budget for the org secrets project. | `number` | `1000` | no |
| <a name="input_parent_folder"></a> [parent\_folder](#input\_parent\_folder) | Optional - for an organization with existing projects or for development/validation. It will place all the example foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist. Must be the same value used in previous step. | `string` | `""` | no |
| <a name="input_restricted_net_hub_project_alert_pubsub_topic"></a> [restricted\_net\_hub\_project\_alert\_pubsub\_topic](#input\_restricted\_net\_hub\_project\_alert\_pubsub\_topic) | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` for the restricted net hub project. | `string` | `null` | no |
| <a name="input_restricted_net_hub_project_alert_spent_percents"></a> [restricted\_net\_hub\_project\_alert\_spent\_percents](#input\_restricted\_net\_hub\_project\_alert\_spent\_percents) | A list of percentages of the budget to alert on when threshold is exceeded for the restricted net hub project. | `list(number)` | <pre>[<br>  0.5,<br>  0.75,<br>  0.9,<br>  0.95<br>]</pre> | no |
| <a name="input_restricted_net_hub_project_budget_amount"></a> [restricted\_net\_hub\_project\_budget\_amount](#input\_restricted\_net\_hub\_project\_budget\_amount) | The amount to use as the budget for the restricted net hub project. | `number` | `1000` | no |
| <a name="input_scc_notification_filter"></a> [scc\_notification\_filter](#input\_scc\_notification\_filter) | Filter used to create the Security Command Center Notification, you can see more details on how to create filters in https://cloud.google.com/security-command-center/docs/how-to-api-filter-notifications#create-filter | `string` | `"state = \"ACTIVE\""` | no |
| <a name="input_scc_notifications_project_alert_pubsub_topic"></a> [scc\_notifications\_project\_alert\_pubsub\_topic](#input\_scc\_notifications\_project\_alert\_pubsub\_topic) | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}` for the SCC notifications project. | `string` | `null` | no |
| <a name="input_scc_notifications_project_alert_spent_percents"></a> [scc\_notifications\_project\_alert\_spent\_percents](#input\_scc\_notifications\_project\_alert\_spent\_percents) | A list of percentages of the budget to alert on when threshold is exceeded for the SCC notifications project. | `list(number)` | <pre>[<br>  0.5,<br>  0.75,<br>  0.9,<br>  0.95<br>]</pre> | no |
| <a name="input_scc_notifications_project_budget_amount"></a> [scc\_notifications\_project\_budget\_amount](#input\_scc\_notifications\_project\_budget\_amount) | The amount to use as the budget for the SCC notifications project. | `number` | `1000` | no |
| <a name="input_skip_gcloud_download"></a> [skip\_gcloud\_download](#input\_skip\_gcloud\_download) | Whether to skip downloading gcloud (assumes gcloud is already available outside the module. If set to true you, must ensure that Gcloud Alpha module is installed.) | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_context_manager_policy_id"></a> [access\_context\_manager\_policy\_id](#output\_access\_context\_manager\_policy\_id) | n/a |
| <a name="output_base_net_hub_project_id"></a> [base\_net\_hub\_project\_id](#output\_base\_net\_hub\_project\_id) | The Base Network hub project ID |
| <a name="output_billing_account"></a> [billing\_account](#output\_billing\_account) | n/a |
| <a name="output_common_folder_name"></a> [common\_folder\_name](#output\_common\_folder\_name) | The common folder name |
| <a name="output_dns_hub_project_id"></a> [dns\_hub\_project\_id](#output\_dns\_hub\_project\_id) | The DNS hub project ID |
| <a name="output_logs_export_pubsub_topic"></a> [logs\_export\_pubsub\_topic](#output\_logs\_export\_pubsub\_topic) | The Pub/Sub topic for destination of log exports |
| <a name="output_logs_export_storage_bucket_name"></a> [logs\_export\_storage\_bucket\_name](#output\_logs\_export\_storage\_bucket\_name) | The storage bucket for destination of log exports |
| <a name="output_logs_export_storage_bucket_name_operations"></a> [logs\_export\_storage\_bucket\_name\_operations](#output\_logs\_export\_storage\_bucket\_name\_operations) | The storage bucket for destination of log exports |
| <a name="output_logs_export_storage_bucket_name_security"></a> [logs\_export\_storage\_bucket\_name\_security](#output\_logs\_export\_storage\_bucket\_name\_security) | The storage bucket for destination of log exports |
| <a name="output_notrust_interconnect_project_id"></a> [notrust\_interconnect\_project\_id](#output\_notrust\_interconnect\_project\_id) | The notrust Interconnect project ID |
| <a name="output_org_audit_logs_project_id"></a> [org\_audit\_logs\_project\_id](#output\_org\_audit\_logs\_project\_id) | The org audit logs project ID |
| <a name="output_org_billing_logs_project_id"></a> [org\_billing\_logs\_project\_id](#output\_org\_billing\_logs\_project\_id) | The org billing logs project ID |
| <a name="output_org_operations_logs_project_id"></a> [org\_operations\_logs\_project\_id](#output\_org\_operations\_logs\_project\_id) | The org operations logs project ID |
| <a name="output_org_secrets_project_id"></a> [org\_secrets\_project\_id](#output\_org\_secrets\_project\_id) | The org secrets project ID |
| <a name="output_org_security_logs_project_id"></a> [org\_security\_logs\_project\_id](#output\_org\_security\_logs\_project\_id) | The org security logs project ID |
| <a name="output_parent_resource_id"></a> [parent\_resource\_id](#output\_parent\_resource\_id) | The parent resource id |
| <a name="output_parent_resource_type"></a> [parent\_resource\_type](#output\_parent\_resource\_type) | The parent resource type |
| <a name="output_restricted_net_hub_project_id"></a> [restricted\_net\_hub\_project\_id](#output\_restricted\_net\_hub\_project\_id) | The Restricted Network hub project ID |
| <a name="output_scc_notification_name"></a> [scc\_notification\_name](#output\_scc\_notification\_name) | Name of SCC Notification |
| <a name="output_scc_notifications_project_id"></a> [scc\_notifications\_project\_id](#output\_scc\_notifications\_project\_id) | The SCC notifications project ID |
| <a name="output_trust_interconnect_project_id"></a> [trust\_interconnect\_project\_id](#output\_trust\_interconnect\_project\_id) | The trust Interconnect project ID |

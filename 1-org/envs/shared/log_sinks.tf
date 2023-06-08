/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


resource "random_string" "suffix" {
  length  = 4
  upper   = false
  special = false
}

/******************************************
  Send logs to BigQuery
*****************************************/

module "log_export_to_biqquery" {
  source                 = "../../../modules/bigquery_destination"
  destination_uri        = module.bigquery_destination.destination_uri
  filter                 = local.main_logs_filter
  log_sink_name          = "${local.log_sink_prefix}-${local.shared_environment_code}-logging-bq"
  parent_resource_id     = local.parent_resource_id
  parent_resource_type   = local.parent_resource_type
  include_children       = true
  unique_writer_identity = true
  bigquery_options = {
    use_partitioned_tables = true
  }
}

module "log_export_to_biqquery_operations" {
  source                 = "../../../modules/bigquery_destination"
  destination_uri        = module.bigquery_destination_operations.destination_uri
  filter                 = local.operations_logs_filter
  log_sink_name          = "${local.log_sink_prefix}-${local.shared_environment_code}-operations-logging-bq"
  parent_resource_id     = local.parent_resource_id
  parent_resource_type   = local.parent_resource_type
  include_children       = true
  unique_writer_identity = true
  bigquery_options = {
    use_partitioned_tables = true
  }
}

module "log_export_to_biqquery_security" {
  source                 = "../../../modules/bigquery_destination"
  destination_uri        = module.bigquery_destination_security.destination_uri
  filter                 = local.security_logs_filter
  log_sink_name          = "${local.log_sink_prefix}-${local.shared_environment_code}-security-logging-bq"
  parent_resource_id     = local.parent_resource_id
  parent_resource_type   = local.parent_resource_type
  include_children       = true
  unique_writer_identity = true
  bigquery_options = {
    use_partitioned_tables = true
  }
}

module "bigquery_destination" {
  source                     = "../../../modules/bigquery"
  project_id                 = module.org_audit_logs.project_id
  dataset_name               = "audit_logs"
  log_sink_writer_identity   = module.log_export_to_biqquery.writer_identity
  expiration_days            = var.audit_logs_table_expiration_days
  delete_contents_on_destroy = var.audit_logs_table_delete_contents_on_destroy
}

module "bigquery_destination_operations" {
  source                     = "../../../modules/bigquery"
  project_id                 = module.org_operations_logs.project_id
  dataset_name               = "operations_logs"
  log_sink_writer_identity   = module.log_export_to_biqquery_operations.writer_identity
  expiration_days            = var.audit_logs_table_expiration_days
  delete_contents_on_destroy = var.audit_logs_table_delete_contents_on_destroy
}

module "bigquery_destination_security" {
  source                     = "../../../modules/bigquery"
  project_id                 = module.org_security_logs.project_id
  dataset_name               = "security_logs"
  log_sink_writer_identity   = module.log_export_to_biqquery_security.writer_identity
  expiration_days            = var.audit_logs_table_expiration_days
  delete_contents_on_destroy = var.audit_logs_table_delete_contents_on_destroy
}

/******************************************
  Send logs to Storage
*****************************************/

module "log_export_to_storage" {
  source                 = "../../../modules/bigquery_destination"
  destination_uri        = module.storage_destination.destination_uri
  filter                 = local.all_logs_filter
  log_sink_name          = "${local.log_sink_prefix}-${local.shared_environment_code}-logging-${local.bucket_prefix}"
  parent_resource_id     = local.parent_resource_id
  parent_resource_type   = local.parent_resource_type
  include_children       = true
  unique_writer_identity = true
}

module "storage_destination" {
  source                      = "../../../modules/storage"
  project_id                  = module.org_audit_logs.project_id
  storage_bucket_name         = "${local.bucket_prefix}-${module.org_audit_logs.project_id}-org-logs-${random_string.suffix.result}"
  log_sink_writer_identity    = module.log_export_to_storage.writer_identity
  uniform_bucket_level_access = true
  location                    = var.log_export_storage_location
  retention_policy            = var.log_export_storage_retention_policy
  force_destroy               = var.log_export_storage_force_destroy
  versioning                  = var.log_export_storage_versioning
  kms_key_name                = google_kms_crypto_key.audit_logs_key.id
  depends_on = [
    google_kms_crypto_key.audit_logs_key,
    google_kms_key_ring.audit_logs_keyring
  ]
}

module "log_export_to_storage_operations" {
  source                 = "../../../modules/bigquery_destination"
  destination_uri        = module.storage_destination_operations.destination_uri
  filter                 = local.all_logs_filter
  log_sink_name          = "${local.log_sink_prefix}-${local.shared_environment_code}-operations-logging-${local.bucket_prefix}"
  parent_resource_id     = local.parent_resource_id
  parent_resource_type   = local.parent_resource_type
  include_children       = true
  unique_writer_identity = true
}

module "storage_destination_operations" {
  source                      = "../../../modules/storage"
  project_id                  = module.org_operations_logs.project_id
  storage_bucket_name         = "${local.bucket_prefix}-${module.org_operations_logs.project_id}-operations-logs-${random_string.suffix.result}"
  log_sink_writer_identity    = module.log_export_to_storage_operations.writer_identity
  uniform_bucket_level_access = true
  location                    = var.log_export_storage_location
  retention_policy            = var.log_export_storage_retention_policy
  force_destroy               = var.log_export_storage_force_destroy
  versioning                  = var.log_export_storage_versioning
  kms_key_name                = google_kms_crypto_key.org_operations_logs_key.id
  depends_on = [
    google_kms_crypto_key.org_operations_logs_key,
    google_kms_key_ring.org_operations_logs_keyring
  ]
}

module "log_export_to_storage_security" {
  source                 = "../../../modules/bigquery_destination"
  destination_uri        = module.storage_destination_security.destination_uri
  filter                 = local.all_logs_filter
  log_sink_name          = "${local.log_sink_prefix}-${local.shared_environment_code}-security-logging-${local.bucket_prefix}"
  parent_resource_id     = local.parent_resource_id
  parent_resource_type   = local.parent_resource_type
  include_children       = true
  unique_writer_identity = true
}

module "storage_destination_security" {
  source                      = "../../../modules/storage"
  project_id                  = module.org_security_logs.project_id
  storage_bucket_name         = "${local.bucket_prefix}-${module.org_security_logs.project_id}-security-logs-${random_string.suffix.result}"
  log_sink_writer_identity    = module.log_export_to_storage_security.writer_identity
  uniform_bucket_level_access = true
  location                    = var.log_export_storage_location
  retention_policy            = var.log_export_storage_retention_policy
  force_destroy               = var.log_export_storage_force_destroy
  versioning                  = var.log_export_storage_versioning
  kms_key_name                = google_kms_crypto_key.storage_destination_security_key.id
  depends_on = [
    google_kms_crypto_key.storage_destination_security_key,
    google_kms_key_ring.storage_destination_security_keyring
  ]
}
/******************************************
  Send logs to Pub\Sub
*****************************************/

module "log_export_to_pubsub" {
  source                 = "../../../modules/bigquery_destination"
  destination_uri        = module.pubsub_destination.destination_uri
  filter                 = local.main_logs_filter
  log_sink_name          = "${local.log_sink_prefix}-${local.shared_environment_code}-logging-pub"
  parent_resource_id     = local.parent_resource_id
  parent_resource_type   = local.parent_resource_type
  include_children       = true
  unique_writer_identity = true
}

module "pubsub_destination" {
  source                   = "../../../modules/pubsub"
  project_id               = module.org_audit_logs.project_id
  topic_name               = "tp-org-logs-${random_string.suffix.result}"
  log_sink_writer_identity = module.log_export_to_pubsub.writer_identity
  create_subscriber        = true
}

/******************************************
  Billing logs (Export configured manually)
*****************************************/

resource "google_bigquery_dataset" "billing_dataset" {
  dataset_id    = "billing_data"
  project       = module.org_billing_logs.project_id
  friendly_name = "GCP Billing Data"
  location      = local.gcp_region
}

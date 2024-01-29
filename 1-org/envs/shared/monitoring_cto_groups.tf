module "output_bucket" {
  source                   = "../../../modules/storage"
  location                 = local.gcp_region
  storage_bucket_name      = "cto-grp-monthly-report-${local.shared_environment_code}-${random_string.suffix.result}"
  project_id               = module.org_operations_logs.project_id
  log_sink_writer_identity = "serviceAccount:project-service-account@${module.org_operations_logs.project_id}.iam.gserviceaccount.com"
  kms_key_name             = google_kms_crypto_key.audit_logs_key.id
}

resource "google_storage_bucket" "cf_default" {
  location                    = local.gcp_region
  name                        = "cto-group-cf-${local.shared_environment_code}-${random_string.suffix.result}"
  uniform_bucket_level_access = true
  project                     = module.org_operations_logs.project_id
  encryption {
    default_kms_key_name = google_kms_crypto_key.audit_logs_key.id
  }
  retention_policy {
    retention_period = 90 * 24 * 60 * 60
    is_locked        = true
  }
}

data "archive_file" "default" {
  type        = "zip"
  output_path = "/tmp/monitoring.zip"
  source_dir  = "../../../monitoring/cto_groups/"
}

resource "google_storage_bucket_object" "cf_object" {
  name   = "fn-source-${local.shared_environment_code}-${random_string.suffix.result}"
  bucket = google_storage_bucket.cf_default.name
  source = data.archive_file.default.output_path
}

resource "google_cloudfunctions_function" "monitoring_ctos" {
  name                = "cto-group-${local.shared_environment_code}-cf-${random_string.suffix.result}"
  project             = module.org_operations_logs.project_id
  region              = local.gcp_region
  runtime             = "python39"
  available_memory_mb = 256
  environment_variables = {
    ORG_DOMAIN_NAME = local.domain
    BUCKET_NAME     = module.output_bucket.resource_name
    PARENT_FOLDER   = local.parent_folder
  }
  source_archive_bucket = google_storage_bucket.cf_default.name
  source_archive_object = google_storage_bucket_object.cf_object.name
  trigger_http          = true
  entry_point           = "fetch_cto_build_group"
}

resource "google_cloud_scheduler_job" "cto_scheduler" {
  name        = "cto-group-cf-${local.shared_env}-${random_string.suffix.result}"
  project     = module.org_operations_logs.project_id
  region      = local.gcp_region
  description = "Schedule the cto group cloud function to run every 1st of month"
  schedule    = "* * 1 * *"
  http_target {
    http_method = "GET"
    uri         = google_cloudfunctions_function.monitoring_ctos.https_trigger_url

    oidc_token {
      service_account_email = "project-service-account@${module.org_operations_logs.project_id}.iam.gserviceaccount.com"
    }
  }
}

resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.monitoring_ctos.project
  region         = google_cloudfunctions_function.monitoring_ctos.region
  cloud_function = google_cloudfunctions_function.monitoring_ctos.name

  role   = "roles/cloudfunctions.invoker"
  member = "serviceAccount:project-service-account@${module.org_operations_logs.project_id}.iam.gserviceaccount.com"
}
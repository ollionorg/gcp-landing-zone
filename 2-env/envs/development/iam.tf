
#base shared vpc network operations
resource "google_project_iam_member" "base_network_operations" {
  count   = local.cto_core_networking_operations_group != null ? 1 : 0
  project = module.env.base_shared_vpc_project_id
  role    = "roles/viewer"
  member  = "group:${local.cto_core_networking_operations_group}"
}

#env logging project
resource "google_project_iam_member" "prod_logging" {
  count   = local.enable_env_log_sink && local.cto_operations_group != null ? 1 : 0
  project = module.env.logging_project_id
  role    = "roles/viewer"
  member  = "group:${local.cto_operations_group}"
}

#env monitoring project
resource "google_project_iam_member" "prod_monitoring" {
  count   = local.cto_operations_group != null ? 1 : 0
  project = module.env.monitoring_project_id
  role    = "roles/viewer"
  member  = "group:${local.cto_operations_group}"
}

#env secrets project
resource "google_project_iam_member" "prod_secrets" {
  count   = local.cto_elevated_security_operations_group != null ? 1 : 0
  project = module.env.env_secrets_project_id
  role    = "roles/viewer"
  member  = "group:${local.cto_elevated_security_operations_group}"
}


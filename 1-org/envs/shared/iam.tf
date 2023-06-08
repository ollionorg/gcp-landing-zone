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

/******************************************
  Audit Logs - IAM
*****************************************/

resource "google_organization_iam_audit_config" "org_config" {
  count   = var.data_access_logs_enabled && local.parent_folder == "" ? 1 : 0
  org_id  = local.org_id
  service = "allServices"

  audit_log_config {
    log_type = "DATA_READ"
  }
  audit_log_config {
    log_type = "DATA_WRITE"
  }
  audit_log_config {
    log_type = "ADMIN_READ"
  }
}

resource "google_folder_iam_audit_config" "folder_config" {
  count   = var.data_access_logs_enabled && local.parent_folder != "" ? 1 : 0
  folder  = "folders/${local.parent_folder}"
  service = "allServices"

  audit_log_config {
    log_type = "DATA_READ"
  }
  audit_log_config {
    log_type = "DATA_WRITE"
  }
  audit_log_config {
    log_type = "ADMIN_READ"
  }
}

resource "google_project_iam_member" "audit_log_bq_user" {
  count   = local.cto_audit_compliance_operations_group != null ? 1 : 0
  project = module.org_audit_logs.project_id
  role    = "roles/bigquery.user"
  member  = "group:${local.cto_audit_compliance_operations_group}"
}

resource "google_project_iam_member" "audit_log_bq_data_viewer" {
  count   = local.cto_audit_compliance_operations_group != null ? 1 : 0
  project = module.org_audit_logs.project_id
  role    = "roles/bigquery.dataViewer"
  member  = "group:${local.cto_audit_compliance_operations_group}"
}

resource "google_project_iam_member" "audit_log_viewer" {
  count   = local.cto_audit_compliance_operations_group != null ? 1 : 0
  project = module.org_audit_logs.project_id
  role    = "roles/logging.viewer"
  member  = "group:${local.cto_audit_compliance_operations_group}"
}

resource "google_project_iam_member" "audit_private_logviewer" {
  count   = local.cto_audit_compliance_operations_group != null ? 1 : 0
  project = module.org_audit_logs.project_id
  role    = "roles/logging.privateLogViewer"
  member  = "group:${local.cto_audit_compliance_operations_group}"
}

resource "google_project_iam_member" "audit_bq_data_viewer" {
  count   = local.cto_audit_compliance_operations_group != null ? 1 : 0
  project = module.org_audit_logs.project_id
  role    = "roles/bigquery.dataViewer"
  member  = "group:${local.cto_audit_compliance_operations_group}"
}

# Security logging project
resource "google_project_iam_member" "security_ops_log_bq_user" {
  count   = local.cto_security_operations_group != null ? 1 : 0
  project = module.org_security_logs.project_id
  role    = "roles/bigquery.user"
  member  = "group:${local.cto_security_operations_group}"
}

resource "google_project_iam_member" "security_ops_log_bq_data_viewer" {
  count   = local.cto_security_operations_group != null ? 1 : 0
  project = module.org_security_logs.project_id
  role    = "roles/bigquery.dataViewer"
  member  = "group:${local.cto_security_operations_group}"
}

resource "google_project_iam_member" "security_ops_logging_viewer" {
  project = module.org_security_logs.project_id
  role    = "roles/logging.viewer"
  member  = "group:${local.cto_security_operations_group}"
}

resource "google_project_iam_member" "elevated_security_ops_log_bq_user" {
  project = module.org_security_logs.project_id
  role    = "roles/bigquery.user"
  member  = "group:${local.cto_elevated_security_operations_group}"
}

resource "google_project_iam_member" "elevated_security_ops_log_bq_data_viewer" {
  project = module.org_security_logs.project_id
  role    = "roles/bigquery.dataViewer"
  member  = "group:${local.cto_elevated_security_operations_group}"
}

resource "google_project_iam_member" "elevated_security_ops_log_admin" {
  project = module.org_security_logs.project_id
  role    = "roles/logging.admin"
  member  = "group:${local.cto_elevated_security_operations_group}"
}

#Operaations group iam assignment
resource "google_project_iam_member" "cto_operations_log_bq_user" {
  project = module.org_operations_logs.project_id
  role    = "roles/bigquery.user"
  member  = "group:${local.cto_operations_group}"
}

resource "google_project_iam_member" "cto_operations_log_bq_data_viewer" {
  project = module.org_operations_logs.project_id
  role    = "roles/bigquery.dataViewer"
  member  = "group:${local.cto_operations_group}"
}

resource "google_project_iam_member" "cto_operations_logging_viewer" {
  project = module.org_operations_logs.project_id
  role    = "roles/logging.viewer"
  member  = "group:${local.cto_operations_group}"
}

#networking operations group
resource "google_project_iam_member" "cto_t_network_ops_network_viewer" {
  count   = local.enable_interconnect_projects ? 1 : 0
  project = module.trust_interconnect[0].project_id
  role    = "roles/compute.networkViewer"
  member  = "group:${local.cto_core_networking_operations_group}"
}

resource "google_project_iam_member" "cto_t_network_ops_viewer" {
  count   = local.enable_interconnect_projects ? 1 : 0
  project = module.trust_interconnect[0].project_id
  role    = "roles/viewer"
  member  = "group:${local.cto_core_networking_operations_group}"
}

resource "google_project_iam_member" "cto_nt_network_ops_network_viewer" {
  count   = local.enable_interconnect_projects ? 1 : 0
  project = module.notrust_interconnect[0].project_id
  role    = "roles/compute.networkViewer"
  member  = "group:${local.cto_core_networking_operations_group}"
}

resource "google_project_iam_member" "cto_nt_network_ops_viewer" {
  count   = local.enable_interconnect_projects ? 1 : 0
  project = module.notrust_interconnect[0].project_id
  role    = "roles/viewer"
  member  = "group:${local.cto_core_networking_operations_group}"
}

#shared base network iam assignment

resource "google_project_iam_member" "cto_base_network_ops_viewer" {
  count   = local.enable_hub_and_spoke ? 1 : 0
  project = module.base_network_hub[0].project_id
  role    = "roles/viewer"
  member  = "group:${local.cto_core_networking_operations_group}"
}

resource "google_project_iam_member" "cto_dns_hub_network_ops_viewer" {
  project = module.dns_hub.project_id
  role    = "roles/viewer"
  member  = "group:${local.cto_core_networking_operations_group}"
}
/******************************************
  Billing BigQuery - IAM
*****************************************/

resource "google_project_iam_member" "billing_bq_user" {
  project = module.org_billing_logs.project_id
  role    = "roles/bigquery.user"
  member  = "group:${local.cfo}"
}

resource "google_project_iam_member" "billing_bq_viewer" {
  project = module.org_billing_logs.project_id
  role    = "roles/bigquery.dataViewer"
  member  = "group:${local.cfo}"
}

/******************************************
  Billing Cloud Console - IAM
*****************************************/

resource "google_organization_iam_member" "billing_viewer" {
  org_id = local.org_id
  role   = "roles/billing.viewer"
  member = "group:${local.cfo}"
}

/******************************************
 Groups permissions according to SFB (Section 6.2 - Users and groups) - IAM
*****************************************/

resource "google_organization_iam_member" "organization_viewer" {
  count  = local.cto_operations_group != null && local.parent_folder == "" ? 1 : 0
  org_id = local.org_id
  role   = "roles/viewer"
  member = "group:${local.cto_operations_group}"
}

resource "google_folder_iam_member" "organization_viewer" {
  count  = local.cto_operations_group != null && local.parent_folder != "" ? 1 : 0
  folder = "folders/${local.parent_folder}"
  role   = "roles/viewer"
  member = "group:${local.cto_operations_group}"
}

resource "google_organization_iam_member" "security_reviewer" {
  count  = local.cto_security_operations_group != null && local.parent_folder == "" ? 1 : 0
  org_id = local.org_id
  role   = "roles/iam.securityReviewer"
  member = "group:${local.cto_security_operations_group}"
}

resource "google_folder_iam_member" "security_reviewer" {
  count  = local.cto_security_operations_group != null && local.parent_folder != "" ? 1 : 0
  folder = "folders/${local.parent_folder}"
  role   = "roles/iam.securityReviewer"
  member = "group:${local.cto_security_operations_group}"
}

resource "google_organization_iam_member" "network_viewer" {
  count  = local.cto_core_networking_operations_group != null && local.parent_folder == "" ? 1 : 0
  org_id = local.org_id
  role   = "roles/compute.networkViewer"
  member = "group:${local.cto_core_networking_operations_group}"
}

resource "google_folder_iam_member" "network_viewer" {
  count  = local.cto_core_networking_operations_group != null && local.parent_folder != "" ? 1 : 0
  folder = "folders/${local.parent_folder}"
  role   = "roles/compute.networkViewer"
  member = "group:${local.cto_core_networking_operations_group}"
}

resource "google_project_iam_member" "scc_admin" {
  count   = local.cto_security_operations_group != null ? 1 : 0
  project = module.scc_notifications.project_id
  role    = "roles/securitycenter.adminEditor"
  member  = "group:${local.cto_security_operations_group}"
}

resource "google_project_iam_member" "global_secrets_admin" {
  count   = local.cto_elevated_security_operations_group != null ? 1 : 0
  project = module.org_secrets.project_id
  role    = "roles/secretmanager.admin"
  member  = "group:${local.cto_elevated_security_operations_group}"
}

/******************************************
 Privileged accounts permissions according to SFB (Section 6.3 - Privileged identities)
*****************************************/

resource "google_organization_iam_member" "org_admin_user" {
  count  = local.group_org_admins != null && local.parent_folder == "" ? 1 : 0
  org_id = local.org_id
  role   = "roles/resourcemanager.organizationAdmin"
  member = "group:${local.group_org_admins}"
}

resource "google_folder_iam_member" "org_admin_user" {
  count  = local.group_org_admins != null && local.parent_folder != "" ? 1 : 0
  folder = "folders/${local.parent_folder}"
  role   = "roles/resourcemanager.folderAdmin"
  member = "group:${local.group_org_admins}"
}

resource "google_organization_iam_member" "billing_creator_user" {
  count  = local.cfo != null && local.parent_folder == "" ? 1 : 0
  org_id = local.org_id
  role   = "roles/billing.creator"
  member = "group:${local.cfo}"
}

resource "google_billing_account_iam_member" "billing_admin_user" {
  count              = local.cfo != null ? 1 : 0
  billing_account_id = local.billing_account
  role               = "roles/billing.admin"
  member             = "group:${local.cfo}"
}

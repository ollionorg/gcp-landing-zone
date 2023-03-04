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

resource "google_folder_iam_member" "organization_viewer" {
  count  = local.cto_operations_group != null && local.parent_folder != "" ? 1 : 0
  folder = "folders/${local.parent_folder}"
  role   = "roles/viewer"
  member = "group:${local.cto_operations_group}"
}

resource "google_folder_iam_member" "security_reviewer" {
  count  = local.cto_security_operations_group != null && local.parent_folder != "" ? 1 : 0
  folder = "folders/${local.parent_folder}"
  role   = "roles/iam.securityReviewer"
  member = "group:${local.cto_security_operations_group}"
}

resource "google_folder_iam_member" "network_viewer" {
  count  = local.cto_core_networking_operations_group != null && local.parent_folder != "" ? 1 : 0
  folder = "folders/${local.parent_folder}"
  role   = "roles/compute.networkViewer"
  member = "group:${local.cto_core_networking_operations_group}"
}

resource "google_folder_iam_member" "org_admin_user" {
  count  = local.org_admins_group != null && local.parent_folder != "" ? 1 : 0
  folder = "folders/${local.parent_folder}"
  role   = "roles/resourcemanager.folderAdmin"
  member = "group:${local.org_admins_group}"
}
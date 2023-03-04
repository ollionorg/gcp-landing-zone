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

/******************************************
  Billing Cloud Console - IAM
*****************************************/

resource "google_organization_iam_member" "billing_viewer" {
  org_id = local.org_id
  role   = "roles/billing.viewer"
  member = "group:${local.cfo_group}"
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

resource "google_organization_iam_member" "security_reviewer" {
  count  = local.cto_security_operations_group != null && local.parent_folder == "" ? 1 : 0
  org_id = local.org_id
  role   = "roles/iam.securityReviewer"
  member = "group:${local.cto_security_operations_group}"
}

resource "google_organization_iam_member" "network_viewer" {
  count  = local.cto_core_networking_operations_group != null && local.parent_folder == "" ? 1 : 0
  org_id = local.org_id
  role   = "roles/compute.networkViewer"
  member = "group:${local.cto_core_networking_operations_group}"
}

/******************************************
 Privileged accounts permissions according to SFB (Section 6.3 - Privileged identities)
*****************************************/

resource "google_organization_iam_member" "org_admin_user" {
  count  = local.org_admins_group != null && local.parent_folder == "" ? 1 : 0
  org_id = local.org_id
  role   = "roles/resourcemanager.organizationAdmin"
  member = "group:${local.org_admins_group}"
}

resource "google_organization_iam_member" "billing_creator_user" {
  count  = local.cfo_group != null && local.parent_folder == "" ? 1 : 0
  org_id = local.org_id
  role   = "roles/billing.creator"
  member = "group:${local.cfo_group}"
}

resource "google_billing_account_iam_member" "billing_admin_user" {
  count              = local.cfo_group != null ? 1 : 0
  billing_account_id = local.billing_account
  role               = "roles/billing.admin"
  member             = "group:${local.cfo_group}"
}

resource "google_billing_account_iam_member" "billing_admin_user_vishal" {
  count              = local.cfo_group != null ? 1 : 0
  billing_account_id = local.billing_account
  role               = "roles/billing.admin"
  member             = "user:vishal.kapse@cldcvr.com"
}


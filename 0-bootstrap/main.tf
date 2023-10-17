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

/*************************************************
  Bootstrap GCP Organization.
**************************************************/

resource "google_folder" "bootstrap" {
  display_name = "${var.folder_prefix}-bootstrap"
  parent       = local.parent
}

module "seed_bootstrap" {
  source                         = "../modules/terraform-google-bootstrap"
  org_id                         = var.org_id
  folder_id                      = google_folder.bootstrap.id
  project_id                     = "${var.project_prefix}-${var.bootstrap_env_code}-seed"
  state_bucket_name              = "${var.bucket_prefix}-${var.bootstrap_env_code}-tfstate"
  billing_account                = var.billing_account
  group_org_admins               = var.group_org_admins
  group_billing_admins           = var.group_billing_admins
  default_region                 = var.default_region
  org_project_creators           = var.org_project_creators
  sa_enable_impersonation        = true
  parent_folder                  = var.parent_folder == "" ? "" : local.parent
  org_admins_org_iam_permissions = local.org_admins_org_iam_permissions
  project_prefix                 = var.project_prefix

  project_labels = merge(
    var.custom_labels, {
      environment       = var.bootstrap_environment_name
      application_name  = "seed-${var.bootstrap_environment_name}"
      primary_contact   = var.primary_contact
      secondary_contact = var.secondary_contact
    }
  )

  activate_apis = [
    "accesscontextmanager.googleapis.com",
    "admin.googleapis.com",
    "appengine.googleapis.com",
    "bigquery.googleapis.com",
    "billingbudgets.googleapis.com",
    "cloudasset.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "iam.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "pubsub.googleapis.com",
    "securitycenter.googleapis.com",
    "servicenetworking.googleapis.com",
    "serviceusage.googleapis.com",
    "storage-api.googleapis.com",
    "container.googleapis.com",
    "gkehub.googleapis.com"
  ]

  sa_org_iam_permissions = [
    "roles/accesscontextmanager.policyAdmin",
    "roles/billing.user",
    "roles/compute.networkAdmin",
    "roles/compute.xpnAdmin",
    "roles/iam.securityAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/logging.configWriter",
    "roles/orgpolicy.policyAdmin",
    "roles/resourcemanager.folderAdmin",
    "roles/resourcemanager.organizationViewer",
    "roles/resourcemanager.projectCreator",
    "roles/securitycenter.notificationConfigEditor",
    "roles/gkemulticloud.admin",
    "roles/gkehub.admin",
    "roles/container.admin",
    "roles/container.clusterAdmin",
    "roles/resourcemanager.projectIamAdmin",
    "roles/serviceusage.serviceUsageAdmin",
    "roles/iam.serviceAccountUser"
  ]
}

resource "google_billing_account_iam_member" "tf_billing_admin" {
  billing_account_id = var.billing_account
  role               = "roles/billing.admin"
  member             = "serviceAccount:${module.seed_bootstrap.terraform_sa_email}"
}

module "cloudbuild_bootstrap" {
  source                      = "../modules/cloudbuild"
  create_cloud_source_repos   = false
  org_id                      = var.org_id
  folder_id                   = google_folder.bootstrap.id
  project_id                  = "${var.project_prefix}-${var.bootstrap_env_code}-cicd"
  billing_account             = var.billing_account
  group_org_admins            = var.group_org_admins
  default_region              = var.default_region
  terraform_sa_email          = module.seed_bootstrap.terraform_sa_email
  terraform_sa_name           = module.seed_bootstrap.terraform_sa_name
  terraform_state_bucket      = module.seed_bootstrap.gcs_bucket_tfstate
  sa_enable_impersonation     = true
  project_prefix              = var.project_prefix
  cloud_source_repos          = var.cloud_source_repos
  gar_repo_name               = var.gar_repo_name
  terraform_validator_release = "v0.4.0"
  terraform_version           = "1.0.9"
  terraform_version_sha256sum = "f06ac64c6a14ed6a923d255788e4a5daefa2b50e35f32d7a3b5a2f9a5a91e255"

  activate_apis = [
    "admin.googleapis.com",
    "appengine.googleapis.com",
    "bigquery.googleapis.com",
    "billingbudgets.googleapis.com",
    "cloudasset.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "iam.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "secretmanager.googleapis.com",
    "servicenetworking.googleapis.com",
    "serviceusage.googleapis.com",
    "storage-api.googleapis.com",
    "storage-component.googleapis.com"
  ]

  project_labels = merge(
    var.custom_labels, {
      environment       = var.bootstrap_environment_name
      application_name  = "cloudbuild-${var.bootstrap_environment_name}"
      primary_contact   = var.primary_contact
      secondary_contact = var.secondary_contact
    }
  )

  #  terraform_apply_branches = [
  #    "development",
  #    "staging", //non-production needs a \ to ensure regex matches correct branches.
  #    "production"
  #  ]
}

// Standalone repo for Terraform-validator policies.
// This repo does not need to trigger builds in Cloud Build.
resource "google_sourcerepo_repository" "gcp_policies" {
  project = module.cloudbuild_bootstrap.cloudbuild_project_id
  name    = "gcp-policies"

  depends_on = [
    module.cloudbuild_bootstrap.csr_repos
  ]
}

resource "google_project_iam_member" "project_source_reader" {
  project = module.cloudbuild_bootstrap.cloudbuild_project_id
  role    = "roles/source.reader"
  member  = "serviceAccount:${module.seed_bootstrap.terraform_sa_email}"

  depends_on = [
    module.cloudbuild_bootstrap.csr_repos
  ]
}

data "google_project" "cloudbuild" {
  project_id = module.cloudbuild_bootstrap.cloudbuild_project_id

  depends_on = [
    module.cloudbuild_bootstrap.csr_repos
  ]
}

resource "google_organization_iam_member" "org_cb_sa_browser" {
  count  = var.parent_folder == "" ? 1 : 0
  org_id = var.org_id
  role   = "roles/browser"
  member = "serviceAccount:${data.google_project.cloudbuild.number}@cloudbuild.gserviceaccount.com"
}

resource "google_organization_iam_member" "org_cb_sa_gke" {
  count  = var.parent_folder == "" ? 1 : 0
  org_id = var.org_id
  role   = "roles/container.clusterAdmin"
  member = "serviceAccount:${data.google_project.cloudbuild.number}@cloudbuild.gserviceaccount.com"
}

resource "google_organization_iam_member" "org_cb_sa_gke2" {
  count  = var.parent_folder == "" ? 1 : 0
  org_id = var.org_id
  role   = "roles/container.admin"
  member = "serviceAccount:${data.google_project.cloudbuild.number}@cloudbuild.gserviceaccount.com"
}


resource "google_folder_iam_member" "folder_cb_sa_browser" {
  count  = var.parent_folder != "" ? 1 : 0
  folder = var.parent_folder
  role   = "roles/browser"
  member = "serviceAccount:${data.google_project.cloudbuild.number}@cloudbuild.gserviceaccount.com"
}

resource "google_organization_iam_member" "org_tf_compute_security_policy_admin" {
  count  = var.parent_folder == "" ? 1 : 0
  org_id = var.org_id
  role   = "roles/compute.orgSecurityPolicyAdmin"
  member = "serviceAccount:${module.seed_bootstrap.terraform_sa_email}"
}

resource "google_folder_iam_member" "folder_tf_compute_security_policy_admin" {
  count  = var.parent_folder != "" ? 1 : 0
  folder = var.parent_folder
  role   = "roles/compute.orgSecurityPolicyAdmin"
  member = "serviceAccount:${module.seed_bootstrap.terraform_sa_email}"
}

resource "google_organization_iam_member" "org_tf_compute_security_resource_admin" {
  count  = var.parent_folder == "" ? 1 : 0
  org_id = var.org_id
  role   = "roles/compute.orgSecurityResourceAdmin"
  member = "serviceAccount:${module.seed_bootstrap.terraform_sa_email}"
}

resource "google_folder_iam_member" "folder_tf_compute_security_resource_admin" {
  count  = var.parent_folder != "" ? 1 : 0
  folder = var.parent_folder
  role   = "roles/compute.orgSecurityResourceAdmin"
  member = "serviceAccount:${module.seed_bootstrap.terraform_sa_email}"
}

# runner service account project level permissions
resource "google_project_iam_member" "rnr_sa_prj_perms" {
  for_each = toset(var.sa_prj_rnr_iam_permissions)

  project = module.cloudbuild_bootstrap.cloudbuild_project_id
  role    = each.value
  member  = "serviceAccount:${module.cloudbuild_bootstrap.project_service_account}"
}

# cloudbuild service account project level permissions
resource "google_project_iam_member" "cb_sa_prj_perms" {
  for_each = toset(var.sa_prj_cb_iam_permissions)

  project = module.cloudbuild_bootstrap.cloudbuild_project_id
  role    = each.value
  member  = "serviceAccount:${data.google_project.cloudbuild.number}@cloudbuild.gserviceaccount.com"
}

# cloudbuild service account org level permissions
resource "google_organization_iam_member" "cb_sa_org_perms" {
  for_each = toset(var.sa_org_cb_iam_permissions)

  org_id = var.org_id
  role   = each.value
  member = "serviceAccount:${data.google_project.cloudbuild.number}@cloudbuild.gserviceaccount.com"
}

# group org admins perms org level
resource "google_organization_iam_member" "grp_org_admin_perms" {
  org_id = var.org_id
  member = "group:${var.cto_audit_compliance_operations_group}"
  role   = "roles/iam.securityReviewer"
}

# state bucket permissions for cloudbuild sa
resource "google_storage_bucket_iam_member" "state_bucket_cb_sa_perms" {
  for_each = toset(local.state_bucket_cb_sa_perms)

  bucket = module.seed_bootstrap.gcs_bucket_tfstate
  role   = each.value
  member = "serviceAccount:${data.google_project.cloudbuild.number}@cloudbuild.gserviceaccount.com"
}

# state bucket permissions for project runner sa
resource "google_storage_bucket_iam_member" "state_bucket_prj_sa_perms" {
  for_each = toset(local.state_bucket_prj_sa_perms)

  bucket = module.seed_bootstrap.gcs_bucket_tfstate
  role   = each.value
  member = "serviceAccount:${module.cloudbuild_bootstrap.project_service_account}"
}

# state bucket permissions for org-terraform sa
resource "google_storage_bucket_iam_member" "state_bucket_orgtf_sa_perms" {
  bucket = module.seed_bootstrap.gcs_bucket_tfstate
  role   = "roles/storage.admin"
  member = "serviceAccount:${module.seed_bootstrap.terraform_sa_email}"
}


resource "google_storage_bucket_iam_member" "cb_bucket_cb_sa_perms" {
  for_each = toset(local.cb_bucket_cb_sa_perms)

  bucket = "${module.cloudbuild_bootstrap.cloudbuild_project_id}_cloudbuild"
  role   = each.value
  member = "serviceAccount:${data.google_project.cloudbuild.number}@cloudbuild.gserviceaccount.com"
}
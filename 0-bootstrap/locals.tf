locals {
  parent = var.parent_folder != "" ? "folders/${var.parent_folder}" : "organizations/${var.org_id}"
  org_admins_org_iam_permissions = var.org_policy_admin_role == true ? [
    "roles/orgpolicy.policyAdmin",
    "roles/resourcemanager.organizationAdmin",
    "roles/billing.user"
    ] : [
    "roles/resourcemanager.organizationAdmin",
    "roles/billing.user"
  ]

  state_bucket_cb_sa_perms = [
    "roles/storage.objectAdmin",
    "roles/storage.legacyBucketReader"
  ]

  state_bucket_prj_sa_perms = [
    "roles/storage.objectAdmin",
    "roles/storage.legacyBucketReader"
  ]

  cb_bucket_cb_sa_perms = [
    "roles/storage.objectViewer"
  ]
}
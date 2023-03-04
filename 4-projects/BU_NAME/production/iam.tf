


#shared vpc project
resource "google_project_iam_member" "shared_vpc_operations" {
  count   = local.cto_operations_group != null ? 1 : 0
  project = module.base_shared_vpc_project.project_id
  role    = "roles/viewer"
  member  = "group:${local.cto_operations_group}"
}

resource "google_project_iam_member" "shared_vpc_build" {
  count   = local.bu_app_deploy_group != null ? 1 : 0
  project = module.base_shared_vpc_project.project_id
  role    = "roles/editor"
  member  = "group:${local.bu_app_deploy_group}"
}

#peering project
resource "google_project_iam_member" "peering_project_operations" {
  count   = local.cto_operations_group != null ? 1 : 0
  project = module.peering_project.project_id
  role    = "roles/viewer"
  member  = "group:${local.cto_operations_group}"
}

resource "google_project_iam_member" "peering_project_build" {
  count   = local.bu_app_deploy_group != null ? 1 : 0
  project = module.peering_project.project_id
  role    = "roles/editor"
  member  = "group:${local.bu_app_deploy_group}"
}

#floating project
resource "google_project_iam_member" "floating_project_operations" {
  count   = local.cto_operations_group != null ? 1 : 0
  project = module.floating_project.project_id
  role    = "roles/viewer"
  member  = "group:${local.cto_operations_group}"
}

resource "google_project_iam_member" "floating_project_build" {
  count   = local.bu_app_deploy_group != null ? 1 : 0
  project = module.floating_project.project_id
  role    = "roles/editor"
  member  = "group:${local.bu_app_deploy_group}"
}

#secrets project
resource "google_project_iam_member" "secrets_project_operations" {
  count   = local.cto_operations_group != null ? 1 : 0
  project = module.env_secrets_project.project_id
  role    = "roles/viewer"
  member  = "group:${local.cto_operations_group}"
}

resource "google_project_iam_member" "secrets_project_build" {
  count   = local.bu_app_deploy_group != null ? 1 : 0
  project = module.env_secrets_project.project_id
  role    = "roles/editor"
  member  = "group:${local.bu_app_deploy_group}"
}

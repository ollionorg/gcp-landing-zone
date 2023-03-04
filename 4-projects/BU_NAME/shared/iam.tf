


resource "google_project_iam_member" "build_group_editor_role" {
  count   = local.cto_build_group != null ? 1 : 0
  project = module.app_infra_cloudbuild_project.project_id
  role    = "roles/editor"
  member  = "group:${local.cto_build_group}"
}

resource "google_project_iam_member" "security_build_group" {
  count   = local.cto_security_build_group != null ? 1 : 0
  project = module.app_infra_cloudbuild_project.project_id
  role    = "roles/securitycenter.adminEditor"
  member  = "group:${local.cto_security_build_group}"
}

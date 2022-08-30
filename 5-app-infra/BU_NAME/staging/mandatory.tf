locals {
  project_id = {
    for i, key in data.google_projects.my_org_projects.projects.*.project_id :
    i => "${data.google_projects.my_org_projects.projects[i].project_id}" if "${data.google_projects.my_org_projects.projects[i].project_id}" != "${data.google_projects.monitoring_project.projects[0].project_id}"
  }
}

data "google_projects" "my_org_projects" {
  filter = "parent.type:folder parent.id:${replace(data.google_active_folder.env.name, "folders/", "")} labels.env_code:${local.env_code}"
}

data "google_projects" "monitoring_project" {
  filter = "parent.type:folder parent.id:${replace(data.google_active_folder.env.name, "folders/", "")} labels.application_name : ${basename(path.cwd)}-monitoring"
}

resource "google_monitoring_monitored_project" "primary" {
  for_each      = local.project_id
  metrics_scope = data.google_projects.monitoring_project.projects[0].project_id
  name          = local.project_id[each.key]
  provider      = google-beta
}
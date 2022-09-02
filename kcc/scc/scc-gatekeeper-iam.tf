#Creation of SA for security center
resource "google_service_account" "scc_admin" {
  depends_on   = [google_project_service.enable_scc_api]
  account_id   = var.scc_name
  display_name = var.scc_desciption
  project      = local.cicd_project
}

resource "google_organization_iam_binding" "sources_binding" {
  depends_on = [google_service_account.scc_admin]
  members    = ["serviceAccount:${google_service_account.scc_admin.email}", ]
  org_id     = local.org_id
  role       = var.scc_email_role
}

resource "google_organization_iam_binding" "source_scc_sa_binding" {
  depends_on = [google_service_account.scc_admin, google_organization_iam_binding.sources_binding]
  members    = ["serviceAccount:${google_service_account.scc_admin.email}", ]
  org_id     = local.org_id
  role       = var.findings_sa_role
}

resource "google_service_account_iam_binding" "scc" {
  depends_on         = [google_service_account.scc_admin, google_organization_iam_binding.sources_binding, google_organization_iam_binding.source_scc_sa_binding]
  service_account_id = google_service_account.scc_admin.name
  role               = "roles/iam.serviceAccountTokenCreator"

  members = [
    "serviceAccount:${data.google_project.cloudbuild.number}@cloudbuild.gserviceaccount.com",
  ]
}

#Enabling SCC api in CICD project
resource "google_project_service" "enable_scc_api" {
  project            = local.cicd_project
  service            = "securitycenter.googleapis.com"
  disable_on_destroy = false
}

##Creation of SCC Source
resource "null_resource" "sources_creation" {
  depends_on = [google_service_account.scc_admin, google_organization_iam_binding.sources_binding, google_organization_iam_binding.source_scc_sa_binding, google_service_account_iam_binding.scc, google_service_account.findings_sa_admin, google_organization_iam_binding.findings_sa_binding, google_service_account_iam_binding.findings_iam_binding]
  #depends_on=[google_project_service.enable_scc_api,google_service_account_iam_binding.scc,google_organization_iam_binding.sources_binding,google_service_account.scc_admin]

  provisioner "local-exec" {

    command     = <<EOT
    "./scc-gatekeeper.sh"
  EOT
    interpreter = ["bash", "-c"]
    working_dir = path.cwd
    environment = {
      ORGANIZATION_ID    = local.org_id
      SCC_SOURCE_NAME    = var.scc_name
      FINDINGS_EDITOR_SA = google_service_account.findings_sa_admin.email
      SOURCES_ADMIN_SA   = google_service_account.scc_admin.email
    }
  }
}

resource "google_service_account" "findings_sa_admin" {
  depends_on   = [google_service_account.scc_admin, google_organization_iam_binding.sources_binding, google_organization_iam_binding.source_scc_sa_binding, google_service_account_iam_binding.scc]
  account_id   = var.findings_sa_name //gatekeeper-securitycenter
  display_name = var.findings_sa_description
  project      = local.cicd_project
}

#Creating Findings
resource "google_organization_iam_binding" "findings_sa_binding" {
  depends_on = [google_service_account.scc_admin, google_organization_iam_binding.sources_binding, google_organization_iam_binding.source_scc_sa_binding, google_service_account_iam_binding.scc, google_service_account.findings_sa_admin]
  members    = ["serviceAccount:${google_service_account.findings_sa_admin.email}", "serviceAccount:${google_service_account.scc_admin.email}", ]
  org_id     = local.org_id
  role       = var.findings_sa_role
}

resource "google_service_account_iam_binding" "findings_iam_binding" {
  depends_on         = [google_service_account.scc_admin, google_organization_iam_binding.sources_binding, google_organization_iam_binding.source_scc_sa_binding, google_service_account_iam_binding.scc, google_service_account.findings_sa_admin, google_organization_iam_binding.findings_sa_binding]
  service_account_id = google_service_account.findings_sa_admin.name
  role               = "roles/iam.serviceAccountTokenCreator"

  members = [
    "serviceAccount:${data.google_project.cloudbuild.number}@cloudbuild.gserviceaccount.com",
  ]
}
#Create a Workload Identity IAM policy binding to allow the gatekeeper-securitycenter-controllerKubernetes service account in the gatekeeper-securitycenternamespace to impersonate the findings editor Google service account
resource "google_service_account_iam_binding" "kube_findings_iam_binding" {
  service_account_id = google_service_account.findings_sa_admin.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${local.cicd_project}.svc.id.goog[gatekeeper-securitycenter/gatekeeper-securitycenter-controller]",
  ]
}

#Creating gatekeeper kubernetes controller for syncing the findings on regular basis

resource "null_resource" "scc_controller" {
  depends_on = [null_resource.sources_creation]
  provisioner "local-exec" {

    command     = <<EOT
    "./scc-controller.sh"
  EOT
    interpreter = ["bash", "-c"]
    working_dir = path.cwd
    environment = {
      ORGANIZATION_ID    = local.org_id
      SCC_SOURCE_NAME    = var.scc_name
      PROJECT_ID         = local.cicd_project
      FINDINGS_EDITOR_SA = google_service_account.findings_sa_admin.email
    }
  }
}

data "google_project" "cloudbuild" {
  project_id = local.cicd_project
}
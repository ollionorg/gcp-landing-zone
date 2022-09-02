output "cicd_project" {
  value = local.cicd_project
}
output "scc_admin_email" {
  value = google_service_account.scc_admin.email
}

output "findings_sa_admin_emil" {
  value = google_service_account.findings_sa_admin.email
}
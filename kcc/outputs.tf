output "cicd_project" {
  value = local.cicd_project
}

output "cluster_name" {
  value = module.gke.name
}
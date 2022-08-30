# https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest/submodules/workload-identity

resource "null_resource" "kubectl_config" {

  provisioner "local-exec" {
    command = "echo > /tmp/config; export KUBECONFIG=\"/tmp/config\" ; gcloud container clusters get-credentials \"${local.gcp_region}-boa-gke-cluster-001\" --project=\"${local.base_shared_vpc_project}\" --region=\"${local.gcp_region}\""
  }
  depends_on = [google_container_cluster.gke]
}

resource "null_resource" "kubectl_config2" {

  provisioner "local-exec" {
    command = "echo > /tmp/config2; export KUBECONFIG=\"/tmp/config2\" ; gcloud container clusters get-credentials \"${local.default_region2}-boa-gke-cluster-001\" --project=\"${local.base_shared_vpc_project}\" --region=\"${local.default_region2}\""
  }
  depends_on = [google_container_cluster.gke2]
}


module "wif" {
  source = "../../../modules/workload-identity"
  project_id = local.base_shared_vpc_project
  name       = "boa-wif"
  namespace  = "default"
  roles = ["roles/cloudsql.client", "roles/monitoring.metricWriter", "roles/cloudtrace.agent", "roles/gkehub.connect"]


  depends_on = [google_container_cluster.gke, google_container_cluster.gke2, null_resource.kubectl_config, null_resource.kubectl_config2]
}

module "wif2" {
  source = "../../../modules/workload-identity"
  project_id = local.base_shared_vpc_project
  use_existing_gcp_sa = true
  name       = "boa-wif"
  namespace  = "default"
  roles = ["roles/cloudsql.client", "roles/monitoring.metricWriter", "roles/cloudtrace.agent", "roles/gkehub.connect"]
  providers = {kubernetes = kubernetes.west}

  depends_on = [google_container_cluster.gke, google_container_cluster.gke2, null_resource.kubectl_config, null_resource.kubectl_config2, module.wif]
}
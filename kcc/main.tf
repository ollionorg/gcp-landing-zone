#Enable the project apis for the relevant resources
resource "google_project_service" "cc_services" {
  for_each = toset(local.cc_services)
  service = each.value
  project = local.cicd_project
}

#Create subnet under the gh-runner-network
resource "google_compute_subnetwork" "cc_subnetwork" {
  ip_cidr_range = var.cc_subnet_cidr
  name          = var.cc_subnet_name
  network       = local.runner_network_name
  region        = var.cc_location
  project       = local.cicd_project

    log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_router" "cc_router" {
  name    = "${google_compute_subnetwork.cc_subnetwork.name}-router"
  region  = var.cc_location
  network = local.runner_network_name
  project = local.cicd_project
}

resource "google_compute_router_nat" "cc_nat" {
  project = local.cicd_project
  name                               = "${google_compute_subnetwork.cc_subnetwork.name}-nat"
  router                             = google_compute_router.cc_router.name
  region                             = google_compute_router.cc_router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }

}

module "gke" {
  source = "../modules/beta-private-cluster"
  project_id                 = local.cicd_project
  name                       = "${var.cc_name}-cluster"
  region                     = var.cc_location
  network                    = local.runner_network_name
  subnetwork                 = google_compute_subnetwork.cc_subnetwork.name
  ip_range_pods              = ""
  ip_range_services          = ""
  config_connector = true
  enable_private_nodes = true
  remove_default_node_pool = true

  node_pools = [
    {
      name                      = "default-node-pool"
      machine_type              = "e2-medium"
      node_count                = 2
      service_account           = "project-service-account@${local.cicd_project}.iam.gserviceaccount.com"
      autoscaling               = false
    },

  ]

  node_pools_oauth_scopes = {
    all = []

    default-node-pool = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

}

module "wi" {
  source              = "../modules/workload-identity"
  gcp_sa_name         = "cnrmsa"
  cluster_name        = module.gke.name
  name                = "cnrm-controller-manager"
  location            = var.cc_location
  use_existing_k8s_sa = true
  annotate_k8s_sa     = false
  namespace           = "cnrm-system"
  project_id          = local.cicd_project
  roles               = ["roles/owner"]
}


resource "google_organization_iam_binding" "workload_identity_org_sa_bindings" {
  members = ["serviceAccount:cnrmsa@${local.cicd_project}.iam.gserviceaccount.com", ]
  org_id  = local.org_id
  role    = var.sa_email_role
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

#resource "kubernetes_manifest" "connector_config" {
#  manifest = yamldecode(templatefile("connector.tfpl",
#    {
#      sa = "cnrmsa@${local.cicd_project}.iam.gserviceaccount.com"
#    }
#  ))
#
#  depends_on = [
#    module.gke
#  ]
#}

resource "google_gke_hub_membership" "membership" {
  provider      = google-beta
  project = local.cicd_project
  membership_id = "membership-hub-${module.gke.name}"
  endpoint {
    gke_cluster {
      resource_link = "//container.googleapis.com/${module.gke.cluster_id}"
    }
  }
}

resource "google_gke_hub_feature" "configmanagement_acm_feature" {
  provider = google-beta
  project = local.cicd_project
  name     = "configmanagement"
  location = "global"
}

resource "google_gke_hub_feature_membership" "feature_member" {
  provider = google-beta
  project = local.cicd_project
  location   = "global"
  feature    = "configmanagement"
  membership = google_gke_hub_membership.membership.membership_id
  configmanagement {

    config_sync {
      source_format = "unstructured"
      git {
        sync_repo   = var.sync_repo
        sync_branch = var.sync_branch
        policy_dir  = var.policy_dir
        secret_type = "token"
      }
    }
    policy_controller {
      enabled                    = true
      template_library_installed = true
      referential_rules_enabled  = true
    }
  }
  depends_on = [
    google_gke_hub_feature.configmanagement_acm_feature
  ]
}


#####

#module "acm" {
#  source           = "../modules/terraform-google-kubernetes-engine/modules/acm"
#  project_id       = local.cicd_project
#  cluster_name     = var.cc_name
#  location         = module.gke.location
#  sync_repo        = "git@github.com:GoogleCloudPlatform/csp-config-management.git"
#  sync_branch      = "1.0.0"
#  policy_dir       = "foo-corp"
#}
/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */



data "google_active_folder" "env" {
  display_name = "${local.folder_prefix}-${basename(path.cwd)}"
  parent       = var.parent_folder != "" ? "folders/${var.parent_folder}" : "organizations/${local.org_id}"
}

resource "google_project_service" "sql_service_1" {
  service = "servicenetworking.googleapis.com"
  project = local.base_shared_vpc_project
}

resource "google_project_service" "sql_service_2" {
  service = "sqladmin.googleapis.com"
  project = local.base_shared_vpc_project
}

resource "google_project_service" "cloudtrace_api" {
  service = "cloudtrace.googleapis.com"
  project = local.base_shared_vpc_project
}

resource "google_project_service" "containerapi" {
  service =  "container.googleapis.com"
  project = local.base_shared_vpc_project
}

resource "google_service_account" "compute_engine_service_account" {
  project      = local.base_shared_vpc_project
  account_id   = "sa-example-app"
  display_name = "Example app service Account"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork_iam
resource "google_compute_subnetwork_iam_binding" "binding" {
  project    = local.base_host_project_id
  region     = local.gcp_region
  subnetwork = local.base_shared_subnet_name

  role = "roles/compute.networkUser"
  members = [
    "serviceAccount:${google_service_account.compute_engine_service_account.email}",
    "serviceAccount:${local.base_shared_vpc_project_number}@cloudservices.gserviceaccount.com",
    "serviceAccount:service-${local.base_shared_vpc_project_number}@container-engine-robot.iam.gserviceaccount.com"
  ]
  depends_on = [google_project_service.containerapi]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork_iam
resource "google_compute_subnetwork_iam_binding" "binding2" {
  project    = local.base_host_project_id
  region     = local.default_region2
  subnetwork = local.base_shared_subnet_name2

  role = "roles/compute.networkUser"
  members = [
    "serviceAccount:${google_service_account.compute_engine_service_account.email}",
    "serviceAccount:${local.base_shared_vpc_project_number}@cloudservices.gserviceaccount.com",
    "serviceAccount:service-${local.base_shared_vpc_project_number}@container-engine-robot.iam.gserviceaccount.com"
  ]
  depends_on = [google_project_service.containerapi]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
resource "google_project_iam_binding" "container-engine" {
  project = local.base_host_project_id
  role    = "roles/container.hostServiceAgentUser"

  members = [
    "serviceAccount:service-${local.base_shared_vpc_project_number}@container-engine-robot.iam.gserviceaccount.com",
  ]
  depends_on = [google_project_service.containerapi]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster

## REGION1 cluster

resource "google_container_cluster" "gke" {
  name     = "${local.gcp_region}-boa-gke-cluster-001"
  location = local.gcp_region
  project  = local.base_shared_vpc_project

  default_max_pods_per_node = 20

  networking_mode = "VPC_NATIVE"
  network         = local.base_shared_network_self_link
  subnetwork      = local.base_shared_subnet_self_link

  remove_default_node_pool = true
  initial_node_count       = 1

  release_channel {
    channel = "REGULAR"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = local.base_shared_subnet_secondary_range_pod
    services_secondary_range_name = local.base_shared_subnet_secondary_range_svc
  }

  network_policy {
    provider = "PROVIDER_UNSPECIFIED"
    enabled  = true
  }

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block = "172.16.0.0/28"
  }

  workload_identity_config {
    workload_pool = "${local.base_shared_vpc_project}.svc.id.goog"
  }

  depends_on = [google_project_service.containerapi, google_project_iam_binding.container-engine, google_compute_subnetwork_iam_binding.binding]
}



#### Container cluster node pool 1

resource "google_container_node_pool" "general" {
  name       = "general-boa-cluster"
  location   = local.gcp_region
  cluster    = google_container_cluster.gke.name
  project    = local.base_shared_vpc_project
  node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    labels = {
      role = "general"
    }
    machine_type = "e2-standard-4"

    service_account = google_service_account.compute_engine_service_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  depends_on = [google_project_service.containerapi, google_project_iam_binding.container-engine, google_compute_subnetwork_iam_binding.binding]
}




##REGION2 Cluster

resource "google_container_cluster" "gke2" {
  name     = "${local.default_region2}-boa-gke-cluster-001"
  location = local.default_region2
  project  = local.base_shared_vpc_project

  default_max_pods_per_node = 20

  networking_mode = "VPC_NATIVE"
  network         = local.base_shared_network_self_link
  subnetwork      = local.base_shared_subnet_self_link2

  remove_default_node_pool = true
  initial_node_count       = 1

  release_channel {
    channel = "REGULAR"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = local.base_shared_subnet_secondary_range_pod2
    services_secondary_range_name = local.base_shared_subnet_secondary_range_svc2
  }

  network_policy {
    provider = "PROVIDER_UNSPECIFIED"
    enabled  = true
  }

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block = "172.16.0.16/28"
  }

  workload_identity_config {
    workload_pool = "${local.base_shared_vpc_project}.svc.id.goog"
  }

  depends_on = [google_project_service.containerapi, google_project_iam_binding.container-engine, google_compute_subnetwork_iam_binding.binding]
}




#### Container cluster node pool 2

resource "google_container_node_pool" "general2" {
  name       = "${local.default_region2}general-boa-cluster"
  location   = local.default_region2
  cluster    = google_container_cluster.gke2.name
  project    = local.base_shared_vpc_project
  node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    labels = {
      role = "general"
    }
    machine_type = "e2-standard-4"

    service_account = google_service_account.compute_engine_service_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  depends_on = [google_project_service.containerapi, google_project_iam_binding.container-engine, google_compute_subnetwork_iam_binding.binding]
}

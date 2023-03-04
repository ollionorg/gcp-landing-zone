
#interconnect projects add as service projects to base shared vpc

resource "google_compute_shared_vpc_service_project" "trust-interconnect" {
  count           = local.enable_interconnect_projects ? 1 : 0
  host_project    = local.base_net_hub_project_id
  service_project = local.interconnect_trust_project_id
}

resource "google_compute_shared_vpc_service_project" "notrust-interconnect" {
  count           = local.enable_interconnect_projects ? 1 : 0
  host_project    = local.base_net_hub_project_id
  service_project = local.interconnect_no_trust_project_id
}


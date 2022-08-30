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

data "google_active_folder" "bootstrap" {
  display_name = "${local.folder_prefix}-${local.bootstrap_folder}"
  parent       = local.parent_id
}

data "google_active_folder" "development" {
  display_name = "${local.folder_prefix}-${local.development_folder}"
  parent       = local.parent_id
}

data "google_active_folder" "staging" {
  display_name = "${local.folder_prefix}-${local.staging_folder}"
  parent       = local.parent_id
}

data "google_active_folder" "production" {
  display_name = "${local.folder_prefix}-${local.production_folder}"
  parent       = local.parent_id
}

/******************************************
  DNS Hub Project
*****************************************/

data "google_projects" "dns_hub" {
  filter = "parent.id:${split("/", data.google_active_folder.common.name)[1]} labels.application_name=org-dns-hub lifecycleState=ACTIVE"
}


/******************************************
  DNS Hub VPC
*****************************************/

module "dns_hub_vpc" {
  source                                 = "../../../modules/terraform-google-network"
  project_id                             = local.dns_hub_project_id
  network_name                           = "${local.vpc_prefix}-${local.shared_environment_code}-dns-hub"
  shared_vpc_host                        = var.shared_vpc_host_project
  delete_default_internet_gateway_routes = var.delete_default_internet_gateway_routes

  subnets = [{
    subnet_name           = "sb-${local.shared_environment_code}-dns-hub-${local.default_region1}"
    subnet_ip             = local.subnet_ip_cidr_range_region1
    subnet_region         = local.default_region1
    subnet_private_access = var.subnet_private_access
    subnet_flow_logs      = var.subnetworks_enable_logging
    description           = "DNS hub subnet for region 1."
    }, {
    subnet_name           = "sb-${local.shared_environment_code}-dns-hub-${local.default_region2}"
    subnet_ip             = local.subnet_ip_cidr_range_region2
    subnet_region         = local.default_region2
    subnet_private_access = var.subnet_private_access
    subnet_flow_logs      = var.subnetworks_enable_logging
    description           = "DNS hub subnet for region 2."
  }]

  routes = [{
    name              = "rt-${local.shared_environment_code}-dns-hub-1000-all-default-private-api"
    description       = "Route through IGW to allow private google api access."
    destination_range = var.destination_range
    next_hop_internet = var.next_hop_internet
    priority          = "1000"
  }]
}

/******************************************
  Default DNS Policy
 *****************************************/

resource "google_dns_policy" "default_policy" {
  project                   = local.dns_hub_project_id
  name                      = "dp-dns-hub-default-policy"
  enable_inbound_forwarding = var.enable_inbound_forwarding
  enable_logging            = var.dns_enable_logging
  networks {
    network_url = module.dns_hub_vpc.network_self_link
  }
}

/******************************************
 DNS Forwarding
*****************************************/

module "dns-forwarding-zone" {
  source = "../../../modules/terraform-google-cloud-dns"

  project_id = local.dns_hub_project_id
  type       = "forwarding"
  name       = "fz-dns-hub"
  domain     = local.domain

  private_visibility_config_networks = [
    module.dns_hub_vpc.network_self_link
  ]
  target_name_server_addresses = local.target_name_server_addresses
}

/*********************************************************
  Routers to advertise DNS proxy range "35.199.192.0/19"
*********************************************************/

module "dns_hub_region1_router1" {
  source  = "../../../modules/terraform-google-cloud-router"
  name    = "cr-${local.shared_environment_code}-dns-hub-${local.default_region1}-cr1"
  project = local.dns_hub_project_id
  network = module.dns_hub_vpc.network_name
  region  = local.default_region1
  bgp = {
    asn                  = var.bgp_asn_dns
    advertised_ip_ranges = [{ range = var.advertised_ip_ranges }]
  }
}

module "dns_hub_region1_router2" {
  source  = "../../../modules/terraform-google-cloud-router"
  name    = "cr-${local.shared_environment_code}-dns-hub-${local.default_region1}-cr2"
  project = local.dns_hub_project_id
  network = module.dns_hub_vpc.network_name
  region  = local.default_region1
  bgp = {
    asn                  = var.bgp_asn_dns
    advertised_ip_ranges = [{ range = var.advertised_ip_ranges }]
  }
}

module "dns_hub_region2_router1" {
  source  = "../../../modules/terraform-google-cloud-router"
  name    = "cr-${local.shared_environment_code}-dns-hub-${local.default_region2}-cr3"
  project = local.dns_hub_project_id
  network = module.dns_hub_vpc.network_name
  region  = local.default_region2
  bgp = {
    asn                  = var.bgp_asn_dns
    advertised_ip_ranges = [{ range = var.advertised_ip_ranges }]
  }
}

module "dns_hub_region2_router2" {
  source  = "../../../modules/terraform-google-cloud-router"
  name    = "cr-${local.shared_environment_code}-dns-hub-${local.default_region2}-cr4"
  project = local.dns_hub_project_id
  network = module.dns_hub_vpc.network_name
  region  = local.default_region2
  bgp = {
    asn                  = var.bgp_asn_dns
    advertised_ip_ranges = [{ range = var.advertised_ip_ranges }]
  }
}

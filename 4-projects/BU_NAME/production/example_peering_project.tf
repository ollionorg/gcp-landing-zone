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

locals {
  shared_vpc_mode = local.enable_hub_and_spoke ? "-spoke" : ""
}

data "google_projects" "projects" {
  filter = "parent.id:${split("/", data.google_active_folder.env.name)[1]} labels.application_name=base-shared-vpc-host labels.environment=${basename(path.cwd)} lifecycleState=ACTIVE"
}

data "google_compute_network" "shared_vpc" {
  name    = "${local.vpc_prefix}-${local.prod_env_code}-shared-base${local.shared_vpc_mode}"
  project = data.google_projects.projects.projects[0].project_id
}

data "google_netblock_ip_ranges" "legacy_health_checkers" {
  range_type = "legacy-health-checkers"
}

data "google_netblock_ip_ranges" "health_checkers" {
  range_type = "health-checkers"
}

data "google_netblock_ip_ranges" "iap_forwarders" {
  range_type = "iap-forwarders"
}

module "peering_project" {
  source                      = "../../../modules/single_project"
  impersonate_service_account = local.terraform_service_account
  org_id                      = local.org_id
  billing_account             = local.billing_account
  folder_id                   = data.google_active_folder.env.name
  environment                 = basename(path.cwd)
  stage                       = var.stage_name
  bu                          = var.bu_name
  project_prefix              = local.project_prefix

  # Metadata
  project_suffix    = "${var.bu_code}-${var.peer_suffix}"
  application_name  = "${var.bu_code}-${local.prod_env_code}-${var.app}"
  billing_code      = var.billing_code
  primary_contact   = local.primary_contact
  secondary_contact = local.secondary_contact
  business_code     = var.bu_code
  custom_labels     = local.custom_labels
}

module "peering_network" {
  source                                 = "../../../modules/terraform-google-network"
  project_id                             = module.peering_project.project_id
  network_name                           = "${local.vpc_prefix}-${local.prod_env_code}-${var.peer_base}"
  shared_vpc_host                        = "false"
  delete_default_internet_gateway_routes = "true"
  subnets                                = []
}

module "peering" {
  source            = "../../../modules/network-peering"
  prefix            = "${var.bu_code}-${local.prod_env_code}"
  local_network     = module.peering_network.network_self_link
  peer_network      = data.google_compute_network.shared_vpc.self_link
  module_depends_on = var.peering_module_depends_on
}

/******************************************
  Mandatory firewall rules
 *****************************************/

resource "google_compute_firewall" "deny_all_egress" {
  name      = "${var.peer_fw_name}-${local.prod_env_code}-${var.peer_base}-65535-e-${local.prod_env_code}-all-all-tcp-udp"
  network   = module.peering_network.network_name
  project   = module.peering_project.project_id
  direction = "EGRESS"
  priority  = 65535

  dynamic "log_config" {
    for_each = var.firewall_enable_logging == true ? [{
      metadata = "INCLUDE_ALL_METADATA"
    }] : []

    content {
      metadata = log_config.value.metadata
    }
  }

  deny {
    protocol = "tcp"
  }

  deny {
    protocol = "udp"
  }

  destination_ranges = ["0.0.0.0/0"]
}


resource "google_compute_firewall" "allow_private_api_egress" {
  name      = "${var.peer_fw_name}-${local.prod_env_code}-${var.peer_base}-65534-e-a-allow-google-apis-all-tcp-443"
  network   = module.peering_network.network_name
  project   = module.peering_project.project_id
  direction = "EGRESS"
  priority  = 65534

  dynamic "log_config" {
    for_each = var.firewall_enable_logging == true ? [{
      metadata = "INCLUDE_ALL_METADATA"
    }] : []

    content {
      metadata = log_config.value.metadata
    }
  }

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  destination_ranges = ["199.36.153.8/30"]

  target_tags = ["allow-google-apis"]
}


/******************************************
  Optional firewall rules
 *****************************************/

// Allow SSH via IAP when using the allow-iap-ssh tag for Linux workloads.
resource "google_compute_firewall" "allow_iap_ssh" {
  count   = var.optional_fw_rules_enabled ? 1 : 0
  name    = "${var.peer_fw_name}-${local.prod_env_code}-${var.peer_base}-1000-i-a-all-allow-iap-ssh-tcp-22"
  network = module.peering_network.network_name
  project = module.peering_project.project_id

  dynamic "log_config" {
    for_each = var.firewall_enable_logging == true ? [{
      metadata = "INCLUDE_ALL_METADATA"
    }] : []

    content {
      metadata = log_config.value.metadata
    }
  }

  // Cloud IAP's TCP forwarding netblock
  source_ranges = concat(data.google_netblock_ip_ranges.iap_forwarders.cidr_blocks_ipv4)

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags = ["allow-iap-ssh"]
}

// Allow RDP via IAP when using the allow-iap-rdp tag for Windows workloads.
resource "google_compute_firewall" "allow_iap_rdp" {
  count   = var.optional_fw_rules_enabled ? 1 : 0
  name    = "${var.peer_fw_name}-${local.prod_env_code}-${var.peer_base}-1000-i-a-all-allow-iap-rdp-tcp-3389"
  network = module.peering_network.network_name
  project = module.peering_project.project_id

  dynamic "log_config" {
    for_each = var.firewall_enable_logging == true ? [{
      metadata = "INCLUDE_ALL_METADATA"
    }] : []

    content {
      metadata = log_config.value.metadata
    }
  }

  // Cloud IAP's TCP forwarding netblock
  source_ranges = concat(data.google_netblock_ip_ranges.iap_forwarders.cidr_blocks_ipv4)

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  target_tags = ["allow-iap-rdp"]
}

// Allow access to kms.windows.googlecloud.com for Windows license activation
resource "google_compute_firewall" "allow_windows_activation" {
  count     = var.windows_activation_enabled ? 1 : 0
  name      = "${var.peer_fw_name}-${local.prod_env_code}-${var.peer_base}-0-e-a-allow-win-activation-all-tcp-1688"
  network   = module.peering_network.network_name
  project   = module.peering_project.project_id
  direction = "EGRESS"
  priority  = 0

  dynamic "log_config" {
    for_each = var.firewall_enable_logging == true ? [{
      metadata = "INCLUDE_ALL_METADATA"
    }] : []

    content {
      metadata = log_config.value.metadata
    }
  }

  allow {
    protocol = "tcp"
    ports    = ["1688"]
  }

  destination_ranges = ["35.190.247.13/32"]

  target_tags = ["allow-win-activation"]
}

// Allow traffic for Internal & Global load balancing health check and load balancing IP ranges.
resource "google_compute_firewall" "allow_lb" {
  count   = var.optional_fw_rules_enabled ? 1 : 0
  name    = "${var.peer_fw_name}-${local.prod_env_code}-${var.peer_base}-1000-i-a-all-allow-lb-tcp-80-8080-443"
  network = module.peering_network.network_name
  project = module.peering_project.project_id

  dynamic "log_config" {
    for_each = var.firewall_enable_logging == true ? [{
      metadata = "INCLUDE_ALL_METADATA"
    }] : []

    content {
      metadata = log_config.value.metadata
    }
  }

  source_ranges = concat(data.google_netblock_ip_ranges.health_checkers.cidr_blocks_ipv4, data.google_netblock_ip_ranges.legacy_health_checkers.cidr_blocks_ipv4)

  // Allow common app ports by default.
  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "443"]
  }

  target_tags = ["allow-lb"]
}

##enable dns policy on Peering vpc
resource "google_dns_policy" "default_policy" {
  project                   = module.peering_project.project_id
  name                      = "dp-peering-policy"
  enable_inbound_forwarding = "true"
  enable_logging            =  "true"
  networks {
    network_url = module.peering_network.network_self_link
  }
}
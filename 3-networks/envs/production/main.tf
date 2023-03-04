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
  display_name = "${local.folder_prefix}-${local.env}"
  parent       = local.parent_id
}

/******************************************
  VPC Host Projects
*****************************************/

data "google_projects" "restricted_host_project" {
  count = local.enable_restricted_network ? 1 : 0
  filter = "parent.id:${split("/", data.google_active_folder.env.name)[1]} labels.application_name=restricted-shared-vpc-host labels.environment=${local.env} lifecycleState=ACTIVE"
}

data "google_project" "restricted_host_project" {
  count = local.enable_restricted_network ? 1 : 0
  project_id = data.google_projects.restricted_host_project[0].projects[0].project_id
}

data "google_projects" "base_host_project" {
  filter = "parent.id:${split("/", data.google_active_folder.env.name)[1]} labels.application_name=base-shared-vpc-host labels.environment=${local.env} lifecycleState=ACTIVE"
}

/******************************************
 Restricted shared VPC
*****************************************/
module "restricted_shared_vpc" {
  source                           = "../../../modules/restricted_shared_vpc"
  count                            = local.enable_restricted_network ? 1 : 0
  project_id                       = local.restricted_project_id
  project_number                   = local.restricted_project_number
  environment_code                 = local.environment_code
  access_context_manager_policy_id = local.access_context_manager_policy_id
  restricted_services              = ["bigquery.googleapis.com", "storage.googleapis.com"]
  members                          = ["serviceAccount:${local.terraform_service_account}"]
  private_service_cidr             = local.restricted_private_service_cidr
  org_id                           = local.org_id
  parent_folder                    = local.parent_folder
  bgp_asn_subnet                   = local.bgp_asn_number
  default_region1                  = local.gcp_region
  default_region2                  = local.default_region2
  domain                           = local.domain
  windows_activation_enabled       = var.windows_activation_enabled
  dns_enable_inbound_forwarding    = var.dns_enable_inbound_forwarding
  dns_enable_logging               = var.dns_enable_logging
  firewall_enable_logging          = var.firewall_enable_logging
  optional_fw_rules_enabled        = var.optional_fw_rules_enabled
  nat_enabled                      = var.nat_enabled
  nat_bgp_asn                      = var.nat_bgp_asn
  nat_num_addresses_region1        = var.nat_num_addresses_region1
  nat_num_addresses_region2        = var.nat_num_addresses_region2
  folder_prefix                    = local.folder_prefix
  mode                             = local.mode

  subnets = [
    {
      subnet_name           = "sb-${local.environment_code}-shared-restricted-${local.gcp_region}"
      subnet_ip             = local.restricted_subnet_primary_ranges[local.gcp_region]
      subnet_region         = local.gcp_region
      subnet_private_access = "true"
      subnet_flow_logs      = var.subnetworks_enable_logging
      description           = "First ${local.env} subnet example."
    },
    {
      subnet_name           = "sb-${local.environment_code}-shared-restricted-${local.default_region2}"
      subnet_ip             = local.restricted_subnet_primary_ranges[local.default_region2]
      subnet_region         = local.default_region2
      subnet_private_access = "true"
      subnet_flow_logs      = var.subnetworks_enable_logging
      description           = "Second ${local.env} subnet example."
    }
  ]
  secondary_ranges = {
    "sb-${local.environment_code}-shared-restricted-${local.gcp_region}" = local.restricted_subnet_secondary_ranges[local.gcp_region]
  }
  allow_all_ingress_ranges = local.enable_transitivity ? local.restricted_hub_subnet_ranges : null
  allow_all_egress_ranges  = local.enable_transitivity ? local.restricted_subnet_aggregates : null
}

/******************************************
 Base shared VPC
*****************************************/

module "base_shared_vpc" {
  source                        = "../../../modules/base_shared_vpc"
  project_id                    = local.base_project_id
  environment_code              = local.environment_code
  private_service_cidr          = local.base_private_service_cidr
  org_id                        = local.org_id
  parent_folder                 = local.parent_folder
  default_region1               = local.gcp_region
  default_region2               = local.default_region2
  domain                        = local.domain
  bgp_asn_subnet                = local.bgp_asn_number
  windows_activation_enabled    = var.windows_activation_enabled
  dns_enable_inbound_forwarding = var.dns_enable_inbound_forwarding
  dns_enable_logging            = var.dns_enable_logging
  firewall_enable_logging       = var.firewall_enable_logging
  optional_fw_rules_enabled     = var.optional_fw_rules_enabled
  nat_enabled                   = var.nat_enabled
  nat_bgp_asn                   = var.nat_bgp_asn
  nat_num_addresses_region1     = var.nat_num_addresses_region1
  nat_num_addresses_region2     = var.nat_num_addresses_region2
  nat_num_addresses             = var.nat_num_addresses
  folder_prefix                 = local.folder_prefix
  mode                          = local.mode

  subnets = [
    {
      subnet_name           = "sb-${local.environment_code}-shared-base-${local.gcp_region}"
      subnet_ip             = local.base_subnet_primary_ranges[local.gcp_region]
      subnet_region         = local.gcp_region
      subnet_private_access = "true"
      subnet_flow_logs      = var.subnetworks_enable_logging
      description           = "First ${local.env} subnet example."
    },
    {
      subnet_name           = "sb-${local.environment_code}-shared-base-${local.default_region2}"
      subnet_ip             = local.base_subnet_primary_ranges[local.default_region2]
      subnet_region         = local.default_region2
      subnet_private_access = "true"
      subnet_flow_logs      = var.subnetworks_enable_logging
      description           = "Second ${local.env} subnet example."
    }
  ]
  secondary_ranges = {
    "sb-${local.environment_code}-shared-base-${local.gcp_region}" = local.base_subnet_secondary_ranges[local.gcp_region]
  }
  allow_all_ingress_ranges = local.enable_transitivity ? local.base_hub_subnet_ranges : null
  allow_all_egress_ranges  = local.enable_transitivity ? local.base_subnet_aggregates : null
}

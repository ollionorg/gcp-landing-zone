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

module "dns_hub_interconnect" {
  source                                  = "../../../modules/dedicated_interconnect"
  count                                   = local.d_enable_dedicated_interconnect && local.enable_interconnect_projects ? 1 : 0
  interconnect_project_id                 = local.interconnect_trust_project_id
  org_id                                  = local.org_id
  parent_folder                           = local.parent_folder
  vpc_name                                = module.base_shared_vpc[0].network_name
  region1                                 = local.default_region1
  region1_router1_name                    = module.dns_hub_region1_router1.router.name
  region1_interconnect1_candidate_subnets = local.d_region1_interconnect1_candidate_subnets
  region1_interconnect1_vlan_tag8021q     = local.d_region1_interconnect1_vlan_tag8021q
  region1_interconnect1                   = local.d_region1_interconnect1_self_link
  region1_interconnect1_location          = local.d_region1_interconnect1_location
  region1_router2_name                    = module.dns_hub_region1_router2.router.name
  region1_interconnect2_candidate_subnets = local.d_region1_interconnect2_candidate_subnets
  region1_interconnect2_vlan_tag8021q     = local.d_region1_interconnect2_vlan_tag8021q
  region1_interconnect2                   = local.d_region1_interconnect2_self_link
  region1_interconnect2_location          = local.d_region1_interconnect2_location

  region2                                 = local.default_region2
  region2_router1_name                    = module.dns_hub_region2_router1.router.name
  region2_interconnect1_candidate_subnets = local.d_region2_interconnect1_candidate_subnets
  region2_interconnect1_vlan_tag8021q     = local.d_region2_interconnect1_vlan_tag8021q
  region2_interconnect1                   = local.d_region2_interconnect1_self_link
  region2_interconnect1_location          = local.d_region2_interconnect1_location
  region2_router2_name                    = module.dns_hub_region2_router2.router.name
  region2_interconnect2_candidate_subnets = local.d_region2_interconnect2_candidate_subnets
  region2_interconnect2_vlan_tag8021q     = local.d_region2_interconnect2_vlan_tag8021q
  region2_interconnect2                   = local.d_region2_interconnect2_self_link
  region2_interconnect2_location          = local.d_region2_interconnect2_location

  peer_asn  = local.d_peer_asn
  peer_name = "d-${local.vpc_prefix}-interconnect-peer"

  cloud_router_labels = local.d_cloud_router_labels
  depends_on          = [module.base_shared_vpc]
}




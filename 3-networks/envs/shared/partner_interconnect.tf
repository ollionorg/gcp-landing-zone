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

module "shared_restricted_interconnect" {
  source                         = "../../../modules/partner_interconnect"
  count                          = local.restricted_enable_partner_interconnect && local.enable_restricted_network ? 1 : 0
  org_id                         = local.org_id
  parent_folder                  = var.parent_folder // need to add output from env
  vpc_name                       = "${local.environment_code}-shared-restricted"
  environment                    = local.env
  enable_hub_and_spoke           = local.enable_hub_and_spoke
  vpc_type                       = "restricted"
  preactivate                    = local.p_r_preactivate_partner_interconnect
  region1                        = local.default_region
  region1_router1_name           = module.restricted_shared_vpc[0].region1_router1.router.name
  region1_interconnect1_location = local.p_r_region1_interconnect1_location
  region1_router2_name           = module.restricted_shared_vpc[0].region1_router2.router.name
  region1_interconnect2_location = local.p_r_region1_interconnect2_location
  region2                        = local.default_region2
  region2_router1_name           = module.restricted_shared_vpc[0].region2_router1.router.name
  region2_interconnect1_location = local.p_r_region2_interconnect1_location
  region2_router2_name           = module.restricted_shared_vpc[0].region2_router2.router.name
  region2_interconnect2_location = local.p_r_region2_interconnect2_location
  folder_prefix                  = local.folder_prefix
  cloud_router_labels            = local.p_r_cloud_router_labels
}

module "shared_base_interconnect" {
  source                         = "../../../modules/partner_interconnect"
  count                          = local.shared_enable_partner_interconnect ? 1 : 0
  org_id                         = data.terraform_remote_state.bootstrap.outputs.org_id
  parent_folder                  = var.parent_folder // need to add output from env
  vpc_name                       = "${local.environment_code}-shared-base"
  environment                    = local.env
  enable_hub_and_spoke           = local.enable_hub_and_spoke
  vpc_type                       = "base"
  preactivate                    = local.p_s_preactivate_partner_interconnect
  region1                        = local.default_region
  region1_router1_name           = module.base_shared_vpc[0].region1_router1.router.name
  region1_interconnect1_location = local.p_s_region1_interconnect1_location
  region1_router2_name           = module.base_shared_vpc[0].region1_router2.router.name
  region1_interconnect2_location = local.p_s_region1_interconnect2_location
  region2                        = local.default_region2
  region2_router1_name           = module.base_shared_vpc[0].region2_router1.router.name
  region2_interconnect1_location = local.p_s_region2_interconnect1_location
  region2_router2_name           = module.base_shared_vpc[0].region2_router2.router.name
  region2_interconnect2_location = local.p_s_region2_interconnect2_location
  folder_prefix                  = local.folder_prefix
  cloud_router_labels            = local.p_s_cloud_router_labels
}
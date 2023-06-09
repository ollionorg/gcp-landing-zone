locals {
  //dns-hub
  enable_interconnect_projects     = false //data.terraform_remote_state.bootstrap.outputs.enable_interconnect_projects
  enable_restricted_network        = data.terraform_remote_state.bootstrap.outputs.enable_restricted_network
  dns_hub_project_id               = data.google_projects.dns_hub.projects[0].project_id
  interconnect_trust_project_id    = try(data.terraform_remote_state.org.outputs.trust_interconnect_project_id, null)
  interconnect_no_trust_project_id = try(data.terraform_remote_state.org.outputs.notrust_interconnect_project_id, null)
  subnet_ip_cidr_range_region1     = data.terraform_remote_state.bootstrap.outputs.subnet_ip_cidr_range_region1 //The range of internal addresses that are owned by this subnetwork. Only IPv4 is supported.
  subnet_ip_cidr_range_region2     = data.terraform_remote_state.bootstrap.outputs.subnet_ip_cidr_range_region2 //The range of internal addresses that are owned by this subnetwork. Only IPv4 is supported.
  //hierarchical firewall
  ingress_ranges   = data.terraform_remote_state.bootstrap.outputs.ingress_ranges_firewall // Source IP address range in CIDR format. Required for INGRESS rules.
  egress_ranges    = data.terraform_remote_state.bootstrap.outputs.egress_ranges_firewall  // Destination IP address range in CIDR format. Required for EGRESS rules  If you have strong IAM requirements for these monitoring workspaces, it is worth considering creating these at a more granular level, such as per business unit or per application.
  parent_folder    = data.terraform_remote_state.bootstrap.outputs.parent_folder
  parent_id        = local.parent_folder != "" ? "folders/${local.parent_folder}" : "organizations/${data.terraform_remote_state.bootstrap.outputs.org_id}"
  env              = "common"
  environment_code = data.terraform_remote_state.bootstrap.outputs.shared_environment_code
  bgp_asn_number   = var.enable_partner_interconnect ? "16550" : "64514"
  folder_prefix    = data.terraform_remote_state.bootstrap.outputs.folder_prefix
  //net hubs
  base_net_hub_project_id           = try(data.google_projects.base_net_hub[0].projects[0].project_id, null)
  restricted_net_hub_project_id     = try(data.google_projects.restricted_net_hub[0].projects[0].project_id, null)
  restricted_net_hub_project_number = try(data.google_projects.restricted_net_hub[0].projects[0].number, null)
  /*
   * Base network ranges
   */
  base_subnet_primary_ranges = {
    (data.terraform_remote_state.bootstrap.outputs.gcp_region)      = data.terraform_remote_state.bootstrap.outputs.base_vpc_firewall_ingress_src_ranges[0]
    (data.terraform_remote_state.bootstrap.outputs.default_region2) = data.terraform_remote_state.bootstrap.outputs.base_vpc_firewall_ingress_src_ranges[1]
  }
  /*
   * Restricted network ranges
   */
  restricted_subnet_primary_ranges = {
    (data.terraform_remote_state.bootstrap.outputs.gcp_region)      = data.terraform_remote_state.bootstrap.outputs.rest_vpc_firewall_ingress_src_ranges[0]
    (data.terraform_remote_state.bootstrap.outputs.default_region2) = data.terraform_remote_state.bootstrap.outputs.rest_vpc_firewall_ingress_src_ranges[1]
  }
  enable_hub_and_spoke             = data.terraform_remote_state.bootstrap.outputs.enable_hub_and_spoke
  default_region1                  = data.terraform_remote_state.bootstrap.outputs.gcp_region
  default_region2                  = data.terraform_remote_state.bootstrap.outputs.default_region2
  domain                           = data.terraform_remote_state.bootstrap.outputs.domain
  org_id                           = data.terraform_remote_state.bootstrap.outputs.org_id
  shared_environment_code          = data.terraform_remote_state.bootstrap.outputs.shared_environment_code
  terraform_service_account        = data.terraform_remote_state.bootstrap.outputs.terraform_service_account
  access_context_manager_policy_id = data.terraform_remote_state.org.outputs.access_context_manager_policy_id
  bootstrap_folder                 = data.terraform_remote_state.bootstrap.outputs.bootstrap_folder
  development_folder               = data.terraform_remote_state.bootstrap.outputs.development_folder
  staging_folder                   = data.terraform_remote_state.bootstrap.outputs.staging_folder
  production_folder                = data.terraform_remote_state.bootstrap.outputs.production_folder
  vpc_prefix                       = data.terraform_remote_state.bootstrap.outputs.vpc_prefix
  target_name_server_addresses     = data.terraform_remote_state.bootstrap.outputs.target_name_server_addresses
  interconnect-firewall            = local.enable_interconnect_projects ? data.terraform_remote_state.bootstrap.outputs.interconnect-firewall : false
  // Dedicated Interconnect Configuration.
  d_enable_dedicated_interconnect           = data.terraform_remote_state.bootstrap.outputs.d_enable_dedicated_interconnect
  d_region1_interconnect1_candidate_subnets = data.terraform_remote_state.bootstrap.outputs.d_region1_interconnect1_candidate_subnets
  d_region1_interconnect1_vlan_tag8021q     = data.terraform_remote_state.bootstrap.outputs.d_region1_interconnect1_vlan_tag8021q
  d_region1_interconnect1_self_link         = data.terraform_remote_state.bootstrap.outputs.d_region1_interconnect1_self_link
  d_region1_interconnect1_location          = data.terraform_remote_state.bootstrap.outputs.d_region1_interconnect1_location
  d_region1_interconnect2_candidate_subnets = data.terraform_remote_state.bootstrap.outputs.d_region1_interconnect2_candidate_subnets
  d_region1_interconnect2_vlan_tag8021q     = data.terraform_remote_state.bootstrap.outputs.d_region1_interconnect2_vlan_tag8021q
  d_region1_interconnect2_self_link         = data.terraform_remote_state.bootstrap.outputs.d_region1_interconnect2_self_link
  d_region1_interconnect2_location          = data.terraform_remote_state.bootstrap.outputs.d_region1_interconnect2_location
  d_region2_interconnect1_candidate_subnets = data.terraform_remote_state.bootstrap.outputs.d_region2_interconnect1_candidate_subnets
  d_region2_interconnect1_vlan_tag8021q     = data.terraform_remote_state.bootstrap.outputs.d_region2_interconnect1_vlan_tag8021q
  d_region2_interconnect1_self_link         = data.terraform_remote_state.bootstrap.outputs.d_region2_interconnect1_self_link
  d_region2_interconnect1_location          = data.terraform_remote_state.bootstrap.outputs.d_region2_interconnect1_location
  d_region2_interconnect2_candidate_subnets = data.terraform_remote_state.bootstrap.outputs.d_region2_interconnect2_candidate_subnets
  d_region2_interconnect2_vlan_tag8021q     = data.terraform_remote_state.bootstrap.outputs.d_region2_interconnect2_vlan_tag8021q
  d_region2_interconnect2_self_link         = data.terraform_remote_state.bootstrap.outputs.d_region2_interconnect2_self_link
  d_region2_interconnect2_location          = data.terraform_remote_state.bootstrap.outputs.d_region2_interconnect2_location
  d_cloud_router_labels                     = data.terraform_remote_state.bootstrap.outputs.d_cloud_router_labels
  d_peer_asn                                = data.terraform_remote_state.bootstrap.outputs.d_peer_asn
  //  restricted Partner Interconnect Configuration.
  restricted_enable_partner_interconnect = local.enable_interconnect_projects ? data.terraform_remote_state.bootstrap.outputs.restricted_enable_partner_interconnect : false
  p_r_region1_interconnect1_location     = data.terraform_remote_state.bootstrap.outputs.p_r_region1_interconnect1_location
  p_r_region1_interconnect2_location     = data.terraform_remote_state.bootstrap.outputs.p_r_region1_interconnect2_location
  p_r_region2_interconnect1_location     = data.terraform_remote_state.bootstrap.outputs.p_r_region2_interconnect1_location
  p_r_region2_interconnect2_location     = data.terraform_remote_state.bootstrap.outputs.p_r_region2_interconnect2_location
  p_r_cloud_router_labels                = data.terraform_remote_state.bootstrap.outputs.p_r_cloud_router_labels
  p_r_preactivate_partner_interconnect   = data.terraform_remote_state.bootstrap.outputs.p_r_preactivate_partner_interconnect
  //  shared Partner Interconnect Configuration.
  shared_enable_partner_interconnect   = local.enable_interconnect_projects ? data.terraform_remote_state.bootstrap.outputs.shared_enable_partner_interconnect : false
  p_s_region1_interconnect1_location   = data.terraform_remote_state.bootstrap.outputs.p_s_region1_interconnect1_location
  p_s_region1_interconnect2_location   = data.terraform_remote_state.bootstrap.outputs.p_s_region1_interconnect2_location
  p_s_region2_interconnect1_location   = data.terraform_remote_state.bootstrap.outputs.p_s_region2_interconnect1_location
  p_s_region2_interconnect2_location   = data.terraform_remote_state.bootstrap.outputs.p_s_region2_interconnect2_location
  p_s_cloud_router_labels              = data.terraform_remote_state.bootstrap.outputs.p_s_cloud_router_labels
  p_s_preactivate_partner_interconnect = data.terraform_remote_state.bootstrap.outputs.p_s_preactivate_partner_interconnect
  //net hubs transitivity
  enable_transitivity = data.terraform_remote_state.bootstrap.outputs.enable_hub_and_spoke && data.terraform_remote_state.bootstrap.outputs.enable_hub_and_spoke_transitivity
  base_regional_aggregates = {
    (data.terraform_remote_state.bootstrap.outputs.gcp_region) = [
      data.terraform_remote_state.bootstrap.outputs.base_vpc_firewall_egress_dest_ranges[0],
      data.terraform_remote_state.bootstrap.outputs.base_vpc_firewall_egress_dest_ranges[2]
    ]
    (data.terraform_remote_state.bootstrap.outputs.default_region2) = [
      data.terraform_remote_state.bootstrap.outputs.base_vpc_firewall_egress_dest_ranges[1],
      data.terraform_remote_state.bootstrap.outputs.base_vpc_firewall_egress_dest_ranges[3]
    ]
  }
  restricted_regional_aggregates = {
    (data.terraform_remote_state.bootstrap.outputs.gcp_region) = [
      data.terraform_remote_state.bootstrap.outputs.rest_vpc_firewall_egress_dest_ranges[0],
      data.terraform_remote_state.bootstrap.outputs.rest_vpc_firewall_egress_dest_ranges[2]
    ]
    (data.terraform_remote_state.bootstrap.outputs.default_region2) = [
      data.terraform_remote_state.bootstrap.outputs.rest_vpc_firewall_egress_dest_ranges[1],
      data.terraform_remote_state.bootstrap.outputs.rest_vpc_firewall_egress_dest_ranges[3]
    ]
  }
}
locals {
  //dns-hub
  dns_hub_project_id           = data.google_projects.dns_hub.projects[0].project_id
  subnet_ip_cidr_range_region1 = data.terraform_remote_state.bootstrap.outputs.subnet_ip_cidr_range_region1 //The range of internal addresses that are owned by this subnetwork. Only IPv4 is supported.
  subnet_ip_cidr_range_region2 = data.terraform_remote_state.bootstrap.outputs.subnet_ip_cidr_range_region2 //The range of internal addresses that are owned by this subnetwork. Only IPv4 is supported.
  //hierarchical firewall
  ingress_ranges = data.terraform_remote_state.bootstrap.outputs.ingress_ranges_firewall // Source IP address range in CIDR format. Required for INGRESS rules.
  egress_ranges  = data.terraform_remote_state.bootstrap.outputs.egress_ranges_firewall  // Destination IP address range in CIDR format. Required for EGRESS rules.

  parent_id        = var.parent_folder != "" ? "folders/${var.parent_folder}" : "organizations/${data.terraform_remote_state.bootstrap.outputs.org_id}"
  env              = "common"
  environment_code = data.terraform_remote_state.bootstrap.outputs.shared_environment_code
  bgp_asn_number   = var.enable_partner_interconnect ? "16550" : "64514"

  folder_prefix = data.terraform_remote_state.bootstrap.outputs.folder_prefix
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
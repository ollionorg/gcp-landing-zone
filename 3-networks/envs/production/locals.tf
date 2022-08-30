locals {
  environment_code                 = data.terraform_remote_state.bootstrap.outputs.prod_environment_code
  env                              = basename(path.cwd)
  restricted_project_id            = data.google_projects.restricted_host_project.projects[0].project_id
  restricted_project_number        = data.google_project.restricted_host_project.number
  base_project_id                  = data.google_projects.base_host_project.projects[0].project_id
  parent_id                        = var.parent_folder != "" ? "folders/${var.parent_folder}" : "organizations/${data.terraform_remote_state.bootstrap.outputs.org_id}"
  mode                             = data.terraform_remote_state.bootstrap.outputs.enable_hub_and_spoke ? "spoke" : null
  bgp_asn_number                   = var.enable_partner_interconnect ? "16550" : "64514"
  enable_transitivity              = data.terraform_remote_state.bootstrap.outputs.enable_hub_and_spoke && data.terraform_remote_state.bootstrap.outputs.enable_hub_and_spoke_transitivity
  folder_prefix                    = data.terraform_remote_state.bootstrap.outputs.folder_prefix
  terraform_service_account        = data.terraform_remote_state.bootstrap.outputs.terraform_service_account
  gcp_region                       = data.terraform_remote_state.bootstrap.outputs.gcp_region
  default_region2                  = data.terraform_remote_state.bootstrap.outputs.default_region2
  org_id                           = data.terraform_remote_state.bootstrap.outputs.org_id
  domain                           = data.terraform_remote_state.bootstrap.outputs.domain
  access_context_manager_policy_id = data.terraform_remote_state.org.outputs.access_context_manager_policy_id
  /*
   * Base network ranges
   */
  base_subnet_aggregates    = data.terraform_remote_state.bootstrap.outputs.base_vpc_firewall_egress_dest_ranges
  base_hub_subnet_ranges    = data.terraform_remote_state.bootstrap.outputs.base_vpc_firewall_ingress_src_ranges
  base_private_service_cidr = data.terraform_remote_state.bootstrap.outputs.base_vpc_global_address_private[local.environment_code]
  base_subnet_primary_ranges = {
    (data.terraform_remote_state.bootstrap.outputs.gcp_region)      = data.terraform_remote_state.bootstrap.outputs.base_vpc_private_subnet_default_region[local.environment_code]
    (data.terraform_remote_state.bootstrap.outputs.default_region2) = data.terraform_remote_state.bootstrap.outputs.base_vpc_private_subnet_default_region2[local.environment_code]
  }
  base_subnet_secondary_ranges = {
    (data.terraform_remote_state.bootstrap.outputs.gcp_region) = [
      {
        range_name    = "rn-${local.environment_code}-shared-base-${data.terraform_remote_state.bootstrap.outputs.gcp_region}-gke-pod"
        ip_cidr_range = data.terraform_remote_state.bootstrap.outputs.base_vpc_subnet_secondary_ip_range_gke_pod[local.environment_code][0]
      },
      {
        range_name    = "rn-${local.environment_code}-shared-base-${data.terraform_remote_state.bootstrap.outputs.gcp_region}-gke-svc"
        ip_cidr_range = data.terraform_remote_state.bootstrap.outputs.base_vpc_subnet_secondary_ip_range_gke_svc[local.environment_code][0]
      }
    ]
    (data.terraform_remote_state.bootstrap.outputs.default_region2) = [
       {
        range_name    = "rn-${local.environment_code}-shared-base-${data.terraform_remote_state.bootstrap.outputs.default_region2}-gke-pod"
        ip_cidr_range = data.terraform_remote_state.bootstrap.outputs.base_vpc_subnet_secondary_ip_range_gke_pod[local.environment_code][1]
      },
      {
        range_name    = "rn-${local.environment_code}-shared-base-${data.terraform_remote_state.bootstrap.outputs.default_region2}-gke-svc"
        ip_cidr_range = data.terraform_remote_state.bootstrap.outputs.base_vpc_subnet_secondary_ip_range_gke_svc[local.environment_code][1]
      }

    ]
  }
  /*
   * Restricted network ranges
   */
  restricted_subnet_aggregates    = data.terraform_remote_state.bootstrap.outputs.rest_vpc_firewall_egress_dest_ranges
  restricted_hub_subnet_ranges    = data.terraform_remote_state.bootstrap.outputs.rest_vpc_firewall_ingress_src_ranges
  restricted_private_service_cidr = data.terraform_remote_state.bootstrap.outputs.rest_vpc_global_address_private[local.environment_code]
  restricted_subnet_primary_ranges = {
    (data.terraform_remote_state.bootstrap.outputs.gcp_region)      = data.terraform_remote_state.bootstrap.outputs.rest_vpc_private_subnet_default_region[local.environment_code]
    (data.terraform_remote_state.bootstrap.outputs.default_region2) = data.terraform_remote_state.bootstrap.outputs.rest_vpc_private_subnet_default_region2[local.environment_code]
  }
  restricted_subnet_secondary_ranges = {
    (data.terraform_remote_state.bootstrap.outputs.gcp_region) = [
      {
        range_name    = "rn-${local.environment_code}-shared-restricted-${data.terraform_remote_state.bootstrap.outputs.gcp_region}-gke-pod"
        ip_cidr_range = data.terraform_remote_state.bootstrap.outputs.rest_vpc_subnet_secondary_ip_range_gke_pod[local.environment_code]
      },
      {
        range_name    = "rn-${local.environment_code}-shared-restricted-${data.terraform_remote_state.bootstrap.outputs.gcp_region}-gke-svc"
        ip_cidr_range = data.terraform_remote_state.bootstrap.outputs.rest_vpc_subnet_secondary_ip_range_gke_svc[local.environment_code]
      }
    ]
  }
}
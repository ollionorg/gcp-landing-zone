locals {
  //base shared vpc
  terraform_service_account = data.terraform_remote_state.bootstrap.outputs.terraform_service_account
  org_id                    = data.terraform_remote_state.bootstrap.outputs.org_id
  billing_account           = data.terraform_remote_state.bootstrap.outputs.billing_account
  project_prefix            = data.terraform_remote_state.bootstrap.outputs.project_prefix
  enable_hub_and_spoke      = data.terraform_remote_state.bootstrap.outputs.enable_hub_and_spoke
  cloudbuild_sa             = data.terraform_remote_state.BU_NAME_shared.outputs.cloudbuild_sa
  primary_contact           = data.terraform_remote_state.bootstrap.outputs.primary_contact
  secondary_contact         = data.terraform_remote_state.bootstrap.outputs.secondary_contact
  folder_prefix             = data.terraform_remote_state.bootstrap.outputs.folder_prefix
  env_code                  = data.terraform_remote_state.bootstrap.outputs.dev_environment_code
  access_context_policy_id  = data.terraform_remote_state.org.outputs.access_context_manager_policy_id
  restricted_perimeter_name = data.terraform_remote_state.networks.outputs.restricted_service_perimeter_name
  vpc_prefix                = data.terraform_remote_state.bootstrap.outputs.vpc_prefix
  gcp_region                = data.terraform_remote_state.bootstrap.outputs.gcp_region
  project_service_account   = data.terraform_remote_state.BU_NAME_production.outputs.base_shared_vpc_project_sa
  base_shared_network_name  = data.terraform_remote_state.networks.outputs.base_network_name
  base_shared_subnet_name   = data.terraform_remote_state.networks.outputs.base_subnets_names[0]
  base_shared_subnet_name2  = data.terraform_remote_state.networks.outputs.base_subnets_names[1]
  base_shared_network_self_link = data.terraform_remote_state.networks.outputs.base_network_self_link
  base_shared_subnet_self_link = data.terraform_remote_state.networks.outputs.base_subnets_self_links[0]
  base_shared_subnet_self_link2 = data.terraform_remote_state.networks.outputs.base_subnets_self_links[1]
  base_host_project_id      = data.terraform_remote_state.networks.outputs.base_host_project_id
  base_shared_vpc_project   = data.terraform_remote_state.BU_NAME_production.outputs.base_shared_vpc_project
  base_shared_vpc_project_number = data.terraform_remote_state.BU_NAME_production.outputs.base_shared_vpc_project_number
  base_shared_subnet_secondary_range_pod = data.terraform_remote_state.networks.outputs.base_subnets_secondary_ranges[0][0].range_name
  base_shared_subnet_secondary_range_svc = data.terraform_remote_state.networks.outputs.base_subnets_secondary_ranges[0][1].range_name
  base_shared_subnet_secondary_range_pod2 = data.terraform_remote_state.networks.outputs.base_subnets_secondary_ranges[1][0].range_name
  base_shared_subnet_secondary_range_svc2 = data.terraform_remote_state.networks.outputs.base_subnets_secondary_ranges[1][1].range_name
  boa_databases   = ["accounts-db", "ledger-db"]
  default_region2     = data.terraform_remote_state.bootstrap.outputs.default_region2

}

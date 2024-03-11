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
  prod_env_code             = data.terraform_remote_state.bootstrap.outputs.prod_environment_code
  access_context_policy_id  = data.terraform_remote_state.org.outputs.access_context_manager_policy_id
  enable_restricted_network = try(data.terraform_remote_state.bootstrap.outputs.enable_restricted_network, null)
  parent_folder             = data.terraform_remote_state.bootstrap.outputs.parent_folder
  restricted_perimeter_name = data.terraform_remote_state.networks.outputs.restricted_service_perimeter_name
  vpc_prefix                = data.terraform_remote_state.bootstrap.outputs.vpc_prefix
  stage_name                = data.terraform_remote_state.bootstrap.outputs.production_folder
  custom_labels             = data.terraform_remote_state.bootstrap.outputs.custom_labels
  cto_security_build_group  = data.terraform_remote_state.bootstrap.outputs.cto_security_build_group
  cto_build_group           = data.terraform_remote_state.bootstrap.outputs.cto_build_group
  cto_operations_group      = data.terraform_remote_state.bootstrap.outputs.cto_operations_group
}

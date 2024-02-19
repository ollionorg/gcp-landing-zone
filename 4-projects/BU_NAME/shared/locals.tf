locals {
  terraform_service_account = data.terraform_remote_state.bootstrap.outputs.terraform_service_account
  org_id                    = data.terraform_remote_state.bootstrap.outputs.org_id
  billing_account           = data.terraform_remote_state.bootstrap.outputs.billing_account
  project_prefix            = data.terraform_remote_state.bootstrap.outputs.project_prefix
  primary_contact           = data.terraform_remote_state.bootstrap.outputs.primary_contact
  secondary_contact         = data.terraform_remote_state.bootstrap.outputs.secondary_contact
  default_region            = data.terraform_remote_state.bootstrap.outputs.gcp_region
  folder_prefix             = data.terraform_remote_state.bootstrap.outputs.folder_prefix
  parent_folder             = data.terraform_remote_state.bootstrap.outputs.parent_folder
  cto_security_build_group  = data.terraform_remote_state.bootstrap.outputs.cto_security_build_group
  cto_build_group           = data.terraform_remote_state.bootstrap.outputs.cto_build_group
}
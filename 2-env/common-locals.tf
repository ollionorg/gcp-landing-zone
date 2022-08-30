locals {
  org_id                     = data.terraform_remote_state.bootstrap.outputs.org_id
  billing_account            = data.terraform_remote_state.bootstrap.outputs.billing_account
  terraform_service_account  = data.terraform_remote_state.bootstrap.outputs.terraform_service_account
  monitoring_workspace_users = data.terraform_remote_state.bootstrap.outputs.monitoring_workspace_users
  project_prefix             = data.terraform_remote_state.bootstrap.outputs.project_prefix
  folder_prefix              = data.terraform_remote_state.bootstrap.outputs.folder_prefix
}
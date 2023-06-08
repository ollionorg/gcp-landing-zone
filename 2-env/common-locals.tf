locals {
  parent_folder                          = data.terraform_remote_state.bootstrap.outputs.parent_folder
  org_id                                 = data.terraform_remote_state.bootstrap.outputs.org_id
  billing_account                        = data.terraform_remote_state.bootstrap.outputs.billing_account
  terraform_service_account              = data.terraform_remote_state.bootstrap.outputs.terraform_service_account
  monitoring_workspace_users             = data.terraform_remote_state.bootstrap.outputs.monitoring_workspace_users
  project_prefix                         = data.terraform_remote_state.bootstrap.outputs.project_prefix
  folder_prefix                          = data.terraform_remote_state.bootstrap.outputs.folder_prefix
  enable_env_log_sink                    = data.terraform_remote_state.bootstrap.outputs.enable_env_log_sink
  enable_restricted_network              = data.terraform_remote_state.bootstrap.outputs.enable_restricted_network
  cto_elevated_security_operations_group = data.terraform_remote_state.bootstrap.outputs.cto_elevated_security_operations_group
  cto_operations_group                   = data.terraform_remote_state.bootstrap.outputs.cto_operations_group
  cto_core_networking_operations_group   = data.terraform_remote_state.bootstrap.outputs.cto_core_networking_operations_group
}
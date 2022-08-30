locals {
  environment_code  = data.terraform_remote_state.bootstrap.outputs.staging_environment_code
  primary_contact   = data.terraform_remote_state.bootstrap.outputs.primary_contact
  secondary_contact = data.terraform_remote_state.bootstrap.outputs.secondary_contact
  vpc_prefix        = data.terraform_remote_state.bootstrap.outputs.vpc_prefix
  custom_labels     = data.terraform_remote_state.bootstrap.outputs.custom_labels
}
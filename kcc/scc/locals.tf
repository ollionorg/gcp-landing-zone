locals {
  terraform_service_account = data.terraform_remote_state.bootstrap.outputs.terraform_service_account
  org_id                    = data.terraform_remote_state.bootstrap.outputs.org_id
  billing_account           = data.terraform_remote_state.bootstrap.outputs.billing_account
  project_prefix            = data.terraform_remote_state.bootstrap.outputs.project_prefix
  primary_contact           = data.terraform_remote_state.bootstrap.outputs.primary_contact
  secondary_contact         = data.terraform_remote_state.bootstrap.outputs.secondary_contact
  default_region            = data.terraform_remote_state.bootstrap.outputs.gcp_region
  secondary_region          = data.terraform_remote_state.bootstrap.outputs.default_region2
  folder_prefix             = data.terraform_remote_state.bootstrap.outputs.folder_prefix
  cicd_project              = data.terraform_remote_state.bootstrap.outputs.cloudbuild_project_id
  runner_network_name       = data.terraform_remote_state.bootstrap.outputs.runner_network_name
  ##check above value should not be self link and should be a network name
  #runner_network_name       = "gh-runner-network"

  cc_services = ["anthos.googleapis.com", "krmapihosting.googleapis.com", "container.googleapis.com", "cloudresourcemanager.googleapis.com", "cloudasset.googleapis.com"]
}
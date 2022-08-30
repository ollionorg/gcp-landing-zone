locals {
  // folders
  parent             = var.parent_folder != "" ? "folders/${var.parent_folder}" : "organizations/${data.terraform_remote_state.bootstrap.outputs.org_id}"
  folder_prefix      = data.terraform_remote_state.bootstrap.outputs.folder_prefix
  shared_env         = data.terraform_remote_state.bootstrap.outputs.shared_env
  org_id             = data.terraform_remote_state.bootstrap.outputs.org_id
  audit_data_users   = data.terraform_remote_state.bootstrap.outputs.audit_data_users
  billing_data_users = data.terraform_remote_state.bootstrap.outputs.billing_data_users
  // log sinks
  parent_resource_id      = var.parent_folder != "" ? var.parent_folder : data.terraform_remote_state.bootstrap.outputs.org_id
  parent_resource_type    = var.parent_folder != "" ? "folder" : "organization"
  main_logs_filter        = <<EOF
    logName: /logs/cloudaudit.googleapis.com%2Factivity OR
    logName: /logs/cloudaudit.googleapis.com%2Fsystem_event OR
    logName: /logs/cloudaudit.googleapis.com%2Fdata_access OR
    logName: /logs/compute.googleapis.com%2Fvpc_flows OR
    logName: /logs/compute.googleapis.com%2Ffirewall OR
    logName: /logs/cloudaudit.googleapis.com%2Faccess_transparency
EOF
  all_logs_filter         = ""
  log_sink_prefix         = data.terraform_remote_state.bootstrap.outputs.log_sink_prefix
  shared_environment_code = data.terraform_remote_state.bootstrap.outputs.shared_environment_code
  bucket_prefix           = data.terraform_remote_state.bootstrap.outputs.bucket_prefix
  gcp_region              = data.terraform_remote_state.bootstrap.outputs.gcp_region
  // org policy
  organization_id  = var.parent_folder != "" ? null : data.terraform_remote_state.bootstrap.outputs.org_id
  folder_id        = var.parent_folder != "" ? var.parent_folder : null
  policy_for       = var.parent_folder != "" ? "folder" : "organization"
  domains_to_allow = data.terraform_remote_state.bootstrap.outputs.domains_to_allow
  project_name     = data.terraform_remote_state.bootstrap.outputs.project_name
  //projects
  project_prefix            = data.terraform_remote_state.bootstrap.outputs.project_prefix
  billing_account           = data.terraform_remote_state.bootstrap.outputs.billing_account
  primary_contact           = data.terraform_remote_state.bootstrap.outputs.primary_contact
  secondary_contact         = data.terraform_remote_state.bootstrap.outputs.secondary_contact
  terraform_service_account = data.terraform_remote_state.bootstrap.outputs.terraform_service_account
  enable_hub_and_spoke      = data.terraform_remote_state.bootstrap.outputs.enable_hub_and_spoke
  custom_labels             = data.terraform_remote_state.bootstrap.outputs.custom_labels
}
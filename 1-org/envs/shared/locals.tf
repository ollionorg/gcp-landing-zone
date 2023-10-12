locals {
  // folders
  parent_folder      = data.terraform_remote_state.bootstrap.outputs.parent_folder
  parent             = local.parent_folder != "" ? "folders/${local.parent_folder}" : "organizations/${data.terraform_remote_state.bootstrap.outputs.org_id}"
  folder_prefix      = data.terraform_remote_state.bootstrap.outputs.folder_prefix
  shared_env         = data.terraform_remote_state.bootstrap.outputs.shared_env
  org_id             = data.terraform_remote_state.bootstrap.outputs.org_id
  billing_data_users = data.terraform_remote_state.bootstrap.outputs.billing_data_users
  domain             = local.domains_to_allow[0]
  cfo                = data.terraform_remote_state.bootstrap.outputs.cfo
  group_org_admins   = data.terraform_remote_state.bootstrap.outputs.group_org_admins
  #user groups ops
  cto_security_operations_group          = data.terraform_remote_state.bootstrap.outputs.cto_security_operations_group
  cto_elevated_security_operations_group = data.terraform_remote_state.bootstrap.outputs.cto_elevated_security_operations_group
  cto_operations_group                   = data.terraform_remote_state.bootstrap.outputs.cto_operations_group
  cto_core_networking_operations_group   = data.terraform_remote_state.bootstrap.outputs.cto_core_networking_operations_group
  cto_audit_compliance_operations_group  = data.terraform_remote_state.bootstrap.outputs.cto_audit_compliance_operations_group
  #user groups build
  cto_build_group                   = data.terraform_remote_state.bootstrap.outputs.cto_build_group                   #TODO
  cto_security_build_group          = data.terraform_remote_state.bootstrap.outputs.cto_security_build_group          #TODO
  cto_elevated_security_build_group = data.terraform_remote_state.bootstrap.outputs.cto_elevated_security_build_group #TODO
  cto_core_networking_build_group   = data.terraform_remote_state.bootstrap.outputs.cto_core_networking_build_group   #TODO

  // log sinks
  parent_resource_id      = local.parent_folder != "" ? local.parent_folder : data.terraform_remote_state.bootstrap.outputs.org_id
  parent_resource_type    = local.parent_folder != "" ? "folder" : "organization"
  main_logs_filter        = <<EOF
    logName: /logs/cloudaudit.googleapis.com%2Fdata_access OR
    logName: /logs/cloudaudit.googleapis.com%2Faccess_transparency
EOF
  operations_logs_filter  = <<EOF
    logName: /logs/cloudaudit.googleapis.com%2Factivity OR
    logName: /logs/cloudaudit.googleapis.com%2Fsystem_event
EOF
  security_logs_filter    = <<EOF
    logName: /logs/compute.googleapis.com%2Fvpc_flows OR
    logName: /logs/compute.googleapis.com%2Ffirewall
EOF
  all_logs_filter         = ""
  log_sink_prefix         = data.terraform_remote_state.bootstrap.outputs.log_sink_prefix
  shared_environment_code = data.terraform_remote_state.bootstrap.outputs.shared_environment_code
  bucket_prefix           = data.terraform_remote_state.bootstrap.outputs.bucket_prefix
  gcp_region              = data.terraform_remote_state.bootstrap.outputs.gcp_region
  // org policy
  organization_id  = local.parent_folder != "" ? null : data.terraform_remote_state.bootstrap.outputs.org_id
  folder_id        = local.parent_folder != "" ? local.parent_folder : null
  policy_for       = local.parent_folder != "" ? "folder" : "organization"
  domains_to_allow = data.terraform_remote_state.bootstrap.outputs.domains_to_allow
  project_name     = data.terraform_remote_state.bootstrap.outputs.project_name
  //projects
  enable_interconnect_projects = data.terraform_remote_state.bootstrap.outputs.enable_interconnect_projects
  enable_restricted_network    = data.terraform_remote_state.bootstrap.outputs.enable_restricted_network
  project_prefix               = data.terraform_remote_state.bootstrap.outputs.project_prefix
  billing_account              = data.terraform_remote_state.bootstrap.outputs.billing_account
  primary_contact              = data.terraform_remote_state.bootstrap.outputs.primary_contact
  secondary_contact            = data.terraform_remote_state.bootstrap.outputs.secondary_contact
  terraform_service_account    = data.terraform_remote_state.bootstrap.outputs.terraform_service_account
  enable_hub_and_spoke         = data.terraform_remote_state.bootstrap.outputs.enable_hub_and_spoke
  custom_labels                = data.terraform_remote_state.bootstrap.outputs.custom_labels
}
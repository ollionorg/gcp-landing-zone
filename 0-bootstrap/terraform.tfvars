group_org_admins           = "" # DL Google Group for GCP Organization Administrators
group_billing_admins       = "" # DL Google Group for GCP Billing Administrators
billing_data_users         = "" # DL Google Workspace or Cloud Identity group that have access to billing data set
monitoring_workspace_users = "" # DL Google Workspace or Cloud Identity group that have access to Monitoring Workspaces

#deploy groups
cto_build_group                   = "" # DL Google Workspace or Cloud Identity group of guild users  
cto_security_build_group          = "" # DL Google Workspace or Cloud Identity group for security build group
cto_elevated_security_build_group = "" # DL Google Workspace or Cloud Identity group responsible for elevated security build users
cto_core_networking_build_group   = "" # DL Google Workspace or Cloud Identity group for networking build users

#ops_user_groups
cto_security_operations_group          = "" # DL Google Workspace or Cloud Identity group responsible for security operations
cto_elevated_security_operations_group = "" # DL cto_elevated_security_operations_group
cto_operations_group                   = "" # DL Google Workspace or Cloud Identity group responsible for operations
cto_core_networking_operations_group   = "" # DL Google Workspace or Cloud Identity group responsible for network operations
cto_user_management_operations_group   = "" # DL Google Workspace or Cloud Identity group for management operations
cto_audit_compliance_operations_group  = "" # DL Google Workspace or Cloud Identity group for audit and compliance users

#other group
cfo = "" # DL Google Workspace or Cloud Identity group billing data users


org_id            = ""       # 12 digit gcp org id
billing_account   = ""       # billing account id in the format XXXXXX-YYYYYY-ZZZZZZ
default_region    = ""       # example: asia-southeast1
parent_folder     = ""       # used if LZ to be deployed under a folder
project_prefix    = ""       # example: prj
folder_prefix     = ""       # example: fldr
bucket_prefix     = ""       # example: bkt
log_sink_prefix   = ""       # example: sk
project_name      = ""       # example: cldcvr
primary_contact   = ""       # example: varun_at_cldcvr_com
secondary_contact = ""       # example: sachi_at_cldcvr_com
vpc_prefix        = "vpc"

#bootstrap
runner_repo_name    = ""              # example: `gcp-lz` part of https://github.com/cldcvr/gcp-lz repo
runner_repo_owner   = ""              # example: `cldcvr` part of https://github.com/cldcvr/gcp-lz repo
runner_machine_type = "n1-standard-1" # example: f1-micro or e2-medium
num_instances       = 3               # count of runners required to run the workflows
gar_repo_name       = ""              # example: gcf-lz-image (Name of the artifactory repo to be created in `cicd` project

domains_to_allow                       = ["<DOMAIN NAME>"]  # example: godmode.in
default_region2                        = ""                 # 2nd region required for peering; example: us-west1
domain                                 = ""                 # The DNS name of peering managed zone. Must end with a period. For example: cldcvr.com.
enable_env_log_sink                    = true               # Enable environment level log sink.
enable_restricted_network              = false              # Restriceted network, project and service perimeter
enable_interconnect_projects           = true               # Enable to create interconnect projects
d_enable_dedicated_interconnect        = false              # Set the value to true if you want to create dedicated interconnect. 
restricted_enable_partner_interconnect = false              # Set the value to true if you want to create restricted partner interconnect.
shared_enable_partner_interconnect     = false              # Set the value to true if you want to create shared partner interconnect
runner_subnet_ip                       = "192.168.0.0/24"   # The subnet range in which the runner instances will be built. For e.g. 192.168.168.0/24
git_pvt_key_scrt_name                  = ""                 # The name / secret id which holds the private key for the deploy keys added to the Github repo
custom_labels                          = {}                 # Customer desigend labels for project
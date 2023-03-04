
#Populate all the group DLs according to the name of variables
#deploy groups
cto_build_group                   = "" #Group DL email. e.g group_org_admins@godmode.in
cto_security_build_group          = "" #Group DL email. e.g group_org_admins@godmode.in
cto_elevated_security_build_group = "" #Group DL email. e.g group_org_admins@godmode.in
cto_core_networking_build_group   = "" #Group DL email. e.g group_org_admins@godmode.in

#ops_user_groups
cto_security_operations_group          = "" #Group DL email. e.g group_org_admins@godmode.in
cto_elevated_security_operations_group = "" #Group DL email. e.g group_org_admins@godmode.in
cto_operations_group                   = "" #Group DL email. e.g group_org_admins@godmode.in
cto_core_networking_operations_group   = "" #Group DL email. e.g group_org_admins@godmode.in
cto_user_management_operations_group   = "" #Group DL email. e.g group_org_admins@godmode.in
cto_audit_compliance_operations_group  = "" #Group DL email. e.g group_org_admins@godmode.in

#other group
cfo_group           = "" #Group DL email. e.g group_org_admins@godmode.in #billing data access
bu_app_deploy_group = "" #Group DL email. e.g group_org_admins@godmode.in
org_admins_group    = "" #Group DL email. e.g group_org_admins@godmode.in

org_id            = "" # 12 digit gcp org id
billing_account   = "" # billing account id in the format XXXXXX-YYYYYY-ZZZZZZ
default_region    = "" # example: asia-southeast1
parent_folder     = "" # used if LZ to be deployed under a folder
project_prefix    = "" # example: prj
folder_prefix     = "" # example: fldr
bucket_prefix     = "" # example: bkt
log_sink_prefix   = "" # example: sk
project_name      = "" # example: cldcvr
primary_contact   = "" # example: varun_at_cldcvr_com
secondary_contact = "" # example: sachi_at_cldcvr_com
vpc_prefix        = "" # example: vpc

#bootstrap
runner_repo_name    = ""              # example: `gcp-lz` part of https://github.com/cldcvr/gcp-lz repo
runner_repo_owner   = ""              # example: `cldcvr` part of https://github.com/cldcvr/gcp-lz repo
runner_machine_type = "n1-standard-1" # example: f1-micro or e2-medium
num_instances       = 3               # count of runners required to run the workflows
gar_repo_name       = ""              # example: gcf-lz-image (Name of the artifactory repo to be created in `cicd` project

domains_to_allow                       = ["<DOMAIN NAME>"] # example: godmode.in
default_region2                        = ""                # 2nd region required for peering; example: us-west1
domain                                 = ""                # The DNS name of peering managed zone. Must end with a period. For example: cldcvr.com.
enable_env_log_sink                    = true              # Enable environment level log sink, this will create folder level dink for each env and store the logs in logging project _Default log bucket
enable_restricted_network              = false             # Restriceted network, project and service perimeter
enable_interconnect_projects           = true              #Create interconnect projects
enable_interconnect_firewall           = true              #Create firewall that will be used to route all traffic coming in
d_enable_dedicated_interconnect        = false             #Create Dedicated interconnect, if enabled modify the variables present at interconnect.auto.tfvars in same directory
restricted_enable_partner_interconnect = false             #Create Partner interconnect in Restricted Network service perimeter
shared_enable_partner_interconnect     = false             #Create Partner interconnect in Shared network
runner_subnet_ip                       = "192.168.0.0/24"
git_pvt_key_scrt_name                  = ""
custom_labels                          = {}
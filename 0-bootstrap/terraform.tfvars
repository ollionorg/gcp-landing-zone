group_org_admins           = "group_org_admins@<DOMAIN NAME>" # example: godmode.in <DOMAIN NAME>
group_billing_admins       = "group_org_admins@<DOMAIN NAME>" # example: godmode.in <DOMAIN NAME>; can be a different DL
billing_data_users         = "group_org_admins@<DOMAIN NAME>" # example: godmode.in <DOMAIN NAME>; can be a different DL
audit_data_users           = "group_org_admins@<DOMAIN NAME>" # example: godmode.in <DOMAIN NAME>; can be a different DL
monitoring_workspace_users = "group_org_admins@<DOMAIN NAME>" # example: godmode.in <DOMAIN NAME>; can be a different DL

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
vpc_prefix        = ""

#bootstrap
runner_repo_name    = ""              # example: `gcp-lz` part of https://github.com/cldcvr/gcp-lz repo
runner_repo_owner   = ""              # example: `cldcvr` part of https://github.com/cldcvr/gcp-lz repo
runner_machine_type = "n1-standard-1" # example: f1-micro or e2-medium
num_instances       = 3               # count of runners required to run the workflows
gar_repo_name       = ""              # example: gcf-lz-image (Name of the artifactory repo to be created in `cicd` project

domains_to_allow = ["<DOMAIN NAME>"] # example: godmode.in
default_region2  = ""                # 2nd region required for peering; example: us-west1
domain           = ""                # The DNS name of peering managed zone. Must end with a period. For example: cldcvr.com.

runner_subnet_ip      = ""
git_pvt_key_scrt_name = ""
custom_labels         = {}
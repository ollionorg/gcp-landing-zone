group_org_admins = ""  # Distribution List (DL) for Google Group of GCP Organization Administrators.
group_billing_admins = ""  # Distribution List (DL) for Google Group of GCP Billing Administrators.
billing_data_users = ""  # Distribution List (DL) for Google Workspace or Cloud Identity group with access to the billing data set.
monitoring_workspace_users = ""  # Distribution List (DL) for Google Workspace or Cloud Identity group with access to Monitoring Workspaces.

# Deploy groups
cto_build_group = ""  # Distribution List (DL) for Google Workspace or Cloud Identity group of guild users.
cto_security_build_group = ""  # Distribution List (DL) for Google Workspace or Cloud Identity security build group.
cto_elevated_security_build_group = ""  # Distribution List (DL) for Google Workspace or Cloud Identity group responsible for elevated security build users.
cto_core_networking_build_group = ""  # Distribution List (DL) for Google Workspace or Cloud Identity networking build group.

# Ops user groups
cto_security_operations_group = ""  # Distribution List (DL) for Google Workspace or Cloud Identity group responsible for security operations.
cto_elevated_security_operations_group = ""  # Distribution List (DL) for Google Workspace or Cloud Identity group responsible for elevated security operations.
cto_operations_group = ""  # Distribution List (DL) for Google Workspace or Cloud Identity group responsible for operations.
cto_core_networking_operations_group = ""  # Distribution List (DL) for Google Workspace or Cloud Identity group responsible for network operations.
cto_user_management_operations_group = ""  # Distribution List (DL) for Google Workspace or Cloud Identity group responsible for management operations.
cto_audit_compliance_operations_group = ""  # Distribution List (DL) for Google Workspace or Cloud Identity group responsible for audit and compliance.

# Other group
cfo = ""  # Distribution List (DL) for Google Workspace or Cloud Identity group of billing data users.

org_id = ""  # 12-digit GCP organization ID.
billing_account = ""  # Billing account ID in the format XXXXXX-YYYYYY-ZZZZZZ.
default_region = ""  # Example: asia-southeast1.
parent_folder = ""  # Used if LZ is to be deployed under a folder.
project_prefix = ""  # Example: prj.
folder_prefix = ""  # Example: fldr.
bucket_prefix = ""  # Example: bkt.
log_sink_prefix = ""  # Example: sk.
project_name = ""  # Example: cldcvr.
primary_contact = ""  # Example: varun_at_cldcvr_com.
secondary_contact = ""  # Example: sachi_at_cldcvr_com.
vpc_prefix = "vpc"      # VPC prefix used to create the vpc 

# Bootstrap
runner_repo_name = ""  # Example: `gcp-lz` part of https://github.com/cldcvr/gcp-lz repo.
runner_repo_owner = ""  # Example: `cldcvr` part of https://github.com/cldcvr/gcp-lz repo.
runner_machine_type = "n1-standard-1"  # Example: f1-micro or e2-medium.
num_instances = 3  # Count of runners required to run the workflows.
gar_repo_name = ""  # Example: gcf-lz-image (Name of the artifactory repo to be created in `cicd` project).

domains_to_allow = ["<DOMAIN NAME>"]  # Example: godmode.in.
default_region2 = ""  # 2nd region required for peering; example: us-west1.
domain = ""  # The DNS name of the peering managed zone. Must end with a period. For example: cldcvr.com.
enable_env_log_sink = True  # Enable environment-level log sink.
enable_restricted_network = False  # Restricted network, project, and service perimeter.
enable_interconnect_projects = True  # Enable to create interconnect projects.
d_enable_dedicated_interconnect = False  # Set to true if you want to create a dedicated interconnect.
restricted_enable_partner_interconnect = False  # Set to true if you want to create a restricted partner interconnect.
shared_enable_partner_interconnect = False  # Set to true if you want to create a shared partner interconnect.
runner_subnet_ip = "192.168.0.0/24"  # The subnet range in which the runner instances will be built. For example, 192.168.168.0/24.
git_pvt_key_scrt_name = ""  # The name/secret ID that holds the private key for the deploy keys added to the GitHub repo.
custom_labels = {}  # Customer-designed labels for the project.

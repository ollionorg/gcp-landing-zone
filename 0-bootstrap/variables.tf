/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "primary_contact" {
  type        = string
  description = "Email of primary contact"
}

variable "secondary_contact" {
  type        = string
  description = "Email of secondary contact"
}

variable "org_id" {
  description = "GCP Organization ID"
  type        = string
}

variable "billing_account" {
  description = "The ID of the billing account to associate projects with."
  type        = string
}

variable "group_org_admins" {
  description = "Google Group for GCP Organization Administrators"
  type        = string
}

variable "group_billing_admins" {
  description = "Google Group for GCP Billing Administrators"
  type        = string
}

variable "default_region" {
  description = "Default region to create resources where applicable."
  type        = string
  default     = "us-central1"
}

variable "parent_folder" {
  description = "Optional - for an organization with existing projects or for development/validation. It will place all the example foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist."
  type        = string
  default     = ""
}

variable "org_project_creators" {
  description = "Additional list of members to have project creator role across the organization. Prefix of group: user: or serviceAccount: is required."
  type        = list(string)
  default     = []
}

variable "org_policy_admin_role" {
  description = "Additional Org Policy Admin role for admin group. You can use this for testing purposes."
  type        = bool
  default     = false
}

variable "project_prefix" {
  description = "Name prefix to use for projects created. Should be the same in all steps. Max size is 3 characters."
  type        = string
  default     = "prj"
}

variable "folder_prefix" {
  description = "Name prefix to use for folders created. Should be the same in all steps."
  type        = string
  default     = "fldr"
}

variable "bucket_prefix" {
  description = "Name prefix to use for state bucket created."
  type        = string
  default     = "bkt"
}

variable "cloud_source_repos" {
  description = "List of Cloud Source Repositories created during bootstrap project build stage for use with Cloud Build."
  type        = list(string)
  default = [
    "gcp-org",
    "gcp-environments",
    "gcp-networks",
    "gcp-projects"
  ]
}

variable "activate_apis" {
  description = "List of APIs to enable in the seed project."
  type        = list(string)
  default = [
    "admin.googleapis.com",
    "appengine.googleapis.com",
    "bigquery.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "iam.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "servicenetworking.googleapis.com",
    "serviceusage.googleapis.com",
    "storage-api.googleapis.com"
  ]
}

variable "encrypt_gcs_bucket_tfstate" {
  description = "Encrypt bucket used for storing terraform state files in seed project."
  type        = bool
  default     = false
}

variable "folder_id" {
  description = "The ID of a folder to host this project"
  type        = string
  default     = ""
}

variable "force_destroy" {
  description = "If supplied, the state bucket will be deleted even while containing objects."
  type        = bool
  default     = false
}

variable "grant_billing_user" {
  description = "Grant roles/billing.user role to CFT service account"
  type        = bool
  default     = true
}

variable "key_protection_level" {
  description = "The protection level to use when creating a version based on this template."
  type        = string
  default     = "SOFTWARE"
}

variable "key_rotation_period" {
  description = ""
  type        = string
  default     = null
}

variable "kms_prevent_destroy" {
  description = "Set the prevent_destroy lifecycle attribute on keys."
  type        = bool
  default     = true
}

variable "org_admins_org_iam_permissions" {
  description = "List of permissions granted to the group supplied in group_org_admins variable across the GCP organization."
  type        = list(string)
  default     = []
}

variable "project_id" {
  description = "Custom project ID to use for project created. If not supplied, the default id is {project_prefix}-seed-{random suffix}."
  type        = string
  default     = ""
}

variable "project_labels" {
  description = "Labels to apply to the project."
  type        = map(string)
  default     = {}
}

variable "random_suffix" {
  description = "Appends a 4 character random suffix to project ID and GCS bucket name."
  type        = bool
  default     = true
}

variable "sa_enable_impersonation" {
  description = "Allow org_admins group to impersonate service account & enable APIs required."
  type        = bool
  default     = false
}

variable "sa_org_iam_permissions" {
  description = "List of permissions granted to Terraform service account across the GCP organization."
  type        = list(string)
  default = [
    "roles/billing.user",
    "roles/compute.networkAdmin",
    "roles/compute.xpnAdmin",
    "roles/iam.securityAdmin",
    "roles/iam.serviceAccountAdmin",
    "roles/logging.configWriter",
    "roles/orgpolicy.policyAdmin",
    "roles/resourcemanager.folderAdmin",
    "roles/resourcemanager.organizationViewer"
  ]
}

variable "state_bucket_name" {
  description = "Custom state bucket name. If not supplied, the default name is {project_prefix}-tfstate-{random suffix}."
  type        = string
  default     = ""
}

variable "storage_bucket_labels" {
  description = "Labels to apply to the storage bucket."
  type        = map(string)
  default     = {}
}

variable "tf_service_account_id" {
  description = "ID of service account for terraform in seed project"
  type        = string
  default     = "org-terraform"
}

variable "tf_service_account_name" {
  description = "Display name of service account for terraform in seed project"
  type        = string
  default     = "CFT Organization Terraform Account"
}

variable "project_name" {
  type        = string
  description = "Project Name"
  default     = "cldcvr"
}

variable "num_instances" {
  description = "Number of compute instances to be spinned up as Github Self hosted runners."
  type        = number
}

variable "runner_machine_type" {
  description = "Machine type for Github Self hosted runners."
  type        = string
  default     = "n1-standard-1"
}

variable "runner_repo_name" {
  type        = string
  description = "Name of the repo for the Github Action"
}

variable "runner_repo_owner" {
  type        = string
  description = "Owner of the repo for the Github Action"
}

variable "source_image_family" {
  description = "Source Image family of the image from which to initialize the disk. for e.g. ubuntu-2004-lts"
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "source_image_project" {
  description = "The Project for Source Image. for e.g. ubuntu-os-cloud"
  type        = string
  default     = "ubuntu-os-cloud"
}

variable "gh_token" {
  type        = string
  description = "Github token that is used for generating Self Hosted Runner Token"
  default     = "default-runner-token"
}

variable "gar_repo_name" {
  type        = string
  description = "GCP Artifact Registry Name to store container image for Cloud Build builder."
}

variable "runner_subnet_ip" {
  type        = string
  description = "The subnet range in which the runner instances will be built. For e.g. 192.168.168.0/24"
}

variable "sa_prj_rnr_iam_permissions" {
  description = "List of permissions granted to Runner service account across the CICD Project."
  type        = list(string)
  default = [
    "roles/cloudbuild.builds.builder",
    "roles/secretmanager.secretAccessor",
    "roles/cloudbuild.builds.editor",
    "roles/iam.serviceAccountUser",
    "roles/viewer"
  ]
}

variable "sa_prj_cb_iam_permissions" {
  description = "List of permissions granted to Cloudbuild service account from CICD project across the CICD Project."
  type        = list(string)
  default = [
    "roles/secretmanager.secretAccessor",
    "roles/secretmanager.secretVersionManager",
    "roles/compute.instanceAdmin.v1",
    "roles/compute.instanceAdmin",
    "roles/iam.serviceAccountTokenCreator",
    "roles/iam.serviceAccountUser",
    "roles/secretmanager.viewer"
  ]
}

variable "sa_org_cb_iam_permissions" {
  description = "List of permissions granted to Cloudbuild service account from CICD project across the organization."
  type        = list(string)
  default = [
    "roles/iam.serviceAccountTokenCreator",
    "roles/iam.serviceAccountUser",
    "roles/cloudkms.viewer",
    "roles/iam.securityReviewer"
  ]
}

variable "git_pvt_key_scrt_name" {
  description = "The name / secret id which holds the private key for the deploy keys added to the Github repo."
  type        = string
  default     = "git-gcplz-ssh-pvt"
}


# 1-org

variable "enable_hub_and_spoke" {
  description = "Enable Hub-and-Spoke architecture."
  type        = bool
}

variable "billing_data_users" {
  description = "Google Workspace or Cloud Identity group that have access to billing data set."
  type        = string
}

variable "audit_data_users" {
  description = "Google Workspace or Cloud Identity group that have access to audit logs."
  type        = string
}

variable "domains_to_allow" {
  description = "The list of domains to allow users from in IAM. Used by Domain Restricted Sharing Organization Policy. Must include the domain of the organization you are deploying the foundation. To add other domains you must also grant access to these domains to the terraform service account used in the deploy."
  type        = list(any)
}

# 2-env
#
variable "monitoring_workspace_users" {
  description = "Google Workspace or Cloud Identity group that have access to Monitoring Workspaces."
  type        = string
}
# 3-networks
variable "default_region2" {
  type        = string
  description = "Second subnet region for DNS Hub network."
}

variable "domain" {
  type        = string
  description = "The DNS name of peering managed zone, for instance 'example.com.'. Must end with a period."
}

variable "enable_hub_and_spoke_transitivity" {
  description = "Enable transitivity via gateway VMs on Hub-and-Spoke architecture."
  type        = bool
  default     = false
}

variable "target_name_server_addresses" {
  description = "List of IPv4 address of target name servers for the forwarding zone configuration. See https://cloud.google.com/dns/docs/overview#dns-forwarding-zones for details on target name servers in the context of Cloud DNS forwarding zones."
  type        = list(string)
}
variable "dev_environment_code" {
  description = "Environment code used in 2-envs and 3-networks stages"
  type        = string
}

variable "staging_environment_code" {
  description = "Environment code used in 2-envs and 3-networks stages"
  type        = string
}

variable "prod_environment_code" {
  description = "Environment code used in 2-envs and 3-networks stages"
  type        = string
}

variable "shared_env" {
  description = "Environment code used in 2-envs and 3-networks stages"
  type        = string
}

variable "shared_environment_code" {
  description = "Environment code used in 1-org, 2-envs and 3-networks stages"
  type        = string
}

variable "bootstrap_env_code" {
  description = "Environment code used for bootstrap stage"
  type        = string
}

variable "bootstrap_environment_name" {
  description = "Environment name used for bootstrap stage"
  type        = string
}

variable "log_sink_prefix" {
  description = ""
  type        = string
}

variable "development_folder" {
  description = "development environment folder name"
  type        = string
}

variable "staging_folder" {
  description = "staging environment folder name"
  type        = string
}

variable "production_folder" {
  description = "production environment folder name"
  type        = string
}

#network
variable "base_vpc_firewall_egress_dest_ranges" {
  description = "Used in shared vpc firewall egress destination ranges"
  type        = list(any)
}

variable "base_vpc_firewall_ingress_src_ranges" {
  description = "Used in shared vpc firewall ingress source ranges"
  type        = list(any)
}
#network
variable "base_vpc_global_address_private" {
  description = "IP address range supplied as an input to reserve a specific address in a network - Internal"
  type        = map(any)
  default = {
    "d" = "10.16.64.0/21"  //development
    "s" = "10.16.128.0/21" //staging
    "p" = "10.16.192.0/21" //production
  }
}

variable "base_vpc_private_subnet_default_region" {
  description = "Subnet range for creating subnet for a region, this variable is used in google network module, subnets"
  type        = map(any)
  default = {
    "d" = "10.0.64.0/21"
    "s" = "10.0.128.0/21"
    "p" = "10.0.192.0/21"
  }
}

variable "base_vpc_private_subnet_default_region2" {
  description = "Subnet range for creating subnet in default region2, this variable is used in google network module, subnets"
  type        = map(any)
  default = {
    "d" = "10.1.64.0/21"
    "s" = "10.1.128.0/21"
    "p" = "10.1.192.0/21"
  }
}

variable "base_vpc_subnet_secondary_ip_range_gke_pod" {
  description = "Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module"
  type        = map(any)
  default = {
    "d" = "100.64.64.0/21"
    "s" = "100.64.128.0/21"
    "p" = "100.64.192.0/21"
  }
}

variable "base_vpc_subnet_secondary_ip_range_gke_svc" {
  description = "Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module"
  type        = map(any)
  default = {
    "d" = "100.64.72.0/21"
    "s" = "100.64.136.0/21"
    "p" = "100.64.200.0/21"
  }
}

#Restricted network ranges
#common
variable "rest_vpc_firewall_egress_dest_ranges" {
  description = "Used in shared vpc firewall egress destination ranges"
  type        = list(any)
}

variable "rest_vpc_firewall_ingress_src_ranges" {
  description = "Used in shared vpc firewall ingress source ranges"
  type        = list(any)
}
#network restricted - development
variable "rest_vpc_global_address_private" {
  description = "IP address range supplied as an input to reserve a specific address in a network - Internal"
  type        = map(any)
  default = {
    "d" = "10.24.64.0/21"  //development
    "s" = "10.24.128.0/21" //staging
    "p" = "10.24.192.0/21" //production
  }
}

variable "rest_vpc_private_subnet_default_region" {
  description = "Subnet range for creating subnet for a region, this variable is used in google network module, subnets"
  type        = map(any)
  default = {
    "d" = "10.8.64.0/21"
    "s" = "10.8.128.0/21"
    "p" = "10.8.192.0/21"
  }
}

variable "rest_vpc_private_subnet_default_region2" {
  description = "Subnet range for creating subnet in default region2, this variable is used in google network module, subnets"
  type        = map(any)
  default = {
    "d" = "10.9.64.0/21"
    "s" = "10.9.128.0/21"
    "p" = "10.9.192.0/21"
  }
}

variable "rest_vpc_subnet_secondary_ip_range_gke_pod" {
  description = "Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module"
  type        = map(any)
  default = {
    "d" = "100.72.64.0/21"
    "s" = "100.72.128.0/21"
    "p" = "100.72.192.0/21"
  }
}

variable "rest_vpc_subnet_secondary_ip_range_gke_svc" {
  description = "Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module"
  type        = map(any)
  default = {
    "d" = "100.72.72.0/21"
    "s" = "100.72.136.0/21"
    "p" = "100.72.200.0/21"
  }
}

variable "vpc_prefix" {
  description = "VPC prefix used to create the vpc "
  type        = string
}

variable "subnet_ip_cidr_range_region1" {
  description = "The range of internal addresses that are owned by this subnetwork. Only IPv4 is supported"
  type        = string
}

variable "subnet_ip_cidr_range_region2" {
  description = "The range of internal addresses that are owned by this subnetwork. Only IPv4 is supported"
  type        = string
}

variable "ingress_ranges_firewall" {
  description = "Source IP address range in CIDR format. Required for INGRESS rules."
  type        = list(any)
}

variable "egress_ranges_firewall" {
  description = "Destination IP address range in CIDR format. Required for EGRESS rules."
  type        = list(any)
}

variable "custom_labels" {
  description = "Customer desigend labels for project"
  type        = map(string)
  default     = {}
}
#variable "" {}
#
#variable "" {}
#
#variable "" {}
#
#variable "" {}
#
#variable "" {}
#
#variable "" {}


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

output "seed_project_id" {
  description = "Project where service accounts and core APIs will be enabled."
  value       = module.seed_bootstrap.seed_project_id
}

output "terraform_service_account" {
  description = "Email for privileged service account for Terraform."
  value       = module.seed_bootstrap.terraform_sa_email
}

output "terraform_sa_name" {
  description = "Fully qualified name for privileged service account for Terraform."
  value       = module.seed_bootstrap.terraform_sa_name
}

output "gcs_bucket_tfstate" {
  description = "Bucket used for storing terraform state for foundations pipelines in seed project."
  value       = module.seed_bootstrap.gcs_bucket_tfstate
}

/* ----------------------------------------
    Specific to cloudbuild_module
   ---------------------------------------- */
// Comment-out the cloudbuild_bootstrap module and its outputs if you want to use Jenkins instead of Cloud Build
output "cloudbuild_project_id" {
  description = "Project where CloudBuild configuration and terraform container image will reside."
  value       = module.cloudbuild_bootstrap.cloudbuild_project_id
}

output "gcs_bucket_cloudbuild_artifacts" {
  description = "Bucket used to store Cloud/Build artifacts in CloudBuild project."
  value       = module.cloudbuild_bootstrap.gcs_bucket_cloudbuild_artifacts
}

output "csr_repos" {
  description = "List of Cloud Source Repos created by the module, linked to Cloud Build triggers."
  value       = module.cloudbuild_bootstrap.csr_repos
}

output "terraform_validator_policies_repo" {
  description = "Cloud Source Repository created for terraform-validator policies."
  value       = google_sourcerepo_repository.gcp_policies
}

output "kms_keyring" {
  description = "KMS Keyring created by the module."
  value       = module.cloudbuild_bootstrap.kms_keyring
}

output "kms_crypto_key" {
  description = "KMS key created by the module."
  value       = module.cloudbuild_bootstrap.kms_crypto_key
}

output "project_prefix" {
  value       = var.project_prefix
  description = "Project prefix used by projects."
}

output "folder_prefix" {
  description = "Folder prefix used by folders."
  value       = var.folder_prefix
}

output "bucket_prefix" {
  description = "Bucket prefix used by Cloud Storage buckets."
  value       = var.bucket_prefix
}

output "org_id" {
  description = "Organization Id"
  value       = var.org_id
}

output "parent_folder" {
  description = "The Parent folder ID."
  value       = var.parent_folder
}

output "gcp_region" {
  description = "Default GCP region."
  value       = var.default_region
}

output "billing_account" {
  description = "Billing account ID details."
  value       = var.billing_account
}

output "project_name" {
  description = "Project name, example: cldcvr."
  value       = var.project_name
}

output "group_org_admins" {
  description = "Google Group for GCP Organization Administrators."
  value       = var.group_org_admins
}

output "primary_contact" {
  description = "Email of primary contact."
  value       = var.primary_contact
}

output "secondary_contact" {
  description = "Email of secondary contact."
  value       = var.secondary_contact
}

output "runner_repo_owner" {
  description = "Owner of the repo for the Github Action."
  value       = var.runner_repo_owner
}

output "runner_labels" {
  description = "Github runner labels."
  value       = "${var.project_name}-runner"
}

output "gar_repo_name" {
  description = "Github Repo name."
  value       = var.gar_repo_name
}

output "git_pvt_key_scrt_name" {
  description = "The name / secret id which holds the private key for the deploy keys added to the Github repo"
  value       = var.git_pvt_key_scrt_name
}

# 1-org
output "enable_hub_and_spoke" {
  description = "Enable Hub-and-Spoke architecture."
  value       = var.enable_hub_and_spoke
}

output "domains_to_allow" {
  description = "The list of domains to allow users from in IAM. Used by Domain Restricted Sharing Organization Policy. Must include the domain of the organization you are deploying the foundation. To add other domains you must also grant access to these domains to the terraform service account used in the deploy."
  value       = var.domains_to_allow
}

output "billing_data_users" {
  description = "Google Workspace or Cloud Identity group that have access to billing data set."
  value       = var.billing_data_users
}

# 2-env
output "enable_env_log_sink" {
  description = "Enable environment log sink."
  value       = var.enable_env_log_sink
}

#User groups
output "cto_security_operations_group" {
  description = "Google Workspace or Cloud Identity group responsible for security operations."
  value       = var.cto_security_operations_group
}

output "cto_elevated_security_operations_group" {
  description = "Google Workspace or Cloud Identity group responsible for security operations."
  value       = var.cto_elevated_security_operations_group
}

output "cto_operations_group" {
  description = "Google Workspace or Cloud Identity group responsible for security operations."
  value       = var.cto_operations_group
}

output "cfo" {
  description = "Google Workspace or Cloud Identity group responsible for security operations."
  value       = var.cfo
}

output "cto_audit_compliance_operations_group" {
  description = "Google Workspace or Cloud Identity group responsible for security operations."
  value       = var.cto_audit_compliance_operations_group
}

output "cto_core_networking_operations_group" {
  description = "Google Workspace or Cloud Identity group responsible for security operations."
  value       = var.cto_core_networking_operations_group
}

output "cto_build_group" {
  description = "Google Workspace or Cloud Identity group responsible for security operations."
  value       = var.cto_build_group
}

output "cto_security_build_group" {
  description = "Google Workspace or Cloud Identity group responsible for security operations."
  value       = var.cto_security_build_group
}

output "cto_elevated_security_build_group" {
  description = "Google Workspace or Cloud Identity group responsible for security operations."
  value       = var.cto_elevated_security_build_group
}

output "cto_core_networking_build_group" {
  description = "Google Workspace or Cloud Identity group responsible for security operations."
  value       = var.cto_core_networking_build_group
}

output "cto_user_management_operations_group" {
  description = "Google Workspace or Cloud Identity group responsible for security operations."
  value       = var.cto_user_management_operations_group
}

output "monitoring_workspace_users" {
  description = "Google Workspace or Cloud Identity group responsible for security operations."
  value       = var.monitoring_workspace_users
}

output "bootstrap_folder" {
  description = "Environment name used for bootstrap stage."
  value       = var.bootstrap_environment_name
}

output "development_folder" {
  description = "Development environment folder name."
  value       = var.development_folder
}

output "staging_folder" {
  description = "staging environment folder name."
  value       = var.staging_folder
}

output "production_folder" {
  description = "Production environment folder name."
  value       = var.production_folder
}

# 3-networks
output "default_region2" {
  description = "Second subnet region for DNS Hub network."
  value       = var.default_region2
}

output "domain" {
  description = "The DNS name of peering managed zone, for instance 'example.com.'. Must end with a period."
  value       = var.domain
}

output "enable_restricted_network" {
  description = "Enable restricted network"
  value       = var.enable_restricted_network
}

output "enable_hub_and_spoke_transitivity" {
  description = "Enable transitivity via gateway VMs on Hub-and-Spoke architecture."
  value       = var.enable_hub_and_spoke_transitivity
}

output "target_name_server_addresses" {
  description = "List of IPv4 address of target name servers for the forwarding zone configuration."
  value       = var.target_name_server_addresses
}

output "dev_environment_code" {
  description = "Development environment code."
  value       = var.dev_environment_code
}

output "staging_environment_code" {
  description = "Staging environment code."
  value       = var.staging_environment_code
}

output "prod_environment_code" {
  description = "Projection environment code."
  value       = var.prod_environment_code
}

output "shared_environment_code" {
  description = "Shared environment code."
  value       = var.shared_environment_code
}

output "shared_env" {
  description = "Environment code used in 2-envs and 3-networks stages."
  value       = var.shared_env
}

output "log_sink_prefix" {
  description = "Log sink prefix."
  value       = var.log_sink_prefix
}

#network
output "base_vpc_firewall_egress_dest_ranges" {
  description = "Used in shared vpc firewall egress destination ranges."
  value       = var.base_vpc_firewall_egress_dest_ranges
}

output "base_vpc_firewall_ingress_src_ranges" {
  description = "Used in shared vpc firewall ingress source ranges."
  value       = var.base_vpc_firewall_ingress_src_ranges
}
#network - base - all

output "base_vpc_global_address_private" {
  description = "IP address range supplied as an input to reserve a specific address in a network - Internal."
  value       = var.base_vpc_global_address_private
}

output "base_vpc_private_subnet_default_region" {
  description = "Subnet range for creating subnet for a region, this variable is used in google network module, subnets."
  value       = var.base_vpc_private_subnet_default_region
}

output "base_vpc_private_subnet_default_region2" {
  description = "Subnet range for creating subnet for a region2, this variable is used in google network module, subnets."
  value       = var.base_vpc_private_subnet_default_region2
}

output "base_vpc_subnet_secondary_ip_range_gke_pod" {
  description = "Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module."
  value       = var.base_vpc_subnet_secondary_ip_range_gke_pod
}

output "base_vpc_subnet_secondary_ip_range_gke_svc" {
  description = "Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module."
  value       = var.base_vpc_subnet_secondary_ip_range_gke_svc
}

#restricted network
output "rest_vpc_firewall_egress_dest_ranges" {
  description = "Used in shared vpc firewall egress destination ranges."
  value       = var.rest_vpc_firewall_egress_dest_ranges
}

output "rest_vpc_firewall_ingress_src_ranges" {
  description = "Used in shared vpc firewall ingress source ranges."
  value       = var.rest_vpc_firewall_ingress_src_ranges
}

# network restricted - all

output "rest_vpc_global_address_private" {
  description = "IP address range supplied as an input to reserve a specific address in a network - Internal."
  value       = var.rest_vpc_global_address_private
}

output "rest_vpc_private_subnet_default_region" {
  description = "Subnet range for creating subnet for a region, this variable is used in google network module, subnets."
  value       = var.rest_vpc_private_subnet_default_region
}

output "rest_vpc_private_subnet_default_region2" {
  description = "Subnet range for creating subnet in default region2, this variable is used in google network module, subnets."
  value       = var.rest_vpc_private_subnet_default_region2
}

output "rest_vpc_subnet_secondary_ip_range_gke_pod" {
  description = "Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module."
  value       = var.rest_vpc_subnet_secondary_ip_range_gke_pod
}

output "rest_vpc_subnet_secondary_ip_range_gke_svc" {
  description = "Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module."
  value       = var.rest_vpc_subnet_secondary_ip_range_gke_svc
}

output "vpc_prefix" {
  description = "VPC prefix used to create the vpc."
  value       = var.vpc_prefix
}

output "ingress_ranges_firewall" {
  description = "Source IP address range in CIDR format. Required for INGRESS rules."
  value       = var.ingress_ranges_firewall
}

output "egress_ranges_firewall" {
  description = "Destination IP address range in CIDR format. Required for EGRESS rules."
  value       = var.egress_ranges_firewall
}

output "subnet_ip_cidr_range_region1" {
  description = "The range of internal addresses that are owned by this subnetwork. Only IPv4 is supported."
  value       = var.subnet_ip_cidr_range_region1
}

output "subnet_ip_cidr_range_region2" {
  description = "The range of internal addresses that are owned by this subnetwork. Only IPv4 is supported."
  value       = var.subnet_ip_cidr_range_region2
}

output "runner_repo_name" {
  value       = var.runner_repo_name
  description = "Name of the repo for the Github Action."
}

output "runner_network_name" {
  value = module.runner-mig.networkname
}

output "custom_labels" {
  value       = var.custom_labels
  description = "Customer desigend labels for project"
}

//interconnect-firewall
output "interconnect-firewall" {
  value = var.interconnect-firewall
}

output "management-sub-ip_cidr_range" {
  value       = var.management-sub-ip_cidr_range
  description = "IP ranges for management subnet, this subnet will be used for managing state between firewall servers."

}

output "untrust-sub-ip_cidr_range" {
  value       = var.untrust-sub-ip_cidr_range
  description = "IP ranges for untrusted subnet, this subnet will be used for incoming untrusted traffic."
}

output "trust-sub-ip_cidr_range" {
  value       = var.trust-sub-ip_cidr_range
  description = "IP ranges for trusted subnet, this subnet will be used for trusted traffic traffic for upstream services"
}

output "allow-mgmt-source-ranges" {
  value       = var.allow-mgmt-source-ranges
  description = "Firewall rule for management network."
}

output "allow-inbound-source-ranges" {
  value       = var.allow-inbound-source-ranges
  description = "Ingress firewall rule for untrusted network"
}

output "allow-outbound-source-ranges" {
  value       = var.allow-outbound-source-ranges
  description = "egress firewall rule for untrusted network"
}

output "trust-dest_range" {
  value       = var.trust-dest_range
  description = "destination firewall rule for trusted network"
}

output "region_zone" {
  value       = var.region_zone
  description = "region NGFW HA servers to deploy in"
}

output "zone" {
  value       = var.zone
  description = "region NGFW HA servers to deploy in"
}

output "zone_2" {
  value       = var.zone_2
  description = "region NGFW HA servers to deploy in"
}

output "firewall_name" {
  value       = var.firewall_name
  description = "name of firewall."
}

output "image_fw" {
  value       = var.image_fw
  description = "image from marketplace to pick for firewall server deployment"
}

output "machine_type_fw" {
  value       = var.machine_type_fw
  description = "machine size for firewall server deployment"
}

output "machine_cpu_fw" {
  value       = var.machine_cpu_fw
  description = "cpu processor type for firewall server deployment"
}
output "bootstrap_bucket_fw" {
  value       = var.bootstrap_bucket_fw
  description = "gcp bucket for bootstrap script which will be used to bootstrap the firewall."
}

output "interface_0_name" {
  value       = var.interface_0_name
  description = "interface name for management server"
}

output "interface_1_name" {
  value       = var.interface_1_name
  description = "interface name for untrust server"
}

output "interface_2_name" {
  value       = var.interface_2_name
  description = "interface name for trust server"
}

output "scopes_fw" {
  value       = var.scopes_fw
  description = "scopes attached to server VMS."
}

output "web_server_name" {
  value       = var.web_server_name
  description = "upstream webserver name for testing, this is optional."
}

output "machine_type_web" {
  value       = var.machine_type_web
  description = "upstream webserver type for testing, this is optional."
}

output "image_web" {
  value       = var.image_web
  description = "upstream webserver image type for testing, this is optional"
}

output "scopes_web" {
  value       = var.scopes_web
  description = "scopes attached to web-server VMS, this is optional"
}

output "enable_interconnect_projects" {
  value       = var.enable_interconnect_projects
  description = "Create interconnect projects"
}

#dedicated interconnect outputs
output "d_enable_dedicated_interconnect" {
  value       = var.d_enable_dedicated_interconnect
  description = "Set the value to true if you want to create dedicated interconnect. default, false"
}

output "d_region1_interconnect1_candidate_subnets" {
  value       = var.d_region1_interconnect1_candidate_subnets
  description = "Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc)."
}

output "d_region1_interconnect1_vlan_tag8021q" {
  value       = var.d_region1_interconnect1_vlan_tag8021q
  description = "The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094."
}

output "d_region1_interconnect1_self_link" {
  value       = var.d_region1_interconnect1_self_link
  description = "URL of the underlying Interconnect object that this attachment's traffic will traverse through."
}

output "d_region1_interconnect1_location" {
  value       = var.d_region1_interconnect1_location
  description = "Name of the interconnect location used in the creation of the Interconnect for the first location of region1"
}

output "d_region1_interconnect2_candidate_subnets" {
  value       = var.d_region1_interconnect2_candidate_subnets
  description = "Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc)."
}

output "d_region1_interconnect2_vlan_tag8021q" {
  value       = var.d_region1_interconnect2_vlan_tag8021q
  description = "The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094."
}

output "d_region1_interconnect2_self_link" {
  value       = var.d_region1_interconnect2_self_link
  description = "URL of the underlying Interconnect object that this attachment's traffic will traverse through."
}

output "d_region1_interconnect2_location" {
  value       = var.d_region1_interconnect2_location
  description = "Name of the interconnect location used in the creation of the Interconnect for the second location of region1"
}

output "d_region2_interconnect1_candidate_subnets" {
  value       = var.d_region2_interconnect1_vlan_tag8021q
  description = "Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc)."

}

output "d_region2_interconnect1_vlan_tag8021q" {
  value       = var.d_region2_interconnect1_vlan_tag8021q
  description = "The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094."
}

output "d_region2_interconnect1_self_link" {
  value       = var.d_region2_interconnect1_self_link
  description = "URL of the underlying Interconnect object that this attachment's traffic will traverse through."
}

output "d_region2_interconnect1_location" {
  value       = var.d_region2_interconnect1_location
  description = "Name of the interconnect location used in the creation of the Interconnect for the first location of region2"
}

output "d_region2_interconnect2_candidate_subnets" {
  value       = var.d_region2_interconnect2_candidate_subnets
  description = "Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc)."
}

output "d_region2_interconnect2_vlan_tag8021q" {
  value       = var.d_region2_interconnect2_vlan_tag8021q
  description = "The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094."
}

output "d_region2_interconnect2_self_link" {
  value       = var.d_region2_interconnect2_self_link
  description = "URL of the underlying Interconnect object that this attachment's traffic will traverse through."
}

output "d_region2_interconnect2_location" {
  value       = var.d_region2_interconnect2_location
  description = "Name of the interconnect location used in the creation of the Interconnect for the second location of region2"
}

output "d_cloud_router_labels" {
  value       = var.d_cloud_router_labels
  description = "A map of suffixes for labelling vlans with four entries like \"vlan_1\" => \"suffix1\" with keys from `vlan_1` to `vlan_4`."
}

output "d_peer_asn" {
  value       = var.d_peer_asn
  description = "BGP Autonomous System Number (ASN)."
}

### partner interconnect

output "restricted_enable_partner_interconnect" {
  value       = var.restricted_enable_partner_interconnect
  description = "Set the value to true if you want to create  restricted partner interconnect. default, false"
}

output "shared_enable_partner_interconnect" {
  value       = var.shared_enable_partner_interconnect
  description = "Set the value to true if you want to create  shared partner interconnect. default, false"
}

output "p_r_region1_interconnect1_location" {
  value       = var.p_r_region1_interconnect1_location
  description = "Name of the interconnect location used in the creation of the Interconnect for the second location of region1"
}

output "p_r_region1_interconnect2_location" {
  value       = var.p_r_region1_interconnect2_location
  description = "Name of the interconnect location used in the creation of the Interconnect for the second location of region1"
}

output "p_r_region2_interconnect1_location" {
  value       = var.p_r_region2_interconnect1_location
  description = "Name of the interconnect location used in the creation of the Interconnect for the second location of region1"
}

output "p_r_region2_interconnect2_location" {
  value       = var.p_r_region2_interconnect2_location
  description = "Name of the interconnect location used in the creation of the Interconnect for the second location of region1"
}

output "p_r_cloud_router_labels" {
  value       = var.p_r_cloud_router_labels
  description = "A map of suffixes for labelling vlans with four entries like \"vlan_1\" => \"suffix1\" with keys from `vlan_1` to `vlan_4`."
}

output "p_s_region1_interconnect1_location" {
  value       = var.p_s_region1_interconnect1_location
  description = "Name of the interconnect location used in the creation of the Interconnect for the second location of region1"
}

output "p_s_region1_interconnect2_location" {
  value       = var.p_s_region1_interconnect2_location
  description = "Name of the interconnect location used in the creation of the Interconnect for the second location of region1"
}

output "p_s_region2_interconnect1_location" {
  value       = var.p_s_region2_interconnect1_location
  description = "Name of the interconnect location used in the creation of the Interconnect for the second location of region1"
}

output "p_s_region2_interconnect2_location" {
  value       = var.p_s_region2_interconnect2_location
  description = "Name of the interconnect location used in the creation of the Interconnect for the second location of region1"
}

output "p_s_cloud_router_labels" {
  value       = var.p_s_cloud_router_labels
  description = "A map of suffixes for labelling vlans with four entries like \"vlan_1\" => \"suffix1\" with keys from `vlan_1` to `vlan_4`."
}

output "p_r_preactivate_partner_interconnect" {
  value       = var.p_r_preactivate_partner_interconnect
  description = "Preactivate Partner Interconnect VLAN attachment in the environment."
}

output "p_s_preactivate_partner_interconnect" {
  value       = var.p_s_preactivate_partner_interconnect
  description = "Preactivate Partner Interconnect VLAN attachment in the environment."
}

output "kms_key" {
  value = module.cloudbuild_bootstrap.kms_crypto_key
}
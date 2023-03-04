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
  value = var.project_prefix
}

output "folder_prefix" {
  value = var.folder_prefix
}

output "bucket_prefix" {
  value = var.bucket_prefix
}

output "org_id" {
  value = var.org_id
}

output "parent_folder" {
  value = var.parent_folder
}

output "gcp_region" {
  value = var.default_region
}

output "billing_account" {
  value = var.billing_account
}

output "project_name" {
  value = var.project_name
}

output "org_admins_group" {
  value = var.org_admins_group
}

output "primary_contact" {
  value = var.primary_contact
}

output "secondary_contact" {
  value = var.secondary_contact
}

output "runner_repo_owner" {
  value = var.runner_repo_owner
}

output "runner_labels" {
  value = "${var.project_name}-runner"
}

output "gar_repo_name" {
  value = var.gar_repo_name
}

# 1-org
output "enable_hub_and_spoke" {
  value = var.enable_hub_and_spoke
}

output "domains_to_allow" {
  value = var.domains_to_allow
}

# 2-env
output "enable_env_log_sink" {
  value = var.enable_env_log_sink
}

#User groups
output "cto_security_operations_group" {
  value = var.cto_security_operations_group
}

output "cto_elevated_security_operations_group" {
  value = var.cto_elevated_security_operations_group
}

output "cto_operations_group" {
  value = var.cto_operations_group
}

output "cfo_group" {
  value = var.cfo_group
}

output "bu_app_deploy_group" {
  value = var.bu_app_deploy_group
}

output "cto_audit_compliance_operations_group" {
  value = var.cto_audit_compliance_operations_group
}

output "cto_core_networking_operations_group" {
  value = var.cto_core_networking_operations_group
}

output "cto_build_group" {
  value = var.cto_build_group
}

output "cto_security_build_group" {
  value = var.cto_security_build_group
}

output "cto_elevated_security_build_group" {
  value = var.cto_elevated_security_build_group
}

output "cto_core_networking_build_group" {
  value = var.cto_core_networking_build_group
}

output "cto_user_management_operations_group" {
  value = var.cto_user_management_operations_group
}

output "bootstrap_folder" {
  value = var.bootstrap_environment_name
}

output "development_folder" {
  value = var.development_folder
}

output "staging_folder" {
  value = var.staging_folder
}

output "production_folder" {
  value = var.production_folder
}

# 3-networks
output "default_region2" {
  value = var.default_region2
}

output "domain" {
  value = var.domain
}

output "enable_restricted_network" {
  value = var.enable_restricted_network
}

output "enable_hub_and_spoke_transitivity" {
  value = var.enable_hub_and_spoke_transitivity
}

output "target_name_server_addresses" {
  value = var.target_name_server_addresses
}

output "dev_environment_code" {
  value = var.dev_environment_code
}

output "staging_environment_code" {
  value = var.staging_environment_code
}

output "prod_environment_code" {
  value = var.prod_environment_code
}

output "shared_environment_code" {
  value = var.shared_environment_code
}

output "shared_env" {
  value = var.shared_env
}

output "log_sink_prefix" {
  value = var.log_sink_prefix
}

#network
output "base_vpc_firewall_egress_dest_ranges" {
  value = var.base_vpc_firewall_egress_dest_ranges
}

output "base_vpc_firewall_ingress_src_ranges" {
  value = var.base_vpc_firewall_ingress_src_ranges
}
#network - base - all

output "base_vpc_global_address_private" {
  value = var.base_vpc_global_address_private
}

output "base_vpc_private_subnet_default_region" {
  value = var.base_vpc_private_subnet_default_region
}

output "base_vpc_private_subnet_default_region2" {
  value = var.base_vpc_private_subnet_default_region2
}

output "base_vpc_subnet_secondary_ip_range_gke_pod" {
  value = var.base_vpc_subnet_secondary_ip_range_gke_pod
}

output "base_vpc_subnet_secondary_ip_range_gke_svc" {
  value = var.base_vpc_subnet_secondary_ip_range_gke_svc
}

#restricted network
output "rest_vpc_firewall_egress_dest_ranges" {
  value = var.rest_vpc_firewall_egress_dest_ranges
}

output "rest_vpc_firewall_ingress_src_ranges" {
  value = var.rest_vpc_firewall_ingress_src_ranges
}
# network restricted - all
output "rest_vpc_global_address_private" {
  value = var.rest_vpc_global_address_private
}

output "rest_vpc_private_subnet_default_region" {
  value = var.rest_vpc_private_subnet_default_region
}

output "rest_vpc_private_subnet_default_region2" {
  value = var.rest_vpc_private_subnet_default_region2
}

output "rest_vpc_subnet_secondary_ip_range_gke_pod" {
  value = var.rest_vpc_subnet_secondary_ip_range_gke_pod
}

output "rest_vpc_subnet_secondary_ip_range_gke_svc" {
  value = var.rest_vpc_subnet_secondary_ip_range_gke_svc
}

output "vpc_prefix" {
  value = var.vpc_prefix
}


output "ingress_ranges_firewall" {
  value = var.ingress_ranges_firewall
}

output "egress_ranges_firewall" {
  value = var.egress_ranges_firewall
}

output "subnet_ip_cidr_range_region1" {
  value = var.subnet_ip_cidr_range_region1
}

output "subnet_ip_cidr_range_region2" {
  value = var.subnet_ip_cidr_range_region2
}

output "runner_repo_name" {
  value = var.runner_repo_name
}

output "runner_network_name" {
  value = module.runner-mig.networkname
}


output "custom_labels" {
  value = var.custom_labels
}
#
#output "mig_instance_group" {
#  description = "The instance group url of the created MIG"
#  value       = module.runner-mig.mig_instance_group
#}
#
#output "mig_name" {
#  description = "The name of the MIG"
#  value       = module.runner-mig.mig_name
#}
#
#output "service_account" {
#  description = "Service account email for GCE"
#  value       = module.runner-mig.service_account
#}
#
#output "mig_instance_template" {
#  description = "The name of the MIG Instance Template"
#  value       = module.runner-mig.mig_instance_template
#}

//enable_interconnect_firewall
output "enable_interconnect_firewall" {
  value = var.enable_interconnect_firewall
}

output "management_sub_ip_cidr_range" {
  value = var.management_sub_ip_cidr_range
}

output "untrust_sub_ip_cidr_range" {
  value = var.untrust_sub_ip_cidr_range
}

output "trust_sub_ip_cidr_range" {
  value = var.trust_sub_ip_cidr_range
}

output "allow_mgmt_source_ranges" {
  value = var.allow_mgmt_source_ranges
}

output "allow_inbound_source_ranges" {
  value = var.allow_inbound_source_ranges
}

output "allow_outbound_source_ranges" {
  value = var.allow_outbound_source_ranges
}

output "trust_dest_range" {
  value = var.trust_dest_range
}

output "region_zone" {
  value = var.region_zone
}

output "zone" {
  value = var.zone
}

output "zone_2" {
  value = var.zone_2
}

output "firewall_name" {
  value = var.firewall_name
}

output "image_fw" {
  value = var.image_fw
}

output "machine_type_fw" {
  value = var.machine_type_fw
}

output "machine_cpu_fw" {
  value = var.machine_cpu_fw
}

output "bootstrap_bucket_fw" {
  value = var.bootstrap_bucket_fw
}

output "interface_0_name" {
  value = var.interface_0_name
}

output "interface_1_name" {
  value = var.interface_1_name
}

output "interface_2_name" {
  value = var.interface_2_name
}

output "scopes_fw" {
  value = var.scopes_fw
}

output "web_server_name" {
  value = var.web_server_name
}

output "machine_type_web" {
  value = var.machine_type_web
}

output "image_web" {
  value = var.image_web
}

output "scopes_web" {
  value = var.scopes_web
}

output "enable_interconnect_projects" {
  value = var.enable_interconnect_projects
}

#dedicated interconnect outputs
output "d_enable_dedicated_interconnect" {
  value = var.d_enable_dedicated_interconnect
}

output "d_region1_interconnect1_candidate_subnets" {
  value = var.d_region1_interconnect1_candidate_subnets
}

output "d_region1_interconnect1_vlan_tag8021q" {
  value = var.d_region1_interconnect1_vlan_tag8021q
}

output "d_region1_interconnect1_self_link" {
  value = var.d_region1_interconnect1_self_link
}

output "d_region1_interconnect1_location" {
  value = var.d_region1_interconnect1_location
}

output "d_region1_interconnect2_candidate_subnets" {
  value = var.d_region1_interconnect2_candidate_subnets
}

output "d_region1_interconnect2_vlan_tag8021q" {
  value = var.d_region1_interconnect2_vlan_tag8021q
}

output "d_region1_interconnect2_self_link" {
  value = var.d_region1_interconnect2_self_link
}

output "d_region1_interconnect2_location" {
  value = var.d_region1_interconnect2_location
}

output "d_region2_interconnect1_candidate_subnets" {
  value = var.d_region2_interconnect1_vlan_tag8021q
}

output "d_region2_interconnect1_vlan_tag8021q" {
  value = var.d_region2_interconnect1_vlan_tag8021q
}

output "d_region2_interconnect1_self_link" {
  value = var.d_region2_interconnect1_self_link
}

output "d_region2_interconnect1_location" {
  value = var.d_region2_interconnect1_location
}

output "d_region2_interconnect2_candidate_subnets" {
  value = var.d_region2_interconnect2_candidate_subnets
}

output "d_region2_interconnect2_vlan_tag8021q" {
  value = var.d_region2_interconnect2_vlan_tag8021q
}

output "d_region2_interconnect2_self_link" {
  value = var.d_region2_interconnect2_self_link
}

output "d_region2_interconnect2_location" {
  value = var.d_region2_interconnect2_location
}

output "d_cloud_router_labels" {
  value = var.d_cloud_router_labels
}

output "d_peer_asn" {
  value = var.d_peer_asn
}

### partner interconnect

output "restricted_enable_partner_interconnect" {
  value = var.restricted_enable_partner_interconnect
}

output "shared_enable_partner_interconnect" {
  value = var.shared_enable_partner_interconnect
}

output "p_r_region1_interconnect1_location" {
  value = var.p_r_region1_interconnect1_location
}

output "p_r_region1_interconnect2_location" {
  value = var.p_r_region1_interconnect2_location
}

output "p_r_region2_interconnect1_location" {
  value = var.p_r_region2_interconnect1_location
}

output "p_r_region2_interconnect2_location" {
  value = var.p_r_region2_interconnect2_location
}

output "p_r_cloud_router_labels" {
  value = var.p_r_cloud_router_labels
}

output "p_s_region1_interconnect1_location" {
  value = var.p_s_region1_interconnect1_location
}

output "p_s_region1_interconnect2_location" {
  value = var.p_s_region1_interconnect2_location
}

output "p_s_region2_interconnect1_location" {
  value = var.p_s_region2_interconnect1_location
}

output "p_s_region2_interconnect2_location" {
  value = var.p_s_region2_interconnect2_location
}

output "p_s_cloud_router_labels" {
  value = var.p_s_cloud_router_labels
}

output "p_r_preactivate_partner_interconnect" {
  value = var.p_r_preactivate_partner_interconnect
}

output "p_s_preactivate_partner_interconnect" {
  value = var.p_s_preactivate_partner_interconnect
}
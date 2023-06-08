# 0-bootstrap 

This repo is part of a multipart guide that shows how to configure and deploy the example.com reference architecture described in [Google Cloud security foundations guide](https://services.google.com/fh/files/misc/google-cloud-security-foundations-guide.pdf) (PDF). The following table lists the parts of the guide.

<table>
<tbody>
<tr>
<td>0-bootstrap (this file)</td>
<td>Bootstraps a Google Cloud organization, creating all the required resources
and permissions to start using the Cloud Foundation Toolkit (CFT). This
step also configures a CI/CD pipeline for foundations code in subsequent
stages.</td>
</tr>
</tbody>
</table>


For an overview of the architecture and the parts, see the [Using the Terraform example](https://cloud.google.com/architecture/security-foundations/using-example-terraform).

## Purpose

The purpose of this step is to bootstrap a Google Cloud organization, creating all the required resources & permissions to start using the Cloud Foundation Toolkit (CFT). This step also configures a CI/CD pipeline for foundations code in subsequent stages. The CI/CD pipeline can use either Cloud Build and Cloud Source Repos or Jenkins and your own Git repos (which might live on-premises).

Copyright 2021 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.64.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudbuild_bootstrap"></a> [cloudbuild\_bootstrap](#module\_cloudbuild\_bootstrap) | ../modules/cloudbuild | 1.0.0 |
| <a name="module_runner-mig"></a> [runner-mig](#module\_runner-mig) | ../modules/terraform-google-github-actions-runners/modules/gh-runner-mig-vm | 1.0.0 |
| <a name="module_seed_bootstrap"></a> [seed\_bootstrap](#module\_seed\_bootstrap) | ../modules/terraform-google-bootstrap | 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [google_billing_account_iam_member.tf_billing_admin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_account_iam_member) | resource |
| [google_folder.bootstrap](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder_iam_member.folder_cb_sa_browser](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_iam_member) | resource |
| [google_folder_iam_member.folder_tf_compute_security_policy_admin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_iam_member) | resource |
| [google_folder_iam_member.folder_tf_compute_security_resource_admin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_iam_member) | resource |
| [google_organization_iam_member.cb_sa_org_perms](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.grp_org_admin_perms](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.org_cb_sa_browser](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.org_cb_sa_gke](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.org_cb_sa_gke2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.org_tf_compute_security_policy_admin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.org_tf_compute_security_resource_admin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_project_iam_member.cb_sa_prj_perms](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.project_source_reader](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.rnr_sa_prj_perms](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_sourcerepo_repository.gcp_policies](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sourcerepo_repository) | resource |
| [google_storage_bucket_iam_member.cb_bucket_cb_sa_perms](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [google_storage_bucket_iam_member.state_bucket_cb_sa_perms](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [google_storage_bucket_iam_member.state_bucket_orgtf_sa_perms](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [google_storage_bucket_iam_member.state_bucket_prj_sa_perms](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [google_project.cloudbuild](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | List of APIs to enable in the seed project. | `list(string)` | <pre>[<br>  "admin.googleapis.com",<br>  "appengine.googleapis.com",<br>  "bigquery.googleapis.com",<br>  "cloudbilling.googleapis.com",<br>  "cloudresourcemanager.googleapis.com",<br>  "compute.googleapis.com",<br>  "iam.googleapis.com",<br>  "logging.googleapis.com",<br>  "monitoring.googleapis.com",<br>  "servicenetworking.googleapis.com",<br>  "serviceusage.googleapis.com",<br>  "storage-api.googleapis.com"<br>]</pre> | no |
| <a name="input_allow-inbound-source-ranges"></a> [allow-inbound-source-ranges](#input\_allow-inbound-source-ranges) | Ingress firewall rule for untrusted network | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_allow-mgmt-source-ranges"></a> [allow-mgmt-source-ranges](#input\_allow-mgmt-source-ranges) | Firewall rule for management network. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_allow-outbound-source-ranges"></a> [allow-outbound-source-ranges](#input\_allow-outbound-source-ranges) | egress firewall rule for untrusted network | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_base_vpc_firewall_egress_dest_ranges"></a> [base\_vpc\_firewall\_egress\_dest\_ranges](#input\_base\_vpc\_firewall\_egress\_dest\_ranges) | Used in shared vpc firewall egress destination ranges | `list(any)` | n/a | yes |
| <a name="input_base_vpc_firewall_ingress_src_ranges"></a> [base\_vpc\_firewall\_ingress\_src\_ranges](#input\_base\_vpc\_firewall\_ingress\_src\_ranges) | Used in shared vpc firewall ingress source ranges | `list(any)` | n/a | yes |
| <a name="input_base_vpc_global_address_private"></a> [base\_vpc\_global\_address\_private](#input\_base\_vpc\_global\_address\_private) | IP address range supplied as an input to reserve a specific address in a network - Internal | `map(any)` | <pre>{<br>  "d": "10.16.64.0/21",<br>  "p": "10.16.192.0/21",<br>  "s": "10.16.128.0/21"<br>}</pre> | no |
| <a name="input_base_vpc_private_subnet_default_region"></a> [base\_vpc\_private\_subnet\_default\_region](#input\_base\_vpc\_private\_subnet\_default\_region) | Subnet range for creating subnet for a region, this variable is used in google network module, subnets | `map(any)` | <pre>{<br>  "d": "10.0.64.0/21",<br>  "p": "10.0.192.0/21",<br>  "s": "10.0.128.0/21"<br>}</pre> | no |
| <a name="input_base_vpc_private_subnet_default_region2"></a> [base\_vpc\_private\_subnet\_default\_region2](#input\_base\_vpc\_private\_subnet\_default\_region2) | Subnet range for creating subnet in default region2, this variable is used in google network module, subnets | `map(any)` | <pre>{<br>  "d": "10.1.64.0/21",<br>  "p": "10.1.192.0/21",<br>  "s": "10.1.128.0/21"<br>}</pre> | no |
| <a name="input_base_vpc_subnet_secondary_ip_range_gke_pod"></a> [base\_vpc\_subnet\_secondary\_ip\_range\_gke\_pod](#input\_base\_vpc\_subnet\_secondary\_ip\_range\_gke\_pod) | Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module | `map(any)` | <pre>{<br>  "d": "100.64.64.0/21",<br>  "p": "100.64.192.0/21",<br>  "s": "100.64.128.0/21"<br>}</pre> | no |
| <a name="input_base_vpc_subnet_secondary_ip_range_gke_svc"></a> [base\_vpc\_subnet\_secondary\_ip\_range\_gke\_svc](#input\_base\_vpc\_subnet\_secondary\_ip\_range\_gke\_svc) | Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module | `map(any)` | <pre>{<br>  "d": "100.64.72.0/21",<br>  "p": "100.64.200.0/21",<br>  "s": "100.64.136.0/21"<br>}</pre> | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate projects with. | `string` | n/a | yes |
| <a name="input_billing_data_users"></a> [billing\_data\_users](#input\_billing\_data\_users) | Google Workspace or Cloud Identity group that have access to billing data set. | `string` | n/a | yes |
| <a name="input_bootstrap_bucket_fw"></a> [bootstrap\_bucket\_fw](#input\_bootstrap\_bucket\_fw) | gcp bucket for bootstrap script which will be used to bootstrap the firewall. | `string` | `"bootstrap-alb"` | no |
| <a name="input_bootstrap_env_code"></a> [bootstrap\_env\_code](#input\_bootstrap\_env\_code) | Environment code used for bootstrap stage | `string` | n/a | yes |
| <a name="input_bootstrap_environment_name"></a> [bootstrap\_environment\_name](#input\_bootstrap\_environment\_name) | Environment name used for bootstrap stage | `string` | n/a | yes |
| <a name="input_bucket_prefix"></a> [bucket\_prefix](#input\_bucket\_prefix) | Name prefix to use for state bucket created. | `string` | `"bkt"` | no |
| <a name="input_cfo"></a> [cfo](#input\_cfo) | Google Workspace or Cloud Identity group billing data users. | `string` | n/a | yes |
| <a name="input_cloud_source_repos"></a> [cloud\_source\_repos](#input\_cloud\_source\_repos) | List of Cloud Source Repositories created during bootstrap project build stage for use with Cloud Build. | `list(string)` | <pre>[<br>  "gcp-org",<br>  "gcp-environments",<br>  "gcp-networks",<br>  "gcp-projects"<br>]</pre> | no |
| <a name="input_cto_audit_compliance_operations_group"></a> [cto\_audit\_compliance\_operations\_group](#input\_cto\_audit\_compliance\_operations\_group) | Google Workspace or Cloud Identity group for audit and compliance users. | `string` | n/a | yes |
| <a name="input_cto_build_group"></a> [cto\_build\_group](#input\_cto\_build\_group) | Google Workspace or Cloud Identity group of guild users. | `string` | n/a | yes |
| <a name="input_cto_core_networking_build_group"></a> [cto\_core\_networking\_build\_group](#input\_cto\_core\_networking\_build\_group) | Google Workspace or Cloud Identity group for networking build users. | `string` | n/a | yes |
| <a name="input_cto_core_networking_operations_group"></a> [cto\_core\_networking\_operations\_group](#input\_cto\_core\_networking\_operations\_group) | Google Workspace or Cloud Identity group responsible for network operations. | `string` | n/a | yes |
| <a name="input_cto_elevated_security_build_group"></a> [cto\_elevated\_security\_build\_group](#input\_cto\_elevated\_security\_build\_group) | Google Workspace or Cloud Identity group responsible for elevated security build users. | `string` | n/a | yes |
| <a name="input_cto_elevated_security_operations_group"></a> [cto\_elevated\_security\_operations\_group](#input\_cto\_elevated\_security\_operations\_group) | Google Workspace or Cloud Identity group responsible for security operations. | `string` | n/a | yes |
| <a name="input_cto_operations_group"></a> [cto\_operations\_group](#input\_cto\_operations\_group) | Google Workspace or Cloud Identity group responsible for operations. | `string` | n/a | yes |
| <a name="input_cto_security_build_group"></a> [cto\_security\_build\_group](#input\_cto\_security\_build\_group) | Google Workspace or Cloud Identity group for security build group. | `string` | n/a | yes |
| <a name="input_cto_security_operations_group"></a> [cto\_security\_operations\_group](#input\_cto\_security\_operations\_group) | Google Workspace or Cloud Identity group responsible for security operations. | `string` | n/a | yes |
| <a name="input_cto_user_management_operations_group"></a> [cto\_user\_management\_operations\_group](#input\_cto\_user\_management\_operations\_group) | Google Workspace or Cloud Identity group for management operations. | `string` | n/a | yes |
| <a name="input_custom_labels"></a> [custom\_labels](#input\_custom\_labels) | Customer desigend labels for project | `map(string)` | `{}` | no |
| <a name="input_d_cloud_router_labels"></a> [d\_cloud\_router\_labels](#input\_d\_cloud\_router\_labels) | A map of suffixes for labelling vlans with four entries like "vlan\_1" => "suffix1" with keys from `vlan_1` to `vlan_4`. | `map(string)` | `{}` | no |
| <a name="input_d_enable_dedicated_interconnect"></a> [d\_enable\_dedicated\_interconnect](#input\_d\_enable\_dedicated\_interconnect) | Set the value to true if you want to create dedicated interconnect. default, false | `bool` | `false` | no |
| <a name="input_d_peer_asn"></a> [d\_peer\_asn](#input\_d\_peer\_asn) | BGP Autonomous System Number (ASN). | `string` | n/a | yes |
| <a name="input_d_region1_interconnect1_candidate_subnets"></a> [d\_region1\_interconnect1\_candidate\_subnets](#input\_d\_region1\_interconnect1\_candidate\_subnets) | Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc). | `list(string)` | `null` | no |
| <a name="input_d_region1_interconnect1_location"></a> [d\_region1\_interconnect1\_location](#input\_d\_region1\_interconnect1\_location) | Name of the interconnect location used in the creation of the Interconnect for the first location of region1 | `string` | n/a | yes |
| <a name="input_d_region1_interconnect1_self_link"></a> [d\_region1\_interconnect1\_self\_link](#input\_d\_region1\_interconnect1\_self\_link) | URL of the underlying Interconnect object that this attachment's traffic will traverse through. | `string` | n/a | yes |
| <a name="input_d_region1_interconnect1_vlan_tag8021q"></a> [d\_region1\_interconnect1\_vlan\_tag8021q](#input\_d\_region1\_interconnect1\_vlan\_tag8021q) | The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094. | `string` | `null` | no |
| <a name="input_d_region1_interconnect2_candidate_subnets"></a> [d\_region1\_interconnect2\_candidate\_subnets](#input\_d\_region1\_interconnect2\_candidate\_subnets) | Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc). | `list(string)` | `null` | no |
| <a name="input_d_region1_interconnect2_location"></a> [d\_region1\_interconnect2\_location](#input\_d\_region1\_interconnect2\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region1 | `string` | n/a | yes |
| <a name="input_d_region1_interconnect2_self_link"></a> [d\_region1\_interconnect2\_self\_link](#input\_d\_region1\_interconnect2\_self\_link) | URL of the underlying Interconnect object that this attachment's traffic will traverse through. | `string` | n/a | yes |
| <a name="input_d_region1_interconnect2_vlan_tag8021q"></a> [d\_region1\_interconnect2\_vlan\_tag8021q](#input\_d\_region1\_interconnect2\_vlan\_tag8021q) | The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094. | `string` | `null` | no |
| <a name="input_d_region2_interconnect1_candidate_subnets"></a> [d\_region2\_interconnect1\_candidate\_subnets](#input\_d\_region2\_interconnect1\_candidate\_subnets) | Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc). | `list(string)` | `null` | no |
| <a name="input_d_region2_interconnect1_location"></a> [d\_region2\_interconnect1\_location](#input\_d\_region2\_interconnect1\_location) | Name of the interconnect location used in the creation of the Interconnect for the first location of region2 | `string` | n/a | yes |
| <a name="input_d_region2_interconnect1_self_link"></a> [d\_region2\_interconnect1\_self\_link](#input\_d\_region2\_interconnect1\_self\_link) | URL of the underlying Interconnect object that this attachment's traffic will traverse through. | `string` | n/a | yes |
| <a name="input_d_region2_interconnect1_vlan_tag8021q"></a> [d\_region2\_interconnect1\_vlan\_tag8021q](#input\_d\_region2\_interconnect1\_vlan\_tag8021q) | The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094. | `string` | `null` | no |
| <a name="input_d_region2_interconnect2_candidate_subnets"></a> [d\_region2\_interconnect2\_candidate\_subnets](#input\_d\_region2\_interconnect2\_candidate\_subnets) | Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc). | `list(string)` | `null` | no |
| <a name="input_d_region2_interconnect2_location"></a> [d\_region2\_interconnect2\_location](#input\_d\_region2\_interconnect2\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region2 | `string` | n/a | yes |
| <a name="input_d_region2_interconnect2_self_link"></a> [d\_region2\_interconnect2\_self\_link](#input\_d\_region2\_interconnect2\_self\_link) | URL of the underlying Interconnect object that this attachment's traffic will traverse through. | `string` | n/a | yes |
| <a name="input_d_region2_interconnect2_vlan_tag8021q"></a> [d\_region2\_interconnect2\_vlan\_tag8021q](#input\_d\_region2\_interconnect2\_vlan\_tag8021q) | The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094. | `string` | `null` | no |
| <a name="input_default_region"></a> [default\_region](#input\_default\_region) | Default region to create resources where applicable. | `string` | `"us-central1"` | no |
| <a name="input_default_region2"></a> [default\_region2](#input\_default\_region2) | Second subnet region for DNS Hub network. | `string` | n/a | yes |
| <a name="input_dev_environment_code"></a> [dev\_environment\_code](#input\_dev\_environment\_code) | Environment code used in 2-envs and 3-networks stages | `string` | n/a | yes |
| <a name="input_development_folder"></a> [development\_folder](#input\_development\_folder) | development environment folder name | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | The DNS name of peering managed zone, for instance 'example.com.'. Must end with a period. | `string` | n/a | yes |
| <a name="input_domains_to_allow"></a> [domains\_to\_allow](#input\_domains\_to\_allow) | The list of domains to allow users from in IAM. Used by Domain Restricted Sharing Organization Policy. Must include the domain of the organization you are deploying the foundation. To add other domains you must also grant access to these domains to the terraform service account used in the deploy. | `list(any)` | n/a | yes |
| <a name="input_egress_ranges_firewall"></a> [egress\_ranges\_firewall](#input\_egress\_ranges\_firewall) | Destination IP address range in CIDR format. Required for EGRESS rules. | `list(any)` | n/a | yes |
| <a name="input_enable_env_log_sink"></a> [enable\_env\_log\_sink](#input\_enable\_env\_log\_sink) | Enable environment log sink. | `bool` | `false` | no |
| <a name="input_enable_hub_and_spoke"></a> [enable\_hub\_and\_spoke](#input\_enable\_hub\_and\_spoke) | Enable Hub-and-Spoke architecture. | `bool` | n/a | yes |
| <a name="input_enable_hub_and_spoke_transitivity"></a> [enable\_hub\_and\_spoke\_transitivity](#input\_enable\_hub\_and\_spoke\_transitivity) | Enable transitivity via gateway VMs on Hub-and-Spoke architecture. | `bool` | `false` | no |
| <a name="input_enable_interconnect_projects"></a> [enable\_interconnect\_projects](#input\_enable\_interconnect\_projects) | Create interconnect projects | `bool` | `false` | no |
| <a name="input_enable_restricted_network"></a> [enable\_restricted\_network](#input\_enable\_restricted\_network) | Enable restricted network | `bool` | `false` | no |
| <a name="input_encrypt_gcs_bucket_tfstate"></a> [encrypt\_gcs\_bucket\_tfstate](#input\_encrypt\_gcs\_bucket\_tfstate) | Encrypt bucket used for storing terraform state files in seed project. | `bool` | `false` | no |
| <a name="input_firewall_name"></a> [firewall\_name](#input\_firewall\_name) | name of firewall | `string` | `"firewall"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of a folder to host this project | `string` | `""` | no |
| <a name="input_folder_prefix"></a> [folder\_prefix](#input\_folder\_prefix) | Name prefix to use for folders created. Should be the same in all steps. | `string` | `"fldr"` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | If supplied, the state bucket will be deleted even while containing objects. | `bool` | `false` | no |
| <a name="input_gar_repo_name"></a> [gar\_repo\_name](#input\_gar\_repo\_name) | GCP Artifact Registry Name to store container image for Cloud Build builder. | `string` | n/a | yes |
| <a name="input_gh_token"></a> [gh\_token](#input\_gh\_token) | Github token that is used for generating Self Hosted Runner Token | `string` | `"default-runner-token"` | no |
| <a name="input_git_pvt_key_scrt_name"></a> [git\_pvt\_key\_scrt\_name](#input\_git\_pvt\_key\_scrt\_name) | The name / secret id which holds the private key for the deploy keys added to the Github repo. | `string` | `"git-gcplz-ssh-pvt"` | no |
| <a name="input_grant_billing_user"></a> [grant\_billing\_user](#input\_grant\_billing\_user) | Grant roles/billing.user role to CFT service account | `bool` | `true` | no |
| <a name="input_group_billing_admins"></a> [group\_billing\_admins](#input\_group\_billing\_admins) | Google Group for GCP Billing Administrators | `string` | n/a | yes |
| <a name="input_group_org_admins"></a> [group\_org\_admins](#input\_group\_org\_admins) | Google Group for GCP Organization Administrators | `string` | n/a | yes |
| <a name="input_image_fw"></a> [image\_fw](#input\_image\_fw) | image from marketplace to pick for firewall server deployment | `string` | `"https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/vmseries-bundle1-810"` | no |
| <a name="input_image_web"></a> [image\_web](#input\_image\_web) | upstream webserver image type for testing, this is optional | `string` | `"debian-8"` | no |
| <a name="input_ingress_ranges_firewall"></a> [ingress\_ranges\_firewall](#input\_ingress\_ranges\_firewall) | Source IP address range in CIDR format. Required for INGRESS rules. | `list(any)` | n/a | yes |
| <a name="input_interconnect-firewall"></a> [interconnect-firewall](#input\_interconnect-firewall) | interconnect-firewall | `bool` | `false` | no |
| <a name="input_interface_0_name"></a> [interface\_0\_name](#input\_interface\_0\_name) | interface name for management server | `string` | `"management"` | no |
| <a name="input_interface_1_name"></a> [interface\_1\_name](#input\_interface\_1\_name) | interface name for untrust server | `string` | `"untrust"` | no |
| <a name="input_interface_2_name"></a> [interface\_2\_name](#input\_interface\_2\_name) | interface name for trust server | `string` | `"trust"` | no |
| <a name="input_key_protection_level"></a> [key\_protection\_level](#input\_key\_protection\_level) | The protection level to use when creating a version based on this template. | `string` | `"SOFTWARE"` | no |
| <a name="input_key_rotation_period"></a> [key\_rotation\_period](#input\_key\_rotation\_period) | n/a | `string` | `null` | no |
| <a name="input_kms_prevent_destroy"></a> [kms\_prevent\_destroy](#input\_kms\_prevent\_destroy) | Set the prevent\_destroy lifecycle attribute on keys. | `bool` | `true` | no |
| <a name="input_log_sink_prefix"></a> [log\_sink\_prefix](#input\_log\_sink\_prefix) | Add log sink prefix example, snk. | `string` | n/a | yes |
| <a name="input_machine_cpu_fw"></a> [machine\_cpu\_fw](#input\_machine\_cpu\_fw) | cpu processor type for firewall server deployment | `string` | `"Intel Skylake"` | no |
| <a name="input_machine_type_fw"></a> [machine\_type\_fw](#input\_machine\_type\_fw) | machine size for firewall server deployment | `string` | `"n1-standard-4"` | no |
| <a name="input_machine_type_web"></a> [machine\_type\_web](#input\_machine\_type\_web) | upstream webserver type for testing, this is optional. | `string` | `"f1-micro"` | no |
| <a name="input_management-sub-ip_cidr_range"></a> [management-sub-ip\_cidr\_range](#input\_management-sub-ip\_cidr\_range) | IP ranges for management subnet, this subnet will be used for managing state between firewall servers. | `string` | `"10.0.0.0/24"` | no |
| <a name="input_monitoring_workspace_users"></a> [monitoring\_workspace\_users](#input\_monitoring\_workspace\_users) | Google Workspace or Cloud Identity group that have access to Monitoring Workspaces. | `string` | n/a | yes |
| <a name="input_num_instances"></a> [num\_instances](#input\_num\_instances) | Number of compute instances to be spinned up as Github Self hosted runners. | `number` | n/a | yes |
| <a name="input_org_admins_org_iam_permissions"></a> [org\_admins\_org\_iam\_permissions](#input\_org\_admins\_org\_iam\_permissions) | List of permissions granted to the group supplied in group\_org\_admins variable across the GCP organization. | `list(string)` | `[]` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | GCP Organization ID | `string` | n/a | yes |
| <a name="input_org_policy_admin_role"></a> [org\_policy\_admin\_role](#input\_org\_policy\_admin\_role) | Additional Org Policy Admin role for admin group. You can use this for testing purposes. | `bool` | `false` | no |
| <a name="input_org_project_creators"></a> [org\_project\_creators](#input\_org\_project\_creators) | Additional list of members to have project creator role across the organization. Prefix of group: user: or serviceAccount: is required. | `list(string)` | `[]` | no |
| <a name="input_p_r_cloud_router_labels"></a> [p\_r\_cloud\_router\_labels](#input\_p\_r\_cloud\_router\_labels) | A map of suffixes for labelling vlans with four entries like "vlan\_1" => "suffix1" with keys from `vlan_1` to `vlan_4`. | `map(string)` | `{}` | no |
| <a name="input_p_r_preactivate_partner_interconnect"></a> [p\_r\_preactivate\_partner\_interconnect](#input\_p\_r\_preactivate\_partner\_interconnect) | Preactivate Partner Interconnect VLAN attachment in the environment. | `bool` | `false` | no |
| <a name="input_p_r_region1_interconnect1_location"></a> [p\_r\_region1\_interconnect1\_location](#input\_p\_r\_region1\_interconnect1\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region1 | `string` | n/a | yes |
| <a name="input_p_r_region1_interconnect2_location"></a> [p\_r\_region1\_interconnect2\_location](#input\_p\_r\_region1\_interconnect2\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region1 | `string` | n/a | yes |
| <a name="input_p_r_region2_interconnect1_location"></a> [p\_r\_region2\_interconnect1\_location](#input\_p\_r\_region2\_interconnect1\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region2 | `string` | n/a | yes |
| <a name="input_p_r_region2_interconnect2_location"></a> [p\_r\_region2\_interconnect2\_location](#input\_p\_r\_region2\_interconnect2\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region2 | `string` | n/a | yes |
| <a name="input_p_s_cloud_router_labels"></a> [p\_s\_cloud\_router\_labels](#input\_p\_s\_cloud\_router\_labels) | A map of suffixes for labelling vlans with four entries like "vlan\_1" => "suffix1" with keys from `vlan_1` to `vlan_4`. | `map(string)` | `{}` | no |
| <a name="input_p_s_preactivate_partner_interconnect"></a> [p\_s\_preactivate\_partner\_interconnect](#input\_p\_s\_preactivate\_partner\_interconnect) | Preactivate Partner Interconnect VLAN attachment in the environment. | `bool` | `false` | no |
| <a name="input_p_s_region1_interconnect1_location"></a> [p\_s\_region1\_interconnect1\_location](#input\_p\_s\_region1\_interconnect1\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region1 | `string` | n/a | yes |
| <a name="input_p_s_region1_interconnect2_location"></a> [p\_s\_region1\_interconnect2\_location](#input\_p\_s\_region1\_interconnect2\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region1 | `string` | n/a | yes |
| <a name="input_p_s_region2_interconnect1_location"></a> [p\_s\_region2\_interconnect1\_location](#input\_p\_s\_region2\_interconnect1\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region1 | `string` | n/a | yes |
| <a name="input_p_s_region2_interconnect2_location"></a> [p\_s\_region2\_interconnect2\_location](#input\_p\_s\_region2\_interconnect2\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region1 | `string` | n/a | yes |
| <a name="input_parent_folder"></a> [parent\_folder](#input\_parent\_folder) | Optional - for an organization with existing projects or for development/validation. It will place all the example foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist. | `string` | `""` | no |
| <a name="input_primary_contact"></a> [primary\_contact](#input\_primary\_contact) | Email of primary contact | `string` | n/a | yes |
| <a name="input_prod_environment_code"></a> [prod\_environment\_code](#input\_prod\_environment\_code) | Environment code used in 2-envs and 3-networks stages | `string` | n/a | yes |
| <a name="input_production_folder"></a> [production\_folder](#input\_production\_folder) | production environment folder name | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Custom project ID to use for project created. If not supplied, the default id is {project\_prefix}-seed-{random suffix}. | `string` | `""` | no |
| <a name="input_project_labels"></a> [project\_labels](#input\_project\_labels) | Labels to apply to the project. | `map(string)` | `{}` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project Name | `string` | `""` | no |
| <a name="input_project_prefix"></a> [project\_prefix](#input\_project\_prefix) | Name prefix to use for projects created. Should be the same in all steps. Max size is 3 characters. | `string` | `"prj"` | no |
| <a name="input_random_suffix"></a> [random\_suffix](#input\_random\_suffix) | Appends a 4 character random suffix to project ID and GCS bucket name. | `bool` | `true` | no |
| <a name="input_region_zone"></a> [region\_zone](#input\_region\_zone) | region NGFW HA servers to deploy in | `string` | `"us-west1-a"` | no |
| <a name="input_rest_vpc_firewall_egress_dest_ranges"></a> [rest\_vpc\_firewall\_egress\_dest\_ranges](#input\_rest\_vpc\_firewall\_egress\_dest\_ranges) | Used in shared vpc firewall egress destination ranges | `list(any)` | n/a | yes |
| <a name="input_rest_vpc_firewall_ingress_src_ranges"></a> [rest\_vpc\_firewall\_ingress\_src\_ranges](#input\_rest\_vpc\_firewall\_ingress\_src\_ranges) | Used in shared vpc firewall ingress source ranges | `list(any)` | n/a | yes |
| <a name="input_rest_vpc_global_address_private"></a> [rest\_vpc\_global\_address\_private](#input\_rest\_vpc\_global\_address\_private) | IP address range supplied as an input to reserve a specific address in a network - Internal | `map(any)` | <pre>{<br>  "d": "10.24.64.0/21",<br>  "p": "10.24.192.0/21",<br>  "s": "10.24.128.0/21"<br>}</pre> | no |
| <a name="input_rest_vpc_private_subnet_default_region"></a> [rest\_vpc\_private\_subnet\_default\_region](#input\_rest\_vpc\_private\_subnet\_default\_region) | Subnet range for creating subnet for a region, this variable is used in google network module, subnets | `map(any)` | <pre>{<br>  "d": "10.8.64.0/21",<br>  "p": "10.8.192.0/21",<br>  "s": "10.8.128.0/21"<br>}</pre> | no |
| <a name="input_rest_vpc_private_subnet_default_region2"></a> [rest\_vpc\_private\_subnet\_default\_region2](#input\_rest\_vpc\_private\_subnet\_default\_region2) | Subnet range for creating subnet in default region2, this variable is used in google network module, subnets | `map(any)` | <pre>{<br>  "d": "10.9.64.0/21",<br>  "p": "10.9.192.0/21",<br>  "s": "10.9.128.0/21"<br>}</pre> | no |
| <a name="input_rest_vpc_subnet_secondary_ip_range_gke_pod"></a> [rest\_vpc\_subnet\_secondary\_ip\_range\_gke\_pod](#input\_rest\_vpc\_subnet\_secondary\_ip\_range\_gke\_pod) | Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module | `map(any)` | <pre>{<br>  "d": "100.72.64.0/21",<br>  "p": "100.72.192.0/21",<br>  "s": "100.72.128.0/21"<br>}</pre> | no |
| <a name="input_rest_vpc_subnet_secondary_ip_range_gke_svc"></a> [rest\_vpc\_subnet\_secondary\_ip\_range\_gke\_svc](#input\_rest\_vpc\_subnet\_secondary\_ip\_range\_gke\_svc) | Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module | `map(any)` | <pre>{<br>  "d": "100.72.72.0/21",<br>  "p": "100.72.200.0/21",<br>  "s": "100.72.136.0/21"<br>}</pre> | no |
| <a name="input_restricted_enable_partner_interconnect"></a> [restricted\_enable\_partner\_interconnect](#input\_restricted\_enable\_partner\_interconnect) | Set the value to true if you want to create  restricted partner interconnect. default, false | `bool` | `false` | no |
| <a name="input_runner_machine_type"></a> [runner\_machine\_type](#input\_runner\_machine\_type) | Machine type for Github Self hosted runners. | `string` | `"n1-standard-1"` | no |
| <a name="input_runner_repo_name"></a> [runner\_repo\_name](#input\_runner\_repo\_name) | Name of the repo for the Github Action | `string` | n/a | yes |
| <a name="input_runner_repo_owner"></a> [runner\_repo\_owner](#input\_runner\_repo\_owner) | Owner of the repo for the Github Action | `string` | n/a | yes |
| <a name="input_runner_subnet_ip"></a> [runner\_subnet\_ip](#input\_runner\_subnet\_ip) | The subnet range in which the runner instances will be built. For e.g. 192.168.168.0/24 | `string` | n/a | yes |
| <a name="input_sa_enable_impersonation"></a> [sa\_enable\_impersonation](#input\_sa\_enable\_impersonation) | Allow org\_admins group to impersonate service account & enable APIs required. | `bool` | `false` | no |
| <a name="input_sa_org_cb_iam_permissions"></a> [sa\_org\_cb\_iam\_permissions](#input\_sa\_org\_cb\_iam\_permissions) | List of permissions granted to Cloudbuild service account from CICD project across the organization. | `list(string)` | <pre>[<br>  "roles/iam.serviceAccountTokenCreator",<br>  "roles/iam.serviceAccountUser",<br>  "roles/cloudkms.viewer",<br>  "roles/iam.securityReviewer"<br>]</pre> | no |
| <a name="input_sa_org_iam_permissions"></a> [sa\_org\_iam\_permissions](#input\_sa\_org\_iam\_permissions) | List of permissions granted to Terraform service account across the GCP organization. | `list(string)` | <pre>[<br>  "roles/billing.user",<br>  "roles/compute.networkAdmin",<br>  "roles/compute.xpnAdmin",<br>  "roles/iam.securityAdmin",<br>  "roles/iam.serviceAccountAdmin",<br>  "roles/logging.configWriter",<br>  "roles/orgpolicy.policyAdmin",<br>  "roles/resourcemanager.folderAdmin",<br>  "roles/resourcemanager.organizationViewer"<br>]</pre> | no |
| <a name="input_sa_prj_cb_iam_permissions"></a> [sa\_prj\_cb\_iam\_permissions](#input\_sa\_prj\_cb\_iam\_permissions) | List of permissions granted to Cloudbuild service account from CICD project across the CICD Project. | `list(string)` | <pre>[<br>  "roles/secretmanager.secretAccessor",<br>  "roles/secretmanager.secretVersionManager",<br>  "roles/compute.instanceAdmin.v1",<br>  "roles/compute.instanceAdmin",<br>  "roles/iam.serviceAccountTokenCreator",<br>  "roles/iam.serviceAccountUser",<br>  "roles/secretmanager.viewer"<br>]</pre> | no |
| <a name="input_sa_prj_rnr_iam_permissions"></a> [sa\_prj\_rnr\_iam\_permissions](#input\_sa\_prj\_rnr\_iam\_permissions) | List of permissions granted to Runner service account across the CICD Project. | `list(string)` | <pre>[<br>  "roles/cloudbuild.builds.builder",<br>  "roles/secretmanager.secretAccessor",<br>  "roles/cloudbuild.builds.editor",<br>  "roles/iam.serviceAccountUser",<br>  "roles/viewer"<br>]</pre> | no |
| <a name="input_scopes_fw"></a> [scopes\_fw](#input\_scopes\_fw) | scopes attached to server VMS. | `list(string)` | <pre>[<br>  "https://www.googleapis.com/auth/cloud.useraccounts.readonly",<br>  "https://www.googleapis.com/auth/devstorage.read_only",<br>  "https://www.googleapis.com/auth/logging.write",<br>  "https://www.googleapis.com/auth/monitoring.write",<br>  "https://www.googleapis.com/auth/compute"<br>]</pre> | no |
| <a name="input_scopes_web"></a> [scopes\_web](#input\_scopes\_web) | scopes attached to web-server VMS, this is optional | `list(string)` | <pre>[<br>  "https://www.googleapis.com/auth/cloud.useraccounts.readonly",<br>  "https://www.googleapis.com/auth/devstorage.read_only",<br>  "https://www.googleapis.com/auth/logging.write",<br>  "https://www.googleapis.com/auth/monitoring.write",<br>  "https://www.googleapis.com/auth/compute.readonly"<br>]</pre> | no |
| <a name="input_secondary_contact"></a> [secondary\_contact](#input\_secondary\_contact) | Email of secondary contact | `string` | n/a | yes |
| <a name="input_shared_enable_partner_interconnect"></a> [shared\_enable\_partner\_interconnect](#input\_shared\_enable\_partner\_interconnect) | Set the value to true if you want to create  shared partner interconnect. default, false | `bool` | `false` | no |
| <a name="input_shared_env"></a> [shared\_env](#input\_shared\_env) | Environment code used in 2-envs and 3-networks stages | `string` | n/a | yes |
| <a name="input_shared_environment_code"></a> [shared\_environment\_code](#input\_shared\_environment\_code) | Environment code used in 1-org, 2-envs and 3-networks stages | `string` | n/a | yes |
| <a name="input_source_image_family"></a> [source\_image\_family](#input\_source\_image\_family) | Source Image family of the image from which to initialize the disk. for e.g. ubuntu-2004-lts | `string` | `"ubuntu-2004-lts"` | no |
| <a name="input_source_image_project"></a> [source\_image\_project](#input\_source\_image\_project) | The Project for Source Image. for e.g. ubuntu-os-cloud | `string` | `"ubuntu-os-cloud"` | no |
| <a name="input_staging_environment_code"></a> [staging\_environment\_code](#input\_staging\_environment\_code) | Environment code used in 2-envs and 3-networks stages | `string` | n/a | yes |
| <a name="input_staging_folder"></a> [staging\_folder](#input\_staging\_folder) | staging environment folder name | `string` | n/a | yes |
| <a name="input_state_bucket_name"></a> [state\_bucket\_name](#input\_state\_bucket\_name) | Custom state bucket name. If not supplied, the default name is {project\_prefix}-tfstate-{random suffix}. | `string` | `""` | no |
| <a name="input_storage_bucket_labels"></a> [storage\_bucket\_labels](#input\_storage\_bucket\_labels) | Labels to apply to the storage bucket. | `map(string)` | `{}` | no |
| <a name="input_subnet_ip_cidr_range_region1"></a> [subnet\_ip\_cidr\_range\_region1](#input\_subnet\_ip\_cidr\_range\_region1) | The range of internal addresses that are owned by this subnetwork. Only IPv4 is supported | `string` | n/a | yes |
| <a name="input_subnet_ip_cidr_range_region2"></a> [subnet\_ip\_cidr\_range\_region2](#input\_subnet\_ip\_cidr\_range\_region2) | The range of internal addresses that are owned by this subnetwork. Only IPv4 is supported | `string` | n/a | yes |
| <a name="input_target_name_server_addresses"></a> [target\_name\_server\_addresses](#input\_target\_name\_server\_addresses) | List of IPv4 address of target name servers for the forwarding zone configuration. See https://cloud.google.com/dns/docs/overview#dns-forwarding-zones for details on target name servers in the context of Cloud DNS forwarding zones. | `list(string)` | n/a | yes |
| <a name="input_tf_service_account_id"></a> [tf\_service\_account\_id](#input\_tf\_service\_account\_id) | ID of service account for terraform in seed project | `string` | `"org-terraform"` | no |
| <a name="input_tf_service_account_name"></a> [tf\_service\_account\_name](#input\_tf\_service\_account\_name) | Display name of service account for terraform in seed project | `string` | `"CFT Organization Terraform Account"` | no |
| <a name="input_trust-dest_range"></a> [trust-dest\_range](#input\_trust-dest\_range) | destination firewall rule for trusted network | `string` | `"0.0.0.0/0"` | no |
| <a name="input_trust-sub-ip_cidr_range"></a> [trust-sub-ip\_cidr\_range](#input\_trust-sub-ip\_cidr\_range) | IP ranges for trusted subnet, this subnet will be used for trusted traffic traffic for upstream services. | `string` | `"10.0.2.0/24"` | no |
| <a name="input_untrust-sub-ip_cidr_range"></a> [untrust-sub-ip\_cidr\_range](#input\_untrust-sub-ip\_cidr\_range) | IP ranges for untrusted subnet, this subnet will be used for incoming untrusted traffic. | `string` | `"10.0.1.0/24"` | no |
| <a name="input_vpc_prefix"></a> [vpc\_prefix](#input\_vpc\_prefix) | VPC prefix used to create the vpc | `string` | n/a | yes |
| <a name="input_web_server_name"></a> [web\_server\_name](#input\_web\_server\_name) | upstream webserver name for testing, this is optional. | `string` | `"webserver"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | region NGFW HA servers to deploy in | `string` | `"us-west1-a"` | no |
| <a name="input_zone_2"></a> [zone\_2](#input\_zone\_2) | region NGFW HA servers to deploy in | `string` | `"us-west1-b"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_allow-inbound-source-ranges"></a> [allow-inbound-source-ranges](#output\_allow-inbound-source-ranges) | Ingress firewall rule for untrusted network |
| <a name="output_allow-mgmt-source-ranges"></a> [allow-mgmt-source-ranges](#output\_allow-mgmt-source-ranges) | Firewall rule for management network. |
| <a name="output_allow-outbound-source-ranges"></a> [allow-outbound-source-ranges](#output\_allow-outbound-source-ranges) | egress firewall rule for untrusted network |
| <a name="output_base_vpc_firewall_egress_dest_ranges"></a> [base\_vpc\_firewall\_egress\_dest\_ranges](#output\_base\_vpc\_firewall\_egress\_dest\_ranges) | Used in shared vpc firewall egress destination ranges. |
| <a name="output_base_vpc_firewall_ingress_src_ranges"></a> [base\_vpc\_firewall\_ingress\_src\_ranges](#output\_base\_vpc\_firewall\_ingress\_src\_ranges) | Used in shared vpc firewall ingress source ranges. |
| <a name="output_base_vpc_global_address_private"></a> [base\_vpc\_global\_address\_private](#output\_base\_vpc\_global\_address\_private) | IP address range supplied as an input to reserve a specific address in a network - Internal. |
| <a name="output_base_vpc_private_subnet_default_region"></a> [base\_vpc\_private\_subnet\_default\_region](#output\_base\_vpc\_private\_subnet\_default\_region) | Subnet range for creating subnet for a region, this variable is used in google network module, subnets. |
| <a name="output_base_vpc_private_subnet_default_region2"></a> [base\_vpc\_private\_subnet\_default\_region2](#output\_base\_vpc\_private\_subnet\_default\_region2) | Subnet range for creating subnet for a region2, this variable is used in google network module, subnets. |
| <a name="output_base_vpc_subnet_secondary_ip_range_gke_pod"></a> [base\_vpc\_subnet\_secondary\_ip\_range\_gke\_pod](#output\_base\_vpc\_subnet\_secondary\_ip\_range\_gke\_pod) | Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module. |
| <a name="output_base_vpc_subnet_secondary_ip_range_gke_svc"></a> [base\_vpc\_subnet\_secondary\_ip\_range\_gke\_svc](#output\_base\_vpc\_subnet\_secondary\_ip\_range\_gke\_svc) | Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module. |
| <a name="output_billing_account"></a> [billing\_account](#output\_billing\_account) | Billing account ID details. |
| <a name="output_billing_data_users"></a> [billing\_data\_users](#output\_billing\_data\_users) | Google Workspace or Cloud Identity group that have access to billing data set. |
| <a name="output_bootstrap_bucket_fw"></a> [bootstrap\_bucket\_fw](#output\_bootstrap\_bucket\_fw) | gcp bucket for bootstrap script which will be used to bootstrap the firewall. |
| <a name="output_bootstrap_folder"></a> [bootstrap\_folder](#output\_bootstrap\_folder) | Environment name used for bootstrap stage. |
| <a name="output_bucket_prefix"></a> [bucket\_prefix](#output\_bucket\_prefix) | Bucket prefix used by Cloud Storage buckets. |
| <a name="output_cfo"></a> [cfo](#output\_cfo) | Google Workspace or Cloud Identity group responsible for security operations. |
| <a name="output_cloudbuild_project_id"></a> [cloudbuild\_project\_id](#output\_cloudbuild\_project\_id) | Project where CloudBuild configuration and terraform container image will reside. |
| <a name="output_csr_repos"></a> [csr\_repos](#output\_csr\_repos) | List of Cloud Source Repos created by the module, linked to Cloud Build triggers. |
| <a name="output_cto_audit_compliance_operations_group"></a> [cto\_audit\_compliance\_operations\_group](#output\_cto\_audit\_compliance\_operations\_group) | Google Workspace or Cloud Identity group responsible for security operations. |
| <a name="output_cto_build_group"></a> [cto\_build\_group](#output\_cto\_build\_group) | Google Workspace or Cloud Identity group responsible for security operations. |
| <a name="output_cto_core_networking_build_group"></a> [cto\_core\_networking\_build\_group](#output\_cto\_core\_networking\_build\_group) | Google Workspace or Cloud Identity group responsible for security operations. |
| <a name="output_cto_core_networking_operations_group"></a> [cto\_core\_networking\_operations\_group](#output\_cto\_core\_networking\_operations\_group) | Google Workspace or Cloud Identity group responsible for security operations. |
| <a name="output_cto_elevated_security_build_group"></a> [cto\_elevated\_security\_build\_group](#output\_cto\_elevated\_security\_build\_group) | Google Workspace or Cloud Identity group responsible for security operations. |
| <a name="output_cto_elevated_security_operations_group"></a> [cto\_elevated\_security\_operations\_group](#output\_cto\_elevated\_security\_operations\_group) | Google Workspace or Cloud Identity group responsible for security operations. |
| <a name="output_cto_operations_group"></a> [cto\_operations\_group](#output\_cto\_operations\_group) | Google Workspace or Cloud Identity group responsible for security operations. |
| <a name="output_cto_security_build_group"></a> [cto\_security\_build\_group](#output\_cto\_security\_build\_group) | Google Workspace or Cloud Identity group responsible for security operations. |
| <a name="output_cto_security_operations_group"></a> [cto\_security\_operations\_group](#output\_cto\_security\_operations\_group) | Google Workspace or Cloud Identity group responsible for security operations. |
| <a name="output_cto_user_management_operations_group"></a> [cto\_user\_management\_operations\_group](#output\_cto\_user\_management\_operations\_group) | Google Workspace or Cloud Identity group responsible for security operations. |
| <a name="output_custom_labels"></a> [custom\_labels](#output\_custom\_labels) | Customer desigend labels for project |
| <a name="output_d_cloud_router_labels"></a> [d\_cloud\_router\_labels](#output\_d\_cloud\_router\_labels) | A map of suffixes for labelling vlans with four entries like "vlan\_1" => "suffix1" with keys from `vlan_1` to `vlan_4`. |
| <a name="output_d_enable_dedicated_interconnect"></a> [d\_enable\_dedicated\_interconnect](#output\_d\_enable\_dedicated\_interconnect) | Set the value to true if you want to create dedicated interconnect. default, false |
| <a name="output_d_peer_asn"></a> [d\_peer\_asn](#output\_d\_peer\_asn) | BGP Autonomous System Number (ASN). |
| <a name="output_d_region1_interconnect1_candidate_subnets"></a> [d\_region1\_interconnect1\_candidate\_subnets](#output\_d\_region1\_interconnect1\_candidate\_subnets) | Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc). |
| <a name="output_d_region1_interconnect1_location"></a> [d\_region1\_interconnect1\_location](#output\_d\_region1\_interconnect1\_location) | Name of the interconnect location used in the creation of the Interconnect for the first location of region1 |
| <a name="output_d_region1_interconnect1_self_link"></a> [d\_region1\_interconnect1\_self\_link](#output\_d\_region1\_interconnect1\_self\_link) | URL of the underlying Interconnect object that this attachment's traffic will traverse through. |
| <a name="output_d_region1_interconnect1_vlan_tag8021q"></a> [d\_region1\_interconnect1\_vlan\_tag8021q](#output\_d\_region1\_interconnect1\_vlan\_tag8021q) | The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094. |
| <a name="output_d_region1_interconnect2_candidate_subnets"></a> [d\_region1\_interconnect2\_candidate\_subnets](#output\_d\_region1\_interconnect2\_candidate\_subnets) | Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc). |
| <a name="output_d_region1_interconnect2_location"></a> [d\_region1\_interconnect2\_location](#output\_d\_region1\_interconnect2\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region1 |
| <a name="output_d_region1_interconnect2_self_link"></a> [d\_region1\_interconnect2\_self\_link](#output\_d\_region1\_interconnect2\_self\_link) | URL of the underlying Interconnect object that this attachment's traffic will traverse through. |
| <a name="output_d_region1_interconnect2_vlan_tag8021q"></a> [d\_region1\_interconnect2\_vlan\_tag8021q](#output\_d\_region1\_interconnect2\_vlan\_tag8021q) | The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094. |
| <a name="output_d_region2_interconnect1_candidate_subnets"></a> [d\_region2\_interconnect1\_candidate\_subnets](#output\_d\_region2\_interconnect1\_candidate\_subnets) | Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc). |
| <a name="output_d_region2_interconnect1_location"></a> [d\_region2\_interconnect1\_location](#output\_d\_region2\_interconnect1\_location) | Name of the interconnect location used in the creation of the Interconnect for the first location of region2 |
| <a name="output_d_region2_interconnect1_self_link"></a> [d\_region2\_interconnect1\_self\_link](#output\_d\_region2\_interconnect1\_self\_link) | URL of the underlying Interconnect object that this attachment's traffic will traverse through. |
| <a name="output_d_region2_interconnect1_vlan_tag8021q"></a> [d\_region2\_interconnect1\_vlan\_tag8021q](#output\_d\_region2\_interconnect1\_vlan\_tag8021q) | The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094. |
| <a name="output_d_region2_interconnect2_candidate_subnets"></a> [d\_region2\_interconnect2\_candidate\_subnets](#output\_d\_region2\_interconnect2\_candidate\_subnets) | Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc). |
| <a name="output_d_region2_interconnect2_location"></a> [d\_region2\_interconnect2\_location](#output\_d\_region2\_interconnect2\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region2 |
| <a name="output_d_region2_interconnect2_self_link"></a> [d\_region2\_interconnect2\_self\_link](#output\_d\_region2\_interconnect2\_self\_link) | URL of the underlying Interconnect object that this attachment's traffic will traverse through. |
| <a name="output_d_region2_interconnect2_vlan_tag8021q"></a> [d\_region2\_interconnect2\_vlan\_tag8021q](#output\_d\_region2\_interconnect2\_vlan\_tag8021q) | The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094. |
| <a name="output_default_region2"></a> [default\_region2](#output\_default\_region2) | Second subnet region for DNS Hub network. |
| <a name="output_dev_environment_code"></a> [dev\_environment\_code](#output\_dev\_environment\_code) | Development environment code. |
| <a name="output_development_folder"></a> [development\_folder](#output\_development\_folder) | Development environment folder name. |
| <a name="output_domain"></a> [domain](#output\_domain) | The DNS name of peering managed zone, for instance 'example.com.'. Must end with a period. |
| <a name="output_domains_to_allow"></a> [domains\_to\_allow](#output\_domains\_to\_allow) | The list of domains to allow users from in IAM. Used by Domain Restricted Sharing Organization Policy. Must include the domain of the organization you are deploying the foundation. To add other domains you must also grant access to these domains to the terraform service account used in the deploy. |
| <a name="output_egress_ranges_firewall"></a> [egress\_ranges\_firewall](#output\_egress\_ranges\_firewall) | Destination IP address range in CIDR format. Required for EGRESS rules. |
| <a name="output_enable_env_log_sink"></a> [enable\_env\_log\_sink](#output\_enable\_env\_log\_sink) | Enable environment log sink. |
| <a name="output_enable_hub_and_spoke"></a> [enable\_hub\_and\_spoke](#output\_enable\_hub\_and\_spoke) | Enable Hub-and-Spoke architecture. |
| <a name="output_enable_hub_and_spoke_transitivity"></a> [enable\_hub\_and\_spoke\_transitivity](#output\_enable\_hub\_and\_spoke\_transitivity) | Enable transitivity via gateway VMs on Hub-and-Spoke architecture. |
| <a name="output_enable_interconnect_projects"></a> [enable\_interconnect\_projects](#output\_enable\_interconnect\_projects) | Create interconnect projects |
| <a name="output_enable_restricted_network"></a> [enable\_restricted\_network](#output\_enable\_restricted\_network) | Enable restricted network |
| <a name="output_firewall_name"></a> [firewall\_name](#output\_firewall\_name) | name of firewall. |
| <a name="output_folder_prefix"></a> [folder\_prefix](#output\_folder\_prefix) | Folder prefix used by folders. |
| <a name="output_gar_repo_name"></a> [gar\_repo\_name](#output\_gar\_repo\_name) | Github Repo name. |
| <a name="output_gcp_region"></a> [gcp\_region](#output\_gcp\_region) | Default GCP region. |
| <a name="output_gcs_bucket_cloudbuild_artifacts"></a> [gcs\_bucket\_cloudbuild\_artifacts](#output\_gcs\_bucket\_cloudbuild\_artifacts) | Bucket used to store Cloud/Build artifacts in CloudBuild project. |
| <a name="output_gcs_bucket_tfstate"></a> [gcs\_bucket\_tfstate](#output\_gcs\_bucket\_tfstate) | Bucket used for storing terraform state for foundations pipelines in seed project. |
| <a name="output_group_org_admins"></a> [group\_org\_admins](#output\_group\_org\_admins) | Google Group for GCP Organization Administrators. |
| <a name="output_image_fw"></a> [image\_fw](#output\_image\_fw) | image from marketplace to pick for firewall server deployment |
| <a name="output_image_web"></a> [image\_web](#output\_image\_web) | upstream webserver image type for testing, this is optional |
| <a name="output_ingress_ranges_firewall"></a> [ingress\_ranges\_firewall](#output\_ingress\_ranges\_firewall) | Source IP address range in CIDR format. Required for INGRESS rules. |
| <a name="output_interconnect-firewall"></a> [interconnect-firewall](#output\_interconnect-firewall) | interconnect-firewall |
| <a name="output_interface_0_name"></a> [interface\_0\_name](#output\_interface\_0\_name) | interface name for management server |
| <a name="output_interface_1_name"></a> [interface\_1\_name](#output\_interface\_1\_name) | interface name for untrust server |
| <a name="output_interface_2_name"></a> [interface\_2\_name](#output\_interface\_2\_name) | interface name for trust server |
| <a name="output_kms_crypto_key"></a> [kms\_crypto\_key](#output\_kms\_crypto\_key) | KMS key created by the module. |
| <a name="output_kms_keyring"></a> [kms\_keyring](#output\_kms\_keyring) | KMS Keyring created by the module. |
| <a name="output_log_sink_prefix"></a> [log\_sink\_prefix](#output\_log\_sink\_prefix) | Log sink prefix. |
| <a name="output_machine_cpu_fw"></a> [machine\_cpu\_fw](#output\_machine\_cpu\_fw) | cpu processor type for firewall server deployment |
| <a name="output_machine_type_fw"></a> [machine\_type\_fw](#output\_machine\_type\_fw) | machine size for firewall server deployment |
| <a name="output_machine_type_web"></a> [machine\_type\_web](#output\_machine\_type\_web) | upstream webserver type for testing, this is optional. |
| <a name="output_management-sub-ip_cidr_range"></a> [management-sub-ip\_cidr\_range](#output\_management-sub-ip\_cidr\_range) | IP ranges for management subnet, this subnet will be used for managing state between firewall servers. |
| <a name="output_monitoring_workspace_users"></a> [monitoring\_workspace\_users](#output\_monitoring\_workspace\_users) | Google Workspace or Cloud Identity group responsible for security operations. |
| <a name="output_org_id"></a> [org\_id](#output\_org\_id) | Organization Id |
| <a name="output_p_r_cloud_router_labels"></a> [p\_r\_cloud\_router\_labels](#output\_p\_r\_cloud\_router\_labels) | A map of suffixes for labelling vlans with four entries like "vlan\_1" => "suffix1" with keys from `vlan_1` to `vlan_4`. |
| <a name="output_p_r_preactivate_partner_interconnect"></a> [p\_r\_preactivate\_partner\_interconnect](#output\_p\_r\_preactivate\_partner\_interconnect) | Preactivate Partner Interconnect VLAN attachment in the environment. |
| <a name="output_p_r_region1_interconnect1_location"></a> [p\_r\_region1\_interconnect1\_location](#output\_p\_r\_region1\_interconnect1\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region1 |
| <a name="output_p_r_region1_interconnect2_location"></a> [p\_r\_region1\_interconnect2\_location](#output\_p\_r\_region1\_interconnect2\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region1 |
| <a name="output_p_r_region2_interconnect1_location"></a> [p\_r\_region2\_interconnect1\_location](#output\_p\_r\_region2\_interconnect1\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region1 |
| <a name="output_p_r_region2_interconnect2_location"></a> [p\_r\_region2\_interconnect2\_location](#output\_p\_r\_region2\_interconnect2\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region1 |
| <a name="output_p_s_cloud_router_labels"></a> [p\_s\_cloud\_router\_labels](#output\_p\_s\_cloud\_router\_labels) | A map of suffixes for labelling vlans with four entries like "vlan\_1" => "suffix1" with keys from `vlan_1` to `vlan_4`. |
| <a name="output_p_s_preactivate_partner_interconnect"></a> [p\_s\_preactivate\_partner\_interconnect](#output\_p\_s\_preactivate\_partner\_interconnect) | Preactivate Partner Interconnect VLAN attachment in the environment. |
| <a name="output_p_s_region1_interconnect1_location"></a> [p\_s\_region1\_interconnect1\_location](#output\_p\_s\_region1\_interconnect1\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region1 |
| <a name="output_p_s_region1_interconnect2_location"></a> [p\_s\_region1\_interconnect2\_location](#output\_p\_s\_region1\_interconnect2\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region1 |
| <a name="output_p_s_region2_interconnect1_location"></a> [p\_s\_region2\_interconnect1\_location](#output\_p\_s\_region2\_interconnect1\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region1 |
| <a name="output_p_s_region2_interconnect2_location"></a> [p\_s\_region2\_interconnect2\_location](#output\_p\_s\_region2\_interconnect2\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region1 |
| <a name="output_parent_folder"></a> [parent\_folder](#output\_parent\_folder) | The Parent folder ID. |
| <a name="output_primary_contact"></a> [primary\_contact](#output\_primary\_contact) | Email of primary contact. |
| <a name="output_prod_environment_code"></a> [prod\_environment\_code](#output\_prod\_environment\_code) | Projection environment code. |
| <a name="output_production_folder"></a> [production\_folder](#output\_production\_folder) | Production environment folder name. |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | Project name, example: cldcvr. |
| <a name="output_project_prefix"></a> [project\_prefix](#output\_project\_prefix) | Project prefix used by projects. |
| <a name="output_region_zone"></a> [region\_zone](#output\_region\_zone) | region NGFW HA servers to deploy in |
| <a name="output_rest_vpc_firewall_egress_dest_ranges"></a> [rest\_vpc\_firewall\_egress\_dest\_ranges](#output\_rest\_vpc\_firewall\_egress\_dest\_ranges) | Used in shared vpc firewall egress destination ranges. |
| <a name="output_rest_vpc_firewall_ingress_src_ranges"></a> [rest\_vpc\_firewall\_ingress\_src\_ranges](#output\_rest\_vpc\_firewall\_ingress\_src\_ranges) | Used in shared vpc firewall ingress source ranges. |
| <a name="output_rest_vpc_global_address_private"></a> [rest\_vpc\_global\_address\_private](#output\_rest\_vpc\_global\_address\_private) | IP address range supplied as an input to reserve a specific address in a network - Internal. |
| <a name="output_rest_vpc_private_subnet_default_region"></a> [rest\_vpc\_private\_subnet\_default\_region](#output\_rest\_vpc\_private\_subnet\_default\_region) | Subnet range for creating subnet for a region, this variable is used in google network module, subnets. |
| <a name="output_rest_vpc_private_subnet_default_region2"></a> [rest\_vpc\_private\_subnet\_default\_region2](#output\_rest\_vpc\_private\_subnet\_default\_region2) | Subnet range for creating subnet in default region2, this variable is used in google network module, subnets. |
| <a name="output_rest_vpc_subnet_secondary_ip_range_gke_pod"></a> [rest\_vpc\_subnet\_secondary\_ip\_range\_gke\_pod](#output\_rest\_vpc\_subnet\_secondary\_ip\_range\_gke\_pod) | Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module. |
| <a name="output_rest_vpc_subnet_secondary_ip_range_gke_svc"></a> [rest\_vpc\_subnet\_secondary\_ip\_range\_gke\_svc](#output\_rest\_vpc\_subnet\_secondary\_ip\_range\_gke\_svc) | Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module. |
| <a name="output_restricted_enable_partner_interconnect"></a> [restricted\_enable\_partner\_interconnect](#output\_restricted\_enable\_partner\_interconnect) | Set the value to true if you want to create  restricted partner interconnect. default, false |
| <a name="output_runner_labels"></a> [runner\_labels](#output\_runner\_labels) | Github runner labels. |
| <a name="output_runner_network_name"></a> [runner\_network\_name](#output\_runner\_network\_name) | n/a |
| <a name="output_runner_repo_name"></a> [runner\_repo\_name](#output\_runner\_repo\_name) | Name of the repo for the Github Action. |
| <a name="output_runner_repo_owner"></a> [runner\_repo\_owner](#output\_runner\_repo\_owner) | Owner of the repo for the Github Action. |
| <a name="output_scopes_fw"></a> [scopes\_fw](#output\_scopes\_fw) | scopes attached to server VMS. |
| <a name="output_scopes_web"></a> [scopes\_web](#output\_scopes\_web) | scopes attached to web-server VMS, this is optional |
| <a name="output_secondary_contact"></a> [secondary\_contact](#output\_secondary\_contact) | Email of secondary contact. |
| <a name="output_seed_project_id"></a> [seed\_project\_id](#output\_seed\_project\_id) | Project where service accounts and core APIs will be enabled. |
| <a name="output_shared_enable_partner_interconnect"></a> [shared\_enable\_partner\_interconnect](#output\_shared\_enable\_partner\_interconnect) | Set the value to true if you want to create  shared partner interconnect. default, false |
| <a name="output_shared_env"></a> [shared\_env](#output\_shared\_env) | Environment code used in 2-envs and 3-networks stages. |
| <a name="output_shared_environment_code"></a> [shared\_environment\_code](#output\_shared\_environment\_code) | Shared environment code. |
| <a name="output_staging_environment_code"></a> [staging\_environment\_code](#output\_staging\_environment\_code) | Staging environment code. |
| <a name="output_staging_folder"></a> [staging\_folder](#output\_staging\_folder) | staging environment folder name. |
| <a name="output_subnet_ip_cidr_range_region1"></a> [subnet\_ip\_cidr\_range\_region1](#output\_subnet\_ip\_cidr\_range\_region1) | The range of internal addresses that are owned by this subnetwork. Only IPv4 is supported. |
| <a name="output_subnet_ip_cidr_range_region2"></a> [subnet\_ip\_cidr\_range\_region2](#output\_subnet\_ip\_cidr\_range\_region2) | The range of internal addresses that are owned by this subnetwork. Only IPv4 is supported. |
| <a name="output_target_name_server_addresses"></a> [target\_name\_server\_addresses](#output\_target\_name\_server\_addresses) | List of IPv4 address of target name servers for the forwarding zone configuration. |
| <a name="output_terraform_sa_name"></a> [terraform\_sa\_name](#output\_terraform\_sa\_name) | Fully qualified name for privileged service account for Terraform. |
| <a name="output_terraform_service_account"></a> [terraform\_service\_account](#output\_terraform\_service\_account) | Email for privileged service account for Terraform. |
| <a name="output_terraform_validator_policies_repo"></a> [terraform\_validator\_policies\_repo](#output\_terraform\_validator\_policies\_repo) | Cloud Source Repository created for terraform-validator policies. |
| <a name="output_trust-dest_range"></a> [trust-dest\_range](#output\_trust-dest\_range) | destination firewall rule for trusted network |
| <a name="output_trust-sub-ip_cidr_range"></a> [trust-sub-ip\_cidr\_range](#output\_trust-sub-ip\_cidr\_range) | IP ranges for trusted subnet, this subnet will be used for trusted traffic traffic for upstream services |
| <a name="output_untrust-sub-ip_cidr_range"></a> [untrust-sub-ip\_cidr\_range](#output\_untrust-sub-ip\_cidr\_range) | IP ranges for untrusted subnet, this subnet will be used for incoming untrusted traffic. |
| <a name="output_vpc_prefix"></a> [vpc\_prefix](#output\_vpc\_prefix) | VPC prefix used to create the vpc. |
| <a name="output_web_server_name"></a> [web\_server\_name](#output\_web\_server\_name) | upstream webserver name for testing, this is optional. |
| <a name="output_zone"></a> [zone](#output\_zone) | region NGFW HA servers to deploy in |
| <a name="output_zone_2"></a> [zone\_2](#output\_zone\_2) | region NGFW HA servers to deploy in |

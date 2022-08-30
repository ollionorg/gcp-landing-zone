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

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 3.89.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudbuild_bootstrap"></a> [cloudbuild\_bootstrap](#module\_cloudbuild\_bootstrap) | ../modules/cloudbuild | n/a |
| <a name="module_seed_bootstrap"></a> [seed\_bootstrap](#module\_seed\_bootstrap) | ../modules/terraform-google-bootstrap | n/a |

## Resources

| Name | Type |
|------|------|
| [google_billing_account_iam_member.tf_billing_admin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_account_iam_member) | resource |
| [google_folder.bootstrap](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder_iam_member.folder_cb_sa_browser](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_iam_member) | resource |
| [google_folder_iam_member.folder_tf_compute_security_policy_admin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_iam_member) | resource |
| [google_folder_iam_member.folder_tf_compute_security_resource_admin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_iam_member) | resource |
| [google_organization_iam_member.org_cb_sa_browser](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.org_tf_compute_security_policy_admin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.org_tf_compute_security_resource_admin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_project_iam_member.project_source_reader](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_sourcerepo_repository.gcp_policies](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sourcerepo_repository) | resource |
| [google_project.cloudbuild](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | List of APIs to enable in the seed project. | `list(string)` | <pre>[<br>  "admin.googleapis.com",<br>  "appengine.googleapis.com",<br>  "bigquery.googleapis.com",<br>  "cloudbilling.googleapis.com",<br>  "cloudresourcemanager.googleapis.com",<br>  "compute.googleapis.com",<br>  "iam.googleapis.com",<br>  "logging.googleapis.com",<br>  "monitoring.googleapis.com",<br>  "servicenetworking.googleapis.com",<br>  "serviceusage.googleapis.com",<br>  "storage-api.googleapis.com"<br>]</pre> | no |
| <a name="input_audit_data_users"></a> [audit\_data\_users](#input\_audit\_data\_users) | Google Workspace or Cloud Identity group that have access to audit logs. | `string` | n/a | yes |
| <a name="input_base_vpc_firewall_egress_dest_ranges"></a> [base\_vpc\_firewall\_egress\_dest\_ranges](#input\_base\_vpc\_firewall\_egress\_dest\_ranges) | Used in shared vpc firewall egress destination ranges | `list(any)` | n/a | yes |
| <a name="input_base_vpc_firewall_ingress_src_ranges"></a> [base\_vpc\_firewall\_ingress\_src\_ranges](#input\_base\_vpc\_firewall\_ingress\_src\_ranges) | Used in shared vpc firewall ingress source ranges | `list(any)` | n/a | yes |
| <a name="input_base_vpc_global_address_private"></a> [base\_vpc\_global\_address\_private](#input\_base\_vpc\_global\_address\_private) | IP address range supplied as an input to reserve a specific address in a network - Internal | `map(any)` | <pre>{<br>  "d": "10.16.64.0/21",<br>  "n": "10.16.128.0/21",<br>  "p": "10.16.192.0/21",<br>  "s": "10.16.128.0/21"<br>}</pre> | no |
| <a name="input_base_vpc_private_subnet_default_region"></a> [base\_vpc\_private\_subnet\_default\_region](#input\_base\_vpc\_private\_subnet\_default\_region) | Subnet range for creating subnet for a region, this variable is used in google network module, subnets | `map(any)` | <pre>{<br>  "d": "10.0.64.0/21",<br>  "n": "10.0.128.0/21",<br>  "p": "10.0.192.0/21",<br>  "s": "10.0.128.0/21"<br>}</pre> | no |
| <a name="input_base_vpc_private_subnet_default_region2"></a> [base\_vpc\_private\_subnet\_default\_region2](#input\_base\_vpc\_private\_subnet\_default\_region2) | Subnet range for creating subnet in default region2, this variable is used in google network module, subnets | `map(any)` | <pre>{<br>  "d": "10.1.64.0/21",<br>  "n": "10.1.128.0/21",<br>  "p": "10.1.192.0/21",<br>  "s": "10.1.128.0/21"<br>}</pre> | no |
| <a name="input_base_vpc_subnet_secondary_ip_range_gke_pod"></a> [base\_vpc\_subnet\_secondary\_ip\_range\_gke\_pod](#input\_base\_vpc\_subnet\_secondary\_ip\_range\_gke\_pod) | Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module | `map(any)` | <pre>{<br>  "d": "100.64.64.0/21",<br>  "n": "100.64.128.0/21",<br>  "p": "100.64.192.0/21",<br>  "s": "100.64.128.0/21"<br>}</pre> | no |
| <a name="input_base_vpc_subnet_secondary_ip_range_gke_svc"></a> [base\_vpc\_subnet\_secondary\_ip\_range\_gke\_svc](#input\_base\_vpc\_subnet\_secondary\_ip\_range\_gke\_svc) | Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module | `map(any)` | <pre>{<br>  "d": "100.64.72.0/21",<br>  "n": "100.64.136.0/21",<br>  "p": "100.64.200.0/21",<br>  "s": "100.64.136.0/21"<br>}</pre> | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate projects with. | `string` | n/a | yes |
| <a name="input_billing_data_users"></a> [billing\_data\_users](#input\_billing\_data\_users) | Google Workspace or Cloud Identity group that have access to billing data set. | `string` | n/a | yes |
| <a name="input_bootstrap_env_code"></a> [bootstrap\_env\_code](#input\_bootstrap\_env\_code) | Environment code used for bootstrap stage | `string` | n/a | yes |
| <a name="input_bootstrap_environment_name"></a> [bootstrap\_environment\_name](#input\_bootstrap\_environment\_name) | Environment name used for bootstrap stage | `string` | n/a | yes |
| <a name="input_bucket_prefix"></a> [bucket\_prefix](#input\_bucket\_prefix) | Name prefix to use for state bucket created. | `string` | `"bkt"` | no |
| <a name="input_business_unit_name"></a> [business\_unit\_name](#input\_business\_unit\_name) | Name to create the business unit | `string` | n/a | yes |
| <a name="input_cloud_source_repos"></a> [cloud\_source\_repos](#input\_cloud\_source\_repos) | List of Cloud Source Repositories created during bootstrap project build stage for use with Cloud Build. | `list(string)` | <pre>[<br>  "gcp-org",<br>  "gcp-environments",<br>  "gcp-networks",<br>  "gcp-projects"<br>]</pre> | no |
| <a name="input_default_region"></a> [default\_region](#input\_default\_region) | Default region to create resources where applicable. | `string` | `"us-central1"` | no |
| <a name="input_default_region2"></a> [default\_region2](#input\_default\_region2) | Second subnet region for DNS Hub network. | `string` | n/a | yes |
| <a name="input_dev_environment_code"></a> [dev\_environment\_code](#input\_dev\_environment\_code) | Environment code used in 2-envs and 3-networks stages | `string` | n/a | yes |
| <a name="input_development_folder"></a> [development\_folder](#input\_development\_folder) | development environment folder name | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | The DNS name of peering managed zone, for instance 'example.com.'. Must end with a period. | `string` | n/a | yes |
| <a name="input_domains_to_allow"></a> [domains\_to\_allow](#input\_domains\_to\_allow) | The list of domains to allow users from in IAM. Used by Domain Restricted Sharing Organization Policy. Must include the domain of the organization you are deploying the foundation. To add other domains you must also grant access to these domains to the terraform service account used in the deploy. | `list(any)` | n/a | yes |
| <a name="input_egress_ranges_firewall"></a> [egress\_ranges\_firewall](#input\_egress\_ranges\_firewall) | Destination IP address range in CIDR format. Required for EGRESS rules. | `list(any)` | n/a | yes |
| <a name="input_enable_hub_and_spoke"></a> [enable\_hub\_and\_spoke](#input\_enable\_hub\_and\_spoke) | Enable Hub-and-Spoke architecture. | `bool` | n/a | yes |
| <a name="input_enable_hub_and_spoke_transitivity"></a> [enable\_hub\_and\_spoke\_transitivity](#input\_enable\_hub\_and\_spoke\_transitivity) | Enable transitivity via gateway VMs on Hub-and-Spoke architecture. | `bool` | `false` | no |
| <a name="input_encrypt_gcs_bucket_tfstate"></a> [encrypt\_gcs\_bucket\_tfstate](#input\_encrypt\_gcs\_bucket\_tfstate) | Encrypt bucket used for storing terraform state files in seed project. | `bool` | `false` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of a folder to host this project | `string` | `""` | no |
| <a name="input_folder_prefix"></a> [folder\_prefix](#input\_folder\_prefix) | Name prefix to use for folders created. Should be the same in all steps. | `string` | `"fldr"` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | If supplied, the state bucket will be deleted even while containing objects. | `bool` | `false` | no |
| <a name="input_grant_billing_user"></a> [grant\_billing\_user](#input\_grant\_billing\_user) | Grant roles/billing.user role to CFT service account | `bool` | `true` | no |
| <a name="input_group_billing_admins"></a> [group\_billing\_admins](#input\_group\_billing\_admins) | Google Group for GCP Billing Administrators | `string` | n/a | yes |
| <a name="input_group_org_admins"></a> [group\_org\_admins](#input\_group\_org\_admins) | Google Group for GCP Organization Administrators | `string` | n/a | yes |
| <a name="input_ingress_ranges_firewall"></a> [ingress\_ranges\_firewall](#input\_ingress\_ranges\_firewall) | Source IP address range in CIDR format. Required for INGRESS rules. | `list(any)` | n/a | yes |
| <a name="input_key_protection_level"></a> [key\_protection\_level](#input\_key\_protection\_level) | The protection level to use when creating a version based on this template. | `string` | `"SOFTWARE"` | no |
| <a name="input_key_rotation_period"></a> [key\_rotation\_period](#input\_key\_rotation\_period) | n/a | `string` | `null` | no |
| <a name="input_kms_prevent_destroy"></a> [kms\_prevent\_destroy](#input\_kms\_prevent\_destroy) | Set the prevent\_destroy lifecycle attribute on keys. | `bool` | `true` | no |
| <a name="input_log_sink_prefix"></a> [log\_sink\_prefix](#input\_log\_sink\_prefix) | n/a | `string` | n/a | yes |
| <a name="input_monitoring_workspace_users"></a> [monitoring\_workspace\_users](#input\_monitoring\_workspace\_users) | Google Workspace or Cloud Identity group that have access to Monitoring Workspaces. | `string` | n/a | yes |
| <a name="input_non-prod_environment_code"></a> [non-prod\_environment\_code](#input\_non-prod\_environment\_code) | Environment code used in 2-envs and 3-networks stages | `string` | n/a | yes |
| <a name="input_org_admins_org_iam_permissions"></a> [org\_admins\_org\_iam\_permissions](#input\_org\_admins\_org\_iam\_permissions) | List of permissions granted to the group supplied in group\_org\_admins variable across the GCP organization. | `list(string)` | `[]` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | GCP Organization ID | `string` | n/a | yes |
| <a name="input_org_policy_admin_role"></a> [org\_policy\_admin\_role](#input\_org\_policy\_admin\_role) | Additional Org Policy Admin role for admin group. You can use this for testing purposes. | `bool` | `false` | no |
| <a name="input_org_project_creators"></a> [org\_project\_creators](#input\_org\_project\_creators) | Additional list of members to have project creator role across the organization. Prefix of group: user: or serviceAccount: is required. | `list(string)` | `[]` | no |
| <a name="input_parent_folder"></a> [parent\_folder](#input\_parent\_folder) | Optional - for an organization with existing projects or for development/validation. It will place all the example foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist. | `string` | `""` | no |
| <a name="input_primary_contact"></a> [primary\_contact](#input\_primary\_contact) | Email of primary contact | `string` | n/a | yes |
| <a name="input_prod_environment_code"></a> [prod\_environment\_code](#input\_prod\_environment\_code) | Environment code used in 2-envs and 3-networks stages | `string` | n/a | yes |
| <a name="input_production_folder"></a> [production\_folder](#input\_production\_folder) | production environment folder name | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Custom project ID to use for project created. If not supplied, the default id is {project\_prefix}-seed-{random suffix}. | `string` | `""` | no |
| <a name="input_project_labels"></a> [project\_labels](#input\_project\_labels) | Labels to apply to the project. | `map(string)` | `{}` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project Name | `string` | `"cldcvr"` | no |
| <a name="input_project_prefix"></a> [project\_prefix](#input\_project\_prefix) | Name prefix to use for projects created. Should be the same in all steps. Max size is 3 characters. | `string` | `"prj"` | no |
| <a name="input_random_suffix"></a> [random\_suffix](#input\_random\_suffix) | Appends a 4 character random suffix to project ID and GCS bucket name. | `bool` | `true` | no |
| <a name="input_rest_vpc_firewall_egress_dest_ranges"></a> [rest\_vpc\_firewall\_egress\_dest\_ranges](#input\_rest\_vpc\_firewall\_egress\_dest\_ranges) | Used in shared vpc firewall egress destination ranges | `list(any)` | n/a | yes |
| <a name="input_rest_vpc_firewall_ingress_src_ranges"></a> [rest\_vpc\_firewall\_ingress\_src\_ranges](#input\_rest\_vpc\_firewall\_ingress\_src\_ranges) | Used in shared vpc firewall ingress source ranges | `list(any)` | n/a | yes |
| <a name="input_rest_vpc_global_address_private"></a> [rest\_vpc\_global\_address\_private](#input\_rest\_vpc\_global\_address\_private) | IP address range supplied as an input to reserve a specific address in a network - Internal | `map(any)` | <pre>{<br>  "d": "10.24.64.0/21",<br>  "n": "10.24.128.0/21",<br>  "p": "10.24.192.0/21",<br>  "s": "10.24.128.0/21"<br>}</pre> | no |
| <a name="input_rest_vpc_private_subnet_default_region"></a> [rest\_vpc\_private\_subnet\_default\_region](#input\_rest\_vpc\_private\_subnet\_default\_region) | Subnet range for creating subnet for a region, this variable is used in google network module, subnets | `map(any)` | <pre>{<br>  "d": "10.8.64.0/21",<br>  "n": "10.8.128.0/21",<br>  "p": "10.8.192.0/21",<br>  "s": "10.8.128.0/21"<br>}</pre> | no |
| <a name="input_rest_vpc_private_subnet_default_region2"></a> [rest\_vpc\_private\_subnet\_default\_region2](#input\_rest\_vpc\_private\_subnet\_default\_region2) | Subnet range for creating subnet in default region2, this variable is used in google network module, subnets | `map(any)` | <pre>{<br>  "d": "10.9.64.0/21",<br>  "n": "10.9.128.0/21",<br>  "p": "10.9.192.0/21",<br>  "s": "10.9.128.0/21"<br>}</pre> | no |
| <a name="input_rest_vpc_subnet_secondary_ip_range_gke_pod"></a> [rest\_vpc\_subnet\_secondary\_ip\_range\_gke\_pod](#input\_rest\_vpc\_subnet\_secondary\_ip\_range\_gke\_pod) | Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module | `map(any)` | <pre>{<br>  "d": "100.72.64.0/21",<br>  "n": "100.72.128.0/21",<br>  "p": "100.72.192.0/21",<br>  "s": "100.72.128.0/21"<br>}</pre> | no |
| <a name="input_rest_vpc_subnet_secondary_ip_range_gke_svc"></a> [rest\_vpc\_subnet\_secondary\_ip\_range\_gke\_svc](#input\_rest\_vpc\_subnet\_secondary\_ip\_range\_gke\_svc) | Secondary IP ranges for VM instances contained in the subnetwork. This is used in 3-network, shared vpc, subnets module | `map(any)` | <pre>{<br>  "d": "100.72.72.0/21",<br>  "n": "100.72.136.0/21",<br>  "p": "100.72.200.0/21",<br>  "s": "100.72.136.0/21"<br>}</pre> | no |
| <a name="input_sa_enable_impersonation"></a> [sa\_enable\_impersonation](#input\_sa\_enable\_impersonation) | Allow org\_admins group to impersonate service account & enable APIs required. | `bool` | `false` | no |
| <a name="input_sa_org_iam_permissions"></a> [sa\_org\_iam\_permissions](#input\_sa\_org\_iam\_permissions) | List of permissions granted to Terraform service account across the GCP organization. | `list(string)` | <pre>[<br>  "roles/billing.user",<br>  "roles/compute.networkAdmin",<br>  "roles/compute.xpnAdmin",<br>  "roles/iam.securityAdmin",<br>  "roles/iam.serviceAccountAdmin",<br>  "roles/logging.configWriter",<br>  "roles/orgpolicy.policyAdmin",<br>  "roles/resourcemanager.folderAdmin",<br>  "roles/resourcemanager.organizationViewer"<br>]</pre> | no |
| <a name="input_secondary_contact"></a> [secondary\_contact](#input\_secondary\_contact) | Email of secondary contact | `string` | n/a | yes |
| <a name="input_shared_env"></a> [shared\_env](#input\_shared\_env) | Environment code used in 2-envs and 3-networks stages | `string` | n/a | yes |
| <a name="input_shared_environment_code"></a> [shared\_environment\_code](#input\_shared\_environment\_code) | Environment code used in 1-org, 2-envs and 3-networks stages | `string` | n/a | yes |
| <a name="input_staging_environment_code"></a> [staging\_environment\_code](#input\_staging\_environment\_code) | Environment code used in 2-envs and 3-networks stages | `string` | n/a | yes |
| <a name="input_staging_folder"></a> [staging\_folder](#input\_staging\_folder) | staging environment folder name | `string` | n/a | yes |
| <a name="input_state_bucket_name"></a> [state\_bucket\_name](#input\_state\_bucket\_name) | Custom state bucket name. If not supplied, the default name is {project\_prefix}-tfstate-{random suffix}. | `string` | `""` | no |
| <a name="input_storage_bucket_labels"></a> [storage\_bucket\_labels](#input\_storage\_bucket\_labels) | Labels to apply to the storage bucket. | `map(string)` | `{}` | no |
| <a name="input_subnet_ip_cidr_range_region1"></a> [subnet\_ip\_cidr\_range\_region1](#input\_subnet\_ip\_cidr\_range\_region1) | The range of internal addresses that are owned by this subnetwork. Only IPv4 is supported | `string` | n/a | yes |
| <a name="input_subnet_ip_cidr_range_region2"></a> [subnet\_ip\_cidr\_range\_region2](#input\_subnet\_ip\_cidr\_range\_region2) | The range of internal addresses that are owned by this subnetwork. Only IPv4 is supported | `string` | n/a | yes |
| <a name="input_target_name_server_addresses"></a> [target\_name\_server\_addresses](#input\_target\_name\_server\_addresses) | List of IPv4 address of target name servers for the forwarding zone configuration. See https://cloud.google.com/dns/docs/overview#dns-forwarding-zones for details on target name servers in the context of Cloud DNS forwarding zones. | `list(string)` | n/a | yes |
| <a name="input_tf_service_account_id"></a> [tf\_service\_account\_id](#input\_tf\_service\_account\_id) | ID of service account for terraform in seed project | `string` | `"org-terraform"` | no |
| <a name="input_tf_service_account_name"></a> [tf\_service\_account\_name](#input\_tf\_service\_account\_name) | Display name of service account for terraform in seed project | `string` | `"CFT Organization Terraform Account"` | no |
| <a name="input_vpc_prefix"></a> [vpc\_prefix](#input\_vpc\_prefix) | VPC prefix used to create the vpc | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_audit_data_users"></a> [audit\_data\_users](#output\_audit\_data\_users) | n/a |
| <a name="output_base_vpc_firewall_egress_dest_ranges"></a> [base\_vpc\_firewall\_egress\_dest\_ranges](#output\_base\_vpc\_firewall\_egress\_dest\_ranges) | network |
| <a name="output_base_vpc_firewall_ingress_src_ranges"></a> [base\_vpc\_firewall\_ingress\_src\_ranges](#output\_base\_vpc\_firewall\_ingress\_src\_ranges) | n/a |
| <a name="output_base_vpc_global_address_private"></a> [base\_vpc\_global\_address\_private](#output\_base\_vpc\_global\_address\_private) | n/a |
| <a name="output_base_vpc_private_subnet_default_region"></a> [base\_vpc\_private\_subnet\_default\_region](#output\_base\_vpc\_private\_subnet\_default\_region) | n/a |
| <a name="output_base_vpc_private_subnet_default_region2"></a> [base\_vpc\_private\_subnet\_default\_region2](#output\_base\_vpc\_private\_subnet\_default\_region2) | n/a |
| <a name="output_base_vpc_subnet_secondary_ip_range_gke_pod"></a> [base\_vpc\_subnet\_secondary\_ip\_range\_gke\_pod](#output\_base\_vpc\_subnet\_secondary\_ip\_range\_gke\_pod) | n/a |
| <a name="output_base_vpc_subnet_secondary_ip_range_gke_svc"></a> [base\_vpc\_subnet\_secondary\_ip\_range\_gke\_svc](#output\_base\_vpc\_subnet\_secondary\_ip\_range\_gke\_svc) | n/a |
| <a name="output_billing_account"></a> [billing\_account](#output\_billing\_account) | n/a |
| <a name="output_billing_data_users"></a> [billing\_data\_users](#output\_billing\_data\_users) | n/a |
| <a name="output_bootstrap_folder"></a> [bootstrap\_folder](#output\_bootstrap\_folder) | n/a |
| <a name="output_bucket_prefix"></a> [bucket\_prefix](#output\_bucket\_prefix) | n/a |
| <a name="output_business_unit_name"></a> [business\_unit\_name](#output\_business\_unit\_name) | n/a |
| <a name="output_cloudbuild_project_id"></a> [cloudbuild\_project\_id](#output\_cloudbuild\_project\_id) | Project where CloudBuild configuration and terraform container image will reside. |
| <a name="output_csr_repos"></a> [csr\_repos](#output\_csr\_repos) | List of Cloud Source Repos created by the module, linked to Cloud Build triggers. |
| <a name="output_default_region2"></a> [default\_region2](#output\_default\_region2) | 3-networks |
| <a name="output_dev_environment_code"></a> [dev\_environment\_code](#output\_dev\_environment\_code) | n/a |
| <a name="output_development_folder"></a> [development\_folder](#output\_development\_folder) | n/a |
| <a name="output_domain"></a> [domain](#output\_domain) | n/a |
| <a name="output_domains_to_allow"></a> [domains\_to\_allow](#output\_domains\_to\_allow) | n/a |
| <a name="output_egress_ranges_firewall"></a> [egress\_ranges\_firewall](#output\_egress\_ranges\_firewall) | n/a |
| <a name="output_enable_hub_and_spoke"></a> [enable\_hub\_and\_spoke](#output\_enable\_hub\_and\_spoke) | 1-org |
| <a name="output_enable_hub_and_spoke_transitivity"></a> [enable\_hub\_and\_spoke\_transitivity](#output\_enable\_hub\_and\_spoke\_transitivity) | n/a |
| <a name="output_folder_prefix"></a> [folder\_prefix](#output\_folder\_prefix) | n/a |
| <a name="output_gcp_region"></a> [gcp\_region](#output\_gcp\_region) | n/a |
| <a name="output_gcs_bucket_cloudbuild_artifacts"></a> [gcs\_bucket\_cloudbuild\_artifacts](#output\_gcs\_bucket\_cloudbuild\_artifacts) | Bucket used to store Cloud/Build artifacts in CloudBuild project. |
| <a name="output_gcs_bucket_tfstate"></a> [gcs\_bucket\_tfstate](#output\_gcs\_bucket\_tfstate) | Bucket used for storing terraform state for foundations pipelines in seed project. |
| <a name="output_group_org_admins"></a> [group\_org\_admins](#output\_group\_org\_admins) | n/a |
| <a name="output_ingress_ranges_firewall"></a> [ingress\_ranges\_firewall](#output\_ingress\_ranges\_firewall) | n/a |
| <a name="output_kms_crypto_key"></a> [kms\_crypto\_key](#output\_kms\_crypto\_key) | KMS key created by the module. |
| <a name="output_kms_keyring"></a> [kms\_keyring](#output\_kms\_keyring) | KMS Keyring created by the module. |
| <a name="output_log_sink_prefix"></a> [log\_sink\_prefix](#output\_log\_sink\_prefix) | n/a |
| <a name="output_monitoring_workspace_users"></a> [monitoring\_workspace\_users](#output\_monitoring\_workspace\_users) | 2-env |
| <a name="output_non-prod_environment_code"></a> [non-prod\_environment\_code](#output\_non-prod\_environment\_code) | n/a |
| <a name="output_org_id"></a> [org\_id](#output\_org\_id) | n/a |
| <a name="output_primary_contact"></a> [primary\_contact](#output\_primary\_contact) | n/a |
| <a name="output_prod_environment_code"></a> [prod\_environment\_code](#output\_prod\_environment\_code) | n/a |
| <a name="output_production_folder"></a> [production\_folder](#output\_production\_folder) | n/a |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | n/a |
| <a name="output_project_prefix"></a> [project\_prefix](#output\_project\_prefix) | n/a |
| <a name="output_rest_vpc_firewall_egress_dest_ranges"></a> [rest\_vpc\_firewall\_egress\_dest\_ranges](#output\_rest\_vpc\_firewall\_egress\_dest\_ranges) | restricted network |
| <a name="output_rest_vpc_firewall_ingress_src_ranges"></a> [rest\_vpc\_firewall\_ingress\_src\_ranges](#output\_rest\_vpc\_firewall\_ingress\_src\_ranges) | n/a |
| <a name="output_rest_vpc_global_address_private"></a> [rest\_vpc\_global\_address\_private](#output\_rest\_vpc\_global\_address\_private) | network restricted - all |
| <a name="output_rest_vpc_private_subnet_default_region"></a> [rest\_vpc\_private\_subnet\_default\_region](#output\_rest\_vpc\_private\_subnet\_default\_region) | n/a |
| <a name="output_rest_vpc_private_subnet_default_region2"></a> [rest\_vpc\_private\_subnet\_default\_region2](#output\_rest\_vpc\_private\_subnet\_default\_region2) | n/a |
| <a name="output_rest_vpc_subnet_secondary_ip_range_gke_pod"></a> [rest\_vpc\_subnet\_secondary\_ip\_range\_gke\_pod](#output\_rest\_vpc\_subnet\_secondary\_ip\_range\_gke\_pod) | n/a |
| <a name="output_rest_vpc_subnet_secondary_ip_range_gke_svc"></a> [rest\_vpc\_subnet\_secondary\_ip\_range\_gke\_svc](#output\_rest\_vpc\_subnet\_secondary\_ip\_range\_gke\_svc) | n/a |
| <a name="output_secondary_contact"></a> [secondary\_contact](#output\_secondary\_contact) | n/a |
| <a name="output_seed_project_id"></a> [seed\_project\_id](#output\_seed\_project\_id) | Project where service accounts and core APIs will be enabled. |
| <a name="output_shared_env"></a> [shared\_env](#output\_shared\_env) | n/a |
| <a name="output_shared_environment_code"></a> [shared\_environment\_code](#output\_shared\_environment\_code) | n/a |
| <a name="output_staging_environment_code"></a> [staging\_environment\_code](#output\_staging\_environment\_code) | n/a |
| <a name="output_staging_folder"></a> [staging\_folder](#output\_staging\_folder) | n/a |
| <a name="output_subnet_ip_cidr_range_region1"></a> [subnet\_ip\_cidr\_range\_region1](#output\_subnet\_ip\_cidr\_range\_region1) | n/a |
| <a name="output_subnet_ip_cidr_range_region2"></a> [subnet\_ip\_cidr\_range\_region2](#output\_subnet\_ip\_cidr\_range\_region2) | n/a |
| <a name="output_target_name_server_addresses"></a> [target\_name\_server\_addresses](#output\_target\_name\_server\_addresses) | n/a |
| <a name="output_terraform_sa_name"></a> [terraform\_sa\_name](#output\_terraform\_sa\_name) | Fully qualified name for privileged service account for Terraform. |
| <a name="output_terraform_service_account"></a> [terraform\_service\_account](#output\_terraform\_service\_account) | Email for privileged service account for Terraform. |
| <a name="output_terraform_validator_policies_repo"></a> [terraform\_validator\_policies\_repo](#output\_terraform\_validator\_policies\_repo) | Cloud Source Repository created for terraform-validator policies. |
| <a name="output_vpc_prefix"></a> [vpc\_prefix](#output\_vpc\_prefix) | n/a |

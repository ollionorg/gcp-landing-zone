
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.89 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kms"></a> [kms](#module\_kms) | ../kms | n/a |
| <a name="module_seed_project"></a> [seed\_project](#module\_seed\_project) | ../terraform-google-project-factory | n/a |

## Resources

| Name | Type |
|------|------|
| [google_billing_account_iam_member.tf_billing_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_account_iam_member) | resource |
| [google_folder_iam_binding.project_creator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_iam_binding) | resource |
| [google_folder_iam_member.org_admin_serviceusage_consumer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_iam_member) | resource |
| [google_folder_iam_member.tmp_project_creator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_iam_member) | resource |
| [google_organization_iam_binding.billing_creator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_binding) | resource |
| [google_organization_iam_binding.project_creator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_binding) | resource |
| [google_organization_iam_member.org_admin_serviceusage_consumer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.org_admins_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.org_billing_admin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.tf_sa_org_perms](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_organization_iam_member.tmp_project_creator](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_service_account.org_terraform](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_member.org_admin_sa_impersonate_permissions](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [google_storage_bucket.org_terraform_state](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_iam_member.org_terraform_state_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [google_storage_bucket_iam_member.orgadmins_state_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [random_id.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [google_storage_project_service_account.gcs_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/storage_project_service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | List of APIs to enable in the seed project. | `list(string)` | <pre>[<br>  "serviceusage.googleapis.com",<br>  "servicenetworking.googleapis.com",<br>  "compute.googleapis.com",<br>  "logging.googleapis.com",<br>  "bigquery.googleapis.com",<br>  "cloudresourcemanager.googleapis.com",<br>  "cloudbilling.googleapis.com",<br>  "iam.googleapis.com",<br>  "admin.googleapis.com",<br>  "appengine.googleapis.com",<br>  "storage-api.googleapis.com",<br>  "monitoring.googleapis.com"<br>]</pre> | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate projects with. | `string` | n/a | yes |
| <a name="input_default_region"></a> [default\_region](#input\_default\_region) | Default region to create resources where applicable. | `string` | `"us-central1"` | no |
| <a name="input_encrypt_gcs_bucket_tfstate"></a> [encrypt\_gcs\_bucket\_tfstate](#input\_encrypt\_gcs\_bucket\_tfstate) | Encrypt bucket used for storing terraform state files in seed project. | `bool` | `false` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of a folder to host this project | `string` | `""` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | If supplied, the state bucket will be deleted even while containing objects. | `bool` | `false` | no |
| <a name="input_grant_billing_user"></a> [grant\_billing\_user](#input\_grant\_billing\_user) | Grant roles/billing.user role to CFT service account | `bool` | `true` | no |
| <a name="input_group_billing_admins"></a> [group\_billing\_admins](#input\_group\_billing\_admins) | Google Group for GCP Billing Administrators | `string` | n/a | yes |
| <a name="input_group_org_admins"></a> [group\_org\_admins](#input\_group\_org\_admins) | Google Group for GCP Organization Administrators | `string` | n/a | yes |
| <a name="input_key_protection_level"></a> [key\_protection\_level](#input\_key\_protection\_level) | The protection level to use when creating a version based on this template. Default value: "SOFTWARE" Possible values: ["SOFTWARE", "HSM"] | `string` | `"SOFTWARE"` | no |
| <a name="input_key_rotation_period"></a> [key\_rotation\_period](#input\_key\_rotation\_period) | n/a | `string` | `null` | no |
| <a name="input_kms_prevent_destroy"></a> [kms\_prevent\_destroy](#input\_kms\_prevent\_destroy) | Set the prevent\_destroy lifecycle attribute on keys. | `bool` | `true` | no |
| <a name="input_org_admins_org_iam_permissions"></a> [org\_admins\_org\_iam\_permissions](#input\_org\_admins\_org\_iam\_permissions) | List of permissions granted to the group supplied in group\_org\_admins variable across the GCP organization. | `list(string)` | <pre>[<br>  "roles/billing.user",<br>  "roles/resourcemanager.organizationAdmin"<br>]</pre> | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | GCP Organization ID | `string` | n/a | yes |
| <a name="input_org_project_creators"></a> [org\_project\_creators](#input\_org\_project\_creators) | Additional list of members to have project creator role accross the organization. Prefix of group: user: or serviceAccount: is required. | `list(string)` | `[]` | no |
| <a name="input_parent_folder"></a> [parent\_folder](#input\_parent\_folder) | GCP parent folder ID in the form folders/{id} | `string` | `""` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Custom project ID to use for project created. If not supplied, the default id is {project\_prefix}-seed-{random suffix}. | `string` | `""` | no |
| <a name="input_project_labels"></a> [project\_labels](#input\_project\_labels) | Labels to apply to the project. | `map(string)` | `{}` | no |
| <a name="input_project_prefix"></a> [project\_prefix](#input\_project\_prefix) | Name prefix to use for projects created. | `string` | `"cft"` | no |
| <a name="input_random_suffix"></a> [random\_suffix](#input\_random\_suffix) | Appends a 4 character random suffix to project ID and GCS bucket name. | `bool` | `true` | no |
| <a name="input_sa_enable_impersonation"></a> [sa\_enable\_impersonation](#input\_sa\_enable\_impersonation) | Allow org\_admins group to impersonate service account & enable APIs required. | `bool` | `false` | no |
| <a name="input_sa_org_iam_permissions"></a> [sa\_org\_iam\_permissions](#input\_sa\_org\_iam\_permissions) | List of permissions granted to Terraform service account across the GCP organization. | `list(string)` | <pre>[<br>  "roles/billing.user",<br>  "roles/compute.networkAdmin",<br>  "roles/compute.xpnAdmin",<br>  "roles/iam.securityAdmin",<br>  "roles/iam.serviceAccountAdmin",<br>  "roles/logging.configWriter",<br>  "roles/orgpolicy.policyAdmin",<br>  "roles/resourcemanager.folderAdmin",<br>  "roles/resourcemanager.organizationViewer"<br>]</pre> | no |
| <a name="input_state_bucket_name"></a> [state\_bucket\_name](#input\_state\_bucket\_name) | Custom state bucket name. If not supplied, the default name is {project\_prefix}-tfstate-{random suffix}. | `string` | `""` | no |
| <a name="input_storage_bucket_labels"></a> [storage\_bucket\_labels](#input\_storage\_bucket\_labels) | Labels to apply to the storage bucket. | `map(string)` | `{}` | no |
| <a name="input_tf_service_account_id"></a> [tf\_service\_account\_id](#input\_tf\_service\_account\_id) | ID of service account for terraform in seed project | `string` | `"org-terraform"` | no |
| <a name="input_tf_service_account_name"></a> [tf\_service\_account\_name](#input\_tf\_service\_account\_name) | Display name of service account for terraform in seed project | `string` | `"CFT Organization Terraform Account"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcs_bucket_tfstate"></a> [gcs\_bucket\_tfstate](#output\_gcs\_bucket\_tfstate) | Bucket used for storing terraform state for foundations pipelines in seed project. |
| <a name="output_seed_project_id"></a> [seed\_project\_id](#output\_seed\_project\_id) | Project where service accounts and core APIs will be enabled. |
| <a name="output_terraform_sa_email"></a> [terraform\_sa\_email](#output\_terraform\_sa\_email) | Email for privileged service account for Terraform. |
| <a name="output_terraform_sa_name"></a> [terraform\_sa\_name](#output\_terraform\_sa\_name) | Fully qualified name for privileged service account for Terraform. |

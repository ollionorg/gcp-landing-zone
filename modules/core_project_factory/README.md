
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 3.89.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | 3.89.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 3.89.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | 3.89.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_project_services"></a> [project\_services](#module\_project\_services) | ../project_services | n/a |

## Resources

| Name | Type |
|------|------|
| [google-beta_google_compute_shared_vpc_host_project.shared_vpc_host](https://registry.terraform.io/providers/hashicorp/google-beta/3.89.0/docs/resources/google_compute_shared_vpc_host_project) | resource |
| [google-beta_google_compute_shared_vpc_service_project.shared_vpc_attachment](https://registry.terraform.io/providers/hashicorp/google-beta/3.89.0/docs/resources/google_compute_shared_vpc_service_project) | resource |
| [google-beta_google_compute_subnetwork_iam_member.apis_service_account_role_to_vpc_subnets](https://registry.terraform.io/providers/hashicorp/google-beta/3.89.0/docs/resources/google_compute_subnetwork_iam_member) | resource |
| [google-beta_google_compute_subnetwork_iam_member.group_role_to_vpc_subnets](https://registry.terraform.io/providers/hashicorp/google-beta/3.89.0/docs/resources/google_compute_subnetwork_iam_member) | resource |
| [google-beta_google_compute_subnetwork_iam_member.service_account_role_to_vpc_subnets](https://registry.terraform.io/providers/hashicorp/google-beta/3.89.0/docs/resources/google_compute_subnetwork_iam_member) | resource |
| [google_access_context_manager_service_perimeter_resource.service_perimeter_attachment](https://registry.terraform.io/providers/hashicorp/google/3.89.0/docs/resources/access_context_manager_service_perimeter_resource) | resource |
| [google_project.main](https://registry.terraform.io/providers/hashicorp/google/3.89.0/docs/resources/project) | resource |
| [google_project_default_service_accounts.default_service_accounts](https://registry.terraform.io/providers/hashicorp/google/3.89.0/docs/resources/project_default_service_accounts) | resource |
| [google_project_iam_member.controlling_group_vpc_membership](https://registry.terraform.io/providers/hashicorp/google/3.89.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.default_service_account_membership](https://registry.terraform.io/providers/hashicorp/google/3.89.0/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.gsuite_group_role](https://registry.terraform.io/providers/hashicorp/google/3.89.0/docs/resources/project_iam_member) | resource |
| [google_project_service.enable_access_context_manager](https://registry.terraform.io/providers/hashicorp/google/3.89.0/docs/resources/project_service) | resource |
| [google_project_usage_export_bucket.usage_report_export](https://registry.terraform.io/providers/hashicorp/google/3.89.0/docs/resources/project_usage_export_bucket) | resource |
| [google_resource_manager_lien.lien](https://registry.terraform.io/providers/hashicorp/google/3.89.0/docs/resources/resource_manager_lien) | resource |
| [google_service_account.default_service_account](https://registry.terraform.io/providers/hashicorp/google/3.89.0/docs/resources/service_account) | resource |
| [google_service_account_iam_member.service_account_grant_to_group](https://registry.terraform.io/providers/hashicorp/google/3.89.0/docs/resources/service_account_iam_member) | resource |
| [google_storage_bucket.project_bucket](https://registry.terraform.io/providers/hashicorp/google/3.89.0/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_iam_member.api_s_account_storage_admin_on_project_bucket](https://registry.terraform.io/providers/hashicorp/google/3.89.0/docs/resources/storage_bucket_iam_member) | resource |
| [google_storage_bucket_iam_member.group_storage_admin_on_project_bucket](https://registry.terraform.io/providers/hashicorp/google/3.89.0/docs/resources/storage_bucket_iam_member) | resource |
| [google_storage_bucket_iam_member.s_account_storage_admin_on_project_bucket](https://registry.terraform.io/providers/hashicorp/google/3.89.0/docs/resources/storage_bucket_iam_member) | resource |
| [random_id.random_project_id_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_api_identities"></a> [activate\_api\_identities](#input\_activate\_api\_identities) | The list of service identities (Google Managed service account for the API) to force-create for the project (e.g. in order to grant additional roles).<br>    APIs in this list will automatically be appended to `activate_apis`.<br>    Not including the API in this list will follow the default behaviour for identity creation (which is usually when the first resource using the API is created).<br>    Any roles (e.g. service agent role) must be explicitly listed. See https://cloud.google.com/iam/docs/understanding-roles#service-agent-roles-roles for a list of related roles. | <pre>list(object({<br>    api   = string<br>    roles = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | The list of apis to activate within the project | `list(string)` | <pre>[<br>  "compute.googleapis.com"<br>]</pre> | no |
| <a name="input_auto_create_network"></a> [auto\_create\_network](#input\_auto\_create\_network) | Create the default network | `bool` | `false` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate this project with | `string` | n/a | yes |
| <a name="input_bucket_force_destroy"></a> [bucket\_force\_destroy](#input\_bucket\_force\_destroy) | Force the deletion of all objects within the GCS bucket when deleting the bucket (optional) | `bool` | `false` | no |
| <a name="input_bucket_labels"></a> [bucket\_labels](#input\_bucket\_labels) | A map of key/value label pairs to assign to the bucket (optional) | `map(any)` | `{}` | no |
| <a name="input_bucket_location"></a> [bucket\_location](#input\_bucket\_location) | The location for a GCS bucket to create (optional) | `string` | `"US"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | A name for a GCS bucket to create (in the bucket\_project project), useful for Terraform state (optional) | `string` | `""` | no |
| <a name="input_bucket_project"></a> [bucket\_project](#input\_bucket\_project) | A project to create a GCS bucket (bucket\_name) in, useful for Terraform state (optional) | `string` | `""` | no |
| <a name="input_bucket_versioning"></a> [bucket\_versioning](#input\_bucket\_versioning) | Enable versioning for a GCS bucket to create (optional) | `bool` | `false` | no |
| <a name="input_create_project_sa"></a> [create\_project\_sa](#input\_create\_project\_sa) | Whether the default service account for the project shall be created | `bool` | `true` | no |
| <a name="input_credentials_path"></a> [credentials\_path](#input\_credentials\_path) | Path to a service account credentials file with rights to run the Project Factory. If this file is absent Terraform will fall back to Application Default Credentials. | `string` | `""` | no |
| <a name="input_default_service_account"></a> [default\_service\_account](#input\_default\_service\_account) | Project default service account setting: can be one of `delete`, `deprivilege`, `disable`, or `keep`. | `string` | `"disable"` | no |
| <a name="input_disable_dependent_services"></a> [disable\_dependent\_services](#input\_disable\_dependent\_services) | Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed. | `bool` | `true` | no |
| <a name="input_disable_services_on_destroy"></a> [disable\_services\_on\_destroy](#input\_disable\_services\_on\_destroy) | Whether project services will be disabled when the resources are destroyed | `bool` | `true` | no |
| <a name="input_enable_shared_vpc_host_project"></a> [enable\_shared\_vpc\_host\_project](#input\_enable\_shared\_vpc\_host\_project) | If this project is a shared VPC host project. If true, you must *not* set shared\_vpc variable. Default is false. | `bool` | `false` | no |
| <a name="input_enable_shared_vpc_service_project"></a> [enable\_shared\_vpc\_service\_project](#input\_enable\_shared\_vpc\_service\_project) | If this project should be attached to a shared VPC. If true, you must set shared\_vpc variable. | `bool` | n/a | yes |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of a folder to host this project | `string` | `""` | no |
| <a name="input_group_email"></a> [group\_email](#input\_group\_email) | The email address of a group to control the project by being assigned group\_role. | `string` | `""` | no |
| <a name="input_group_role"></a> [group\_role](#input\_group\_role) | The role to give the controlling group (group\_name) over the project. | `string` | `""` | no |
| <a name="input_impersonate_service_account"></a> [impersonate\_service\_account](#input\_impersonate\_service\_account) | An optional service account to impersonate. If this service account is not specified, Terraform will fall back to credential file or Application Default Credentials. | `string` | `""` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Map of labels for project | `map(string)` | `{}` | no |
| <a name="input_lien"></a> [lien](#input\_lien) | Add a lien on the project to prevent accidental deletion | `bool` | `false` | no |
| <a name="input_manage_group"></a> [manage\_group](#input\_manage\_group) | A toggle to indicate if a G Suite group should be managed. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name for the project | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | The organization ID. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID to give the project. If not provided, the `name` will be used. | `string` | `""` | no |
| <a name="input_project_sa_name"></a> [project\_sa\_name](#input\_project\_sa\_name) | Default service account name for the project. | `string` | `"project-service-account"` | no |
| <a name="input_random_project_id"></a> [random\_project\_id](#input\_random\_project\_id) | Adds a suffix of 4 random characters to the `project_id` | `bool` | `false` | no |
| <a name="input_sa_role"></a> [sa\_role](#input\_sa\_role) | A role to give the default Service Account for the project (defaults to none) | `string` | `""` | no |
| <a name="input_shared_vpc"></a> [shared\_vpc](#input\_shared\_vpc) | The ID of the host project which hosts the shared VPC | `string` | `""` | no |
| <a name="input_shared_vpc_subnets"></a> [shared\_vpc\_subnets](#input\_shared\_vpc\_subnets) | List of subnets fully qualified subnet IDs (ie. projects/$project\_id/regions/$region/subnetworks/$subnet\_id) | `list(string)` | `[]` | no |
| <a name="input_usage_bucket_name"></a> [usage\_bucket\_name](#input\_usage\_bucket\_name) | Name of a GCS bucket to store GCE usage reports in (optional) | `string` | `""` | no |
| <a name="input_usage_bucket_prefix"></a> [usage\_bucket\_prefix](#input\_usage\_bucket\_prefix) | Prefix in the GCS bucket to store GCE usage reports in (optional) | `string` | `""` | no |
| <a name="input_vpc_service_control_attach_enabled"></a> [vpc\_service\_control\_attach\_enabled](#input\_vpc\_service\_control\_attach\_enabled) | Whether the project will be attached to a VPC Service Control Perimeter | `bool` | `false` | no |
| <a name="input_vpc_service_control_perimeter_name"></a> [vpc\_service\_control\_perimeter\_name](#input\_vpc\_service\_control\_perimeter\_name) | The name of a VPC Service Control Perimeter to add the created project to | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_s_account"></a> [api\_s\_account](#output\_api\_s\_account) | API service account email |
| <a name="output_api_s_account_fmt"></a> [api\_s\_account\_fmt](#output\_api\_s\_account\_fmt) | API service account email formatted for terraform use |
| <a name="output_enabled_api_identities"></a> [enabled\_api\_identities](#output\_enabled\_api\_identities) | Enabled API identities in the project |
| <a name="output_enabled_apis"></a> [enabled\_apis](#output\_enabled\_apis) | Enabled APIs in the project |
| <a name="output_google_access_context_manager_service_perimeter_resource"></a> [google\_access\_context\_manager\_service\_perimeter\_resource](#output\_google\_access\_context\_manager\_service\_perimeter\_resource) | n/a |
| <a name="output_project_bucket_name"></a> [project\_bucket\_name](#output\_project\_bucket\_name) | The name of the projec's bucket |
| <a name="output_project_bucket_self_link"></a> [project\_bucket\_self\_link](#output\_project\_bucket\_self\_link) | Project's bucket selfLink |
| <a name="output_project_bucket_url"></a> [project\_bucket\_url](#output\_project\_bucket\_url) | Project's bucket url |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | n/a |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | n/a |
| <a name="output_project_number"></a> [project\_number](#output\_project\_number) | n/a |
| <a name="output_service_account_display_name"></a> [service\_account\_display\_name](#output\_service\_account\_display\_name) | The display name of the default service account |
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | The email of the default service account |
| <a name="output_service_account_id"></a> [service\_account\_id](#output\_service\_account\_id) | The id of the default service account |
| <a name="output_service_account_name"></a> [service\_account\_name](#output\_service\_account\_name) | The fully-qualified name of the default service account |
| <a name="output_service_account_unique_id"></a> [service\_account\_unique\_id](#output\_service\_account\_unique\_id) | The unique id of the default service account |

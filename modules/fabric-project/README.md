
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.89 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_project_metadata_item.oslogin_meta](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_project_metadata_item) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project) | resource |
| [google_project_iam_binding.extra](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |
| [google_project_iam_custom_role.roles](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |
| [google_project_iam_member.editors](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.gce_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.oslogin_admins](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.oslogin_sa_users](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.oslogin_users](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.oslogin_viewers](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.owners](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.viewers](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.project_services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_resource_manager_lien.lien](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/resource_manager_lien) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | Service APIs to enable. | `list(string)` | `[]` | no |
| <a name="input_auto_create_network"></a> [auto\_create\_network](#input\_auto\_create\_network) | Whether to create the default network for the project | `bool` | `false` | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | Billing account id. | `string` | `""` | no |
| <a name="input_custom_roles"></a> [custom\_roles](#input\_custom\_roles) | Map of role name => comma-delimited list of permissions to create in this project. | `map(string)` | `{}` | no |
| <a name="input_editors"></a> [editors](#input\_editors) | Optional list of IAM-format members to set as project editor. | `list(string)` | `[]` | no |
| <a name="input_extra_bindings_members"></a> [extra\_bindings\_members](#input\_extra\_bindings\_members) | List of comma-delimited IAM-format members for additional IAM bindings, one item per role. | `list(string)` | `[]` | no |
| <a name="input_extra_bindings_roles"></a> [extra\_bindings\_roles](#input\_extra\_bindings\_roles) | List of roles for additional IAM bindings, pair with members list below. | `list(string)` | `[]` | no |
| <a name="input_gce_service_account_roles"></a> [gce\_service\_account\_roles](#input\_gce\_service\_account\_roles) | List of project id=>role to assign to the default GCE service account. | `list(string)` | `[]` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Resource labels. | `map(string)` | `{}` | no |
| <a name="input_lien_reason"></a> [lien\_reason](#input\_lien\_reason) | If non-empty, creates a project lien with this description. | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Project name and id suffix. | `string` | n/a | yes |
| <a name="input_oslogin"></a> [oslogin](#input\_oslogin) | Enable oslogin. | `bool` | `false` | no |
| <a name="input_oslogin_admins"></a> [oslogin\_admins](#input\_oslogin\_admins) | List of IAM-format members that will get OS Login admin role. | `list(string)` | `[]` | no |
| <a name="input_oslogin_users"></a> [oslogin\_users](#input\_oslogin\_users) | List of IAM-format members that will get OS Login user role. | `list(string)` | `[]` | no |
| <a name="input_owners"></a> [owners](#input\_owners) | Optional list of IAM-format members to set as project owners. | `list(string)` | `[]` | no |
| <a name="input_parent"></a> [parent](#input\_parent) | The resource name of the parent Folder or Organization. Must be of the form folders/folder\_id or organizations/org\_id. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix used to generate project id and name. | `string` | n/a | yes |
| <a name="input_viewers"></a> [viewers](#input\_viewers) | Optional list of IAM-format members to set as project viewers. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudsvc_service_account"></a> [cloudsvc\_service\_account](#output\_cloudsvc\_service\_account) | Cloud services service account (depends on services). |
| <a name="output_custom_roles"></a> [custom\_roles](#output\_custom\_roles) | Ids of the created custom roles. |
| <a name="output_gce_service_account"></a> [gce\_service\_account](#output\_gce\_service\_account) | Default GCE service account (depends on services). |
| <a name="output_gke_service_account"></a> [gke\_service\_account](#output\_gke\_service\_account) | Default GKE service account (depends on services). |
| <a name="output_name"></a> [name](#output\_name) | Name (depends on services). |
| <a name="output_number"></a> [number](#output\_number) | Project number (depends on services). |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | Project id (depends on services). |

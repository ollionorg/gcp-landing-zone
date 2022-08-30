
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.89 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | >= 3.89 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_compute_subnetwork_iam_member.service_shared_vpc_subnet_users](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_subnetwork_iam_member) | resource |
| [google_project_iam_member.composer_host_agent](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.gke_host_agent](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.gke_security_admin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.service_shared_vpc_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project.service_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_apis"></a> [active\_apis](#input\_active\_apis) | The list of active apis on the service project. If api is not active this module will not try to activate it | `list(string)` | `[]` | no |
| <a name="input_enable_shared_vpc_service_project"></a> [enable\_shared\_vpc\_service\_project](#input\_enable\_shared\_vpc\_service\_project) | Flag set if SVPC enabled | `bool` | n/a | yes |
| <a name="input_grant_services_network_role"></a> [grant\_services\_network\_role](#input\_grant\_services\_network\_role) | Whether or not to grant service agents the network roles on the host project | `bool` | `true` | no |
| <a name="input_grant_services_security_admin_role"></a> [grant\_services\_security\_admin\_role](#input\_grant\_services\_security\_admin\_role) | Whether or not to grant Kubernetes Engine Service Agent the Security Admin role on the host project so it can manage firewall rules | `bool` | `false` | no |
| <a name="input_host_project_id"></a> [host\_project\_id](#input\_host\_project\_id) | The ID of the host project which hosts the shared VPC | `string` | n/a | yes |
| <a name="input_lookup_project_numbers"></a> [lookup\_project\_numbers](#input\_lookup\_project\_numbers) | Whether to look up the project numbers from data sources. If false, `service_project_number` will be used instead. | `bool` | `true` | no |
| <a name="input_service_project_id"></a> [service\_project\_id](#input\_service\_project\_id) | The ID of the service project | `string` | n/a | yes |
| <a name="input_service_project_number"></a> [service\_project\_number](#input\_service\_project\_number) | Project number of the service project. Will be used if `lookup_service_project_number` is false. | `string` | `null` | no |
| <a name="input_shared_vpc_subnets"></a> [shared\_vpc\_subnets](#input\_shared\_vpc\_subnets) | List of subnets fully qualified subnet IDs (ie. projects/$project\_id/regions/$region/subnetworks/$subnet\_id) | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_active_api_service_accounts"></a> [active\_api\_service\_accounts](#output\_active\_api\_service\_accounts) | List of active API service accounts in the service project. |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | Service project ID. |


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
| [google-beta_google_compute_shared_vpc_service_project.projects](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_shared_vpc_service_project) | resource |
| [google_compute_subnetwork_iam_binding.network_users](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork_iam_binding) | resource |
| [google_project_iam_binding.service_agents](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_host_project_id"></a> [host\_project\_id](#input\_host\_project\_id) | Project id of the shared VPC host project. | `string` | n/a | yes |
| <a name="input_host_service_agent_role"></a> [host\_service\_agent\_role](#input\_host\_service\_agent\_role) | Assign host service agent role to users in host\_service\_agent\_users variable. | `bool` | `false` | no |
| <a name="input_host_service_agent_users"></a> [host\_service\_agent\_users](#input\_host\_service\_agent\_users) | List of IAM-style users that will be granted the host service agent role on the host project. | `list(string)` | `[]` | no |
| <a name="input_host_subnet_regions"></a> [host\_subnet\_regions](#input\_host\_subnet\_regions) | List of subnet regions, one per subnet. | `list(string)` | `[]` | no |
| <a name="input_host_subnet_users"></a> [host\_subnet\_users](#input\_host\_subnet\_users) | Map of comma-delimited IAM-style members to which network user roles for subnets will be assigned. | `map(any)` | `{}` | no |
| <a name="input_host_subnets"></a> [host\_subnets](#input\_host\_subnets) | List of subnet names on which to grant network user role. | `list(string)` | `[]` | no |
| <a name="input_service_project_ids"></a> [service\_project\_ids](#input\_service\_project\_ids) | Ids of the service projects that will be attached to the Shared VPC. | `list(string)` | n/a | yes |
| <a name="input_service_project_num"></a> [service\_project\_num](#input\_service\_project\_num) | Number of service projects that will be attached to the Shared VPC. | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_projects"></a> [service\_projects](#output\_service\_projects) | Project ids of the services with access to all subnets. |

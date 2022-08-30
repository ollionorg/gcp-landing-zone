
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

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_compute_instance"></a> [compute\_instance](#module\_compute\_instance) | ../../modules/compute_instance | n/a |
| <a name="module_instance_template"></a> [instance\_template](#module\_instance\_template) | ../../modules/instance_template | n/a |

## Resources

| Name | Type |
|------|------|
| [google_service_account.compute_engine_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_compute_network.shared_vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) | data source |
| [google_compute_subnetwork.subnetwork](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_subnetwork) | data source |
| [google_project.env_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |
| [google_project.network_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |
| [google_projects.environment_projects](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |
| [google_projects.network_projects](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_business_code"></a> [business\_code](#input\_business\_code) | The code that describes which business unit owns the project | `string` | `"abcd"` | no |
| <a name="input_env_code"></a> [env\_code](#input\_env\_code) | The environment code the single project belongs to, like 'd', 's', 'p' | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment the single project belongs to | `string` | n/a | yes |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The folder id where project will be created | `string` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname of instances | `string` | `"example-app"` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | Machine type to create, e.g. n1-standard-1 | `string` | `"f1-micro"` | no |
| <a name="input_num_instances"></a> [num\_instances](#input\_num\_instances) | Number of instances to create | `number` | n/a | yes |
| <a name="input_project_suffix"></a> [project\_suffix](#input\_project\_suffix) | The name of the GCP project. Max 16 characters with 3 character business unit code. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The GCP region to create and test resources in | `string` | `"us-central1"` | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Service account to attach to the instance. See https://www.terraform.io/docs/providers/google/r/compute_instance_template.html#service_account. | <pre>object({<br>    email  = string,<br>    scopes = set(string)<br>  })</pre> | `null` | no |
| <a name="input_vpc_type"></a> [vpc\_type](#input\_vpc\_type) | The type of VPC to attach the project to. Possible options are base or restricted. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_available_zones"></a> [available\_zones](#output\_available\_zones) | List of available zones in region |
| <a name="output_instances_details"></a> [instances\_details](#output\_instances\_details) | List of details for compute instances |
| <a name="output_instances_self_links"></a> [instances\_self\_links](#output\_instances\_self\_links) | List of self-links for compute instances |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | Project where compute instance was created |
| <a name="output_region"></a> [region](#output\_region) | Region where compute instance was created |

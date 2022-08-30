
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.89 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_compute_health_check.http](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_health_check) | resource |
| [google-beta_google_compute_health_check.tcp](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_health_check) | resource |
| [google_compute_firewall.default-hc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.default-ilb-fw](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_forwarding_rule.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_forwarding_rule) | resource |
| [google_compute_region_backend_service.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_backend_service) | resource |
| [google_compute_network.network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) | data source |
| [google_compute_subnetwork.network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_subnetwork) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_all_ports"></a> [all\_ports](#input\_all\_ports) | Boolean for all\_ports setting on forwarding rule. | `bool` | `null` | no |
| <a name="input_backends"></a> [backends](#input\_backends) | List of backends, should be a map of key-value pairs for each backend, must have the 'group' key. | `list(any)` | n/a | yes |
| <a name="input_connection_draining_timeout_sec"></a> [connection\_draining\_timeout\_sec](#input\_connection\_draining\_timeout\_sec) | Time for which instance will be drained | `number` | `null` | no |
| <a name="input_create_backend_firewall"></a> [create\_backend\_firewall](#input\_create\_backend\_firewall) | Controls if firewall rules for the backends will be created or not. Health-check firewall rules are controlled separately. | `bool` | `true` | no |
| <a name="input_create_health_check_firewall"></a> [create\_health\_check\_firewall](#input\_create\_health\_check\_firewall) | Controls if firewall rules for the health check will be created or not. If this rule is not present backend healthcheck will fail. | `bool` | `true` | no |
| <a name="input_global_access"></a> [global\_access](#input\_global\_access) | Allow all regions on the same VPC network access. | `bool` | `false` | no |
| <a name="input_health_check"></a> [health\_check](#input\_health\_check) | Health check to determine whether instances are responsive and able to do work | <pre>object({<br>    type                = string<br>    check_interval_sec  = number<br>    healthy_threshold   = number<br>    timeout_sec         = number<br>    unhealthy_threshold = number<br>    response            = string<br>    proxy_header        = string<br>    port                = number<br>    port_name           = string<br>    request             = string<br>    request_path        = string<br>    host                = string<br>    enable_log          = bool<br>  })</pre> | n/a | yes |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | IP address of the internal load balancer, if empty one will be assigned. Default is empty. | `any` | `null` | no |
| <a name="input_ip_protocol"></a> [ip\_protocol](#input\_ip\_protocol) | The IP protocol for the backend and frontend forwarding rule. TCP or UDP. | `string` | `"TCP"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the forwarding rule and prefix for supporting resources. | `any` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | Name of the network to create resources in. | `string` | `"default"` | no |
| <a name="input_network_project"></a> [network\_project](#input\_network\_project) | Name of the project for the network. Useful for shared VPC. Default is var.project. | `string` | `""` | no |
| <a name="input_ports"></a> [ports](#input\_ports) | List of ports range to forward to backend services. Max is 5. | `list(string)` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project to deploy to, if not set the default provider project is used. | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | Region for cloud resources. | `string` | `"us-central1"` | no |
| <a name="input_service_label"></a> [service\_label](#input\_service\_label) | Service label is used to create internal DNS name | `string` | `null` | no |
| <a name="input_session_affinity"></a> [session\_affinity](#input\_session\_affinity) | The session affinity for the backends example: NONE, CLIENT\_IP. Default is `NONE`. | `string` | `"NONE"` | no |
| <a name="input_source_ip_ranges"></a> [source\_ip\_ranges](#input\_source\_ip\_ranges) | List of source ip ranges for traffic between the internal load balancer. | `list(string)` | `null` | no |
| <a name="input_source_service_accounts"></a> [source\_service\_accounts](#input\_source\_service\_accounts) | List of source service accounts for traffic between the internal load balancer. | `list(string)` | `null` | no |
| <a name="input_source_tags"></a> [source\_tags](#input\_source\_tags) | List of source tags for traffic between the internal load balancer. | `list(string)` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | Name of the subnetwork to create resources in. | `string` | `"default"` | no |
| <a name="input_target_service_accounts"></a> [target\_service\_accounts](#input\_target\_service\_accounts) | List of target service accounts for traffic between the internal load balancer. | `list(string)` | `null` | no |
| <a name="input_target_tags"></a> [target\_tags](#input\_target\_tags) | List of target tags for traffic between the internal load balancer. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_forwarding_rule"></a> [forwarding\_rule](#output\_forwarding\_rule) | The forwarding rule self\_link. |
| <a name="output_forwarding_rule_id"></a> [forwarding\_rule\_id](#output\_forwarding\_rule\_id) | The forwarding rule id. |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | The internal IP assigned to the regional forwarding rule. |

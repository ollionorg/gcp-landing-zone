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
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.5.0 |
| <a name="provider_google.impersonate"></a> [google.impersonate](#provider\_google.impersonate) | 4.5.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_base_shared_vpc"></a> [base\_shared\_vpc](#module\_base\_shared\_vpc) | ../../../modules/base_shared_vpc | n/a |
| <a name="module_restricted_shared_vpc"></a> [restricted\_shared\_vpc](#module\_restricted\_shared\_vpc) | ../../../modules/restricted_shared_vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [google_active_folder.env](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/active_folder) | data source |
| [google_project.restricted_host_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |
| [google_projects.base_host_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |
| [google_projects.restricted_host_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |
| [google_service_account_access_token.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account_access_token) | data source |
| [terraform_remote_state.bootstrap](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.env](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.org](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_enable_inbound_forwarding"></a> [dns\_enable\_inbound\_forwarding](#input\_dns\_enable\_inbound\_forwarding) | Toggle inbound query forwarding for VPC DNS. | `bool` | `true` | no |
| <a name="input_dns_enable_logging"></a> [dns\_enable\_logging](#input\_dns\_enable\_logging) | Toggle DNS logging for VPC DNS. | `bool` | `true` | no |
| <a name="input_enable_partner_interconnect"></a> [enable\_partner\_interconnect](#input\_enable\_partner\_interconnect) | Enable Partner Interconnect in the environment. | `bool` | `false` | no |
| <a name="input_firewall_enable_logging"></a> [firewall\_enable\_logging](#input\_firewall\_enable\_logging) | Toggle firewall logging for VPC Firewalls. | `bool` | `true` | no |
| <a name="input_nat_bgp_asn"></a> [nat\_bgp\_asn](#input\_nat\_bgp\_asn) | BGP ASN for first NAT cloud routes. | `number` | `64514` | no |
| <a name="input_nat_enabled"></a> [nat\_enabled](#input\_nat\_enabled) | Toggle creation of NAT cloud router. | `bool` | `false` | no |
| <a name="input_nat_num_addresses"></a> [nat\_num\_addresses](#input\_nat\_num\_addresses) | Number of external IPs to reserve for Cloud NAT. | `number` | `2` | no |
| <a name="input_nat_num_addresses_region1"></a> [nat\_num\_addresses\_region1](#input\_nat\_num\_addresses\_region1) | Number of external IPs to reserve for first Cloud NAT. | `number` | `2` | no |
| <a name="input_nat_num_addresses_region2"></a> [nat\_num\_addresses\_region2](#input\_nat\_num\_addresses\_region2) | Number of external IPs to reserve for second Cloud NAT. | `number` | `2` | no |
| <a name="input_optional_fw_rules_enabled"></a> [optional\_fw\_rules\_enabled](#input\_optional\_fw\_rules\_enabled) | Toggle creation of optional firewall rules: IAP SSH, IAP RDP and Internal & Global load balancing health check and load balancing IP ranges. | `bool` | `false` | no |
| <a name="input_parent_folder"></a> [parent\_folder](#input\_parent\_folder) | Optional - for an organization with existing projects or for development/validation. It will place all the example foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist. Must be the same value used in previous step. | `string` | `""` | no |
| <a name="input_preactivate_partner_interconnect"></a> [preactivate\_partner\_interconnect](#input\_preactivate\_partner\_interconnect) | Preactivate Partner Interconnect VLAN attachment in the environment. | `bool` | `false` | no |
| <a name="input_subnetworks_enable_logging"></a> [subnetworks\_enable\_logging](#input\_subnetworks\_enable\_logging) | Toggle subnetworks flow logging for VPC Subnetworks. | `bool` | `true` | no |
| <a name="input_windows_activation_enabled"></a> [windows\_activation\_enabled](#input\_windows\_activation\_enabled) | Enable Windows license activation for Windows workloads. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_base_host_project_id"></a> [base\_host\_project\_id](#output\_base\_host\_project\_id) | The base host project ID |
| <a name="output_base_network_name"></a> [base\_network\_name](#output\_base\_network\_name) | The name of the VPC being created |
| <a name="output_base_network_self_link"></a> [base\_network\_self\_link](#output\_base\_network\_self\_link) | The URI of the VPC being created |
| <a name="output_base_subnets_ips"></a> [base\_subnets\_ips](#output\_base\_subnets\_ips) | The IPs and CIDRs of the subnets being created |
| <a name="output_base_subnets_names"></a> [base\_subnets\_names](#output\_base\_subnets\_names) | The names of the subnets being created |
| <a name="output_base_subnets_secondary_ranges"></a> [base\_subnets\_secondary\_ranges](#output\_base\_subnets\_secondary\_ranges) | The secondary ranges associated with these subnets |
| <a name="output_base_subnets_self_links"></a> [base\_subnets\_self\_links](#output\_base\_subnets\_self\_links) | The self-links of subnets being created |
| <a name="output_restricted_access_level_name"></a> [restricted\_access\_level\_name](#output\_restricted\_access\_level\_name) | Access context manager access level name |
| <a name="output_restricted_host_project_id"></a> [restricted\_host\_project\_id](#output\_restricted\_host\_project\_id) | The restricted host project ID |
| <a name="output_restricted_network_name"></a> [restricted\_network\_name](#output\_restricted\_network\_name) | The name of the VPC being created |
| <a name="output_restricted_network_self_link"></a> [restricted\_network\_self\_link](#output\_restricted\_network\_self\_link) | The URI of the VPC being created |
| <a name="output_restricted_service_perimeter_name"></a> [restricted\_service\_perimeter\_name](#output\_restricted\_service\_perimeter\_name) | Access context manager service perimeter name |
| <a name="output_restricted_subnets_ips"></a> [restricted\_subnets\_ips](#output\_restricted\_subnets\_ips) | The IPs and CIDRs of the subnets being created |
| <a name="output_restricted_subnets_names"></a> [restricted\_subnets\_names](#output\_restricted\_subnets\_names) | The names of the subnets being created |
| <a name="output_restricted_subnets_secondary_ranges"></a> [restricted\_subnets\_secondary\_ranges](#output\_restricted\_subnets\_secondary\_ranges) | The secondary ranges associated with these subnets |
| <a name="output_restricted_subnets_self_links"></a> [restricted\_subnets\_self\_links](#output\_restricted\_subnets\_self\_links) | The self-links of subnets being created |

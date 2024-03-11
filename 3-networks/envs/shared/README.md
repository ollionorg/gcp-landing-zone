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
**/

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.65.2 |
| <a name="provider_google.impersonate"></a> [google.impersonate](#provider\_google.impersonate) | 4.65.2 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_base_shared_vpc"></a> [base\_shared\_vpc](#module\_base\_shared\_vpc) | ../../../modules/base_shared_vpc | n/a |
| <a name="module_base_transitivity"></a> [base\_transitivity](#module\_base\_transitivity) | ../../../modules/transitivity | n/a |
| <a name="module_dns-forwarding-zone"></a> [dns-forwarding-zone](#module\_dns-forwarding-zone) | ../../../modules/terraform-google-cloud-dns | n/a |
| <a name="module_dns_hub_interconnect"></a> [dns\_hub\_interconnect](#module\_dns\_hub\_interconnect) | ../../../modules/dedicated_interconnect | n/a |
| <a name="module_dns_hub_region1_router1"></a> [dns\_hub\_region1\_router1](#module\_dns\_hub\_region1\_router1) | ../../../modules/terraform-google-cloud-router | n/a |
| <a name="module_dns_hub_region1_router2"></a> [dns\_hub\_region1\_router2](#module\_dns\_hub\_region1\_router2) | ../../../modules/terraform-google-cloud-router | n/a |
| <a name="module_dns_hub_region2_router1"></a> [dns\_hub\_region2\_router1](#module\_dns\_hub\_region2\_router1) | ../../../modules/terraform-google-cloud-router | n/a |
| <a name="module_dns_hub_region2_router2"></a> [dns\_hub\_region2\_router2](#module\_dns\_hub\_region2\_router2) | ../../../modules/terraform-google-cloud-router | n/a |
| <a name="module_dns_hub_vpc"></a> [dns\_hub\_vpc](#module\_dns\_hub\_vpc) | ../../../modules/terraform-google-network | n/a |
| <a name="module_hierarchical_firewall_policy"></a> [hierarchical\_firewall\_policy](#module\_hierarchical\_firewall\_policy) | ../../../modules/hierarchical_firewall_policy/ | n/a |
| <a name="module_restricted_shared_vpc"></a> [restricted\_shared\_vpc](#module\_restricted\_shared\_vpc) | ../../../modules/restricted_shared_vpc | n/a |
| <a name="module_restricted_transitivity"></a> [restricted\_transitivity](#module\_restricted\_transitivity) | ../../../modules/transitivity | n/a |
| <a name="module_shared_base_interconnect"></a> [shared\_base\_interconnect](#module\_shared\_base\_interconnect) | ../../../modules/partner_interconnect | n/a |
| <a name="module_shared_restricted_interconnect"></a> [shared\_restricted\_interconnect](#module\_shared\_restricted\_interconnect) | ../../../modules/partner_interconnect | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_backend_service.fw-backend](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_backend_service) | resource |
| [google_compute_firewall.allow-inbound](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow-mgmt](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow-outbound](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_forwarding_rule.my-int-lb-forwarding-rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_forwarding_rule) | resource |
| [google_compute_global_address.external-address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_global_forwarding_rule.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_forwarding_rule) | resource |
| [google_compute_health_check.health-check](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_health_check) | resource |
| [google_compute_health_check.my-tcp-health-check](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_health_check) | resource |
| [google_compute_instance.firewall](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_instance_group.fw-ig](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_group) | resource |
| [google_compute_network.management](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_network.trust](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_network.untrust](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_region_backend_service.my-int-lb](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_backend_service) | resource |
| [google_compute_route.trust](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_route) | resource |
| [google_compute_shared_vpc_service_project.notrust-interconnect](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_service_project) | resource |
| [google_compute_shared_vpc_service_project.trust-interconnect](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_shared_vpc_service_project) | resource |
| [google_compute_subnetwork.management-sub](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_compute_subnetwork.trust-sub](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_compute_subnetwork.untrust-sub](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_compute_target_http_proxy.http-lb-proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_http_proxy) | resource |
| [google_compute_url_map.http-elb](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_url_map) | resource |
| [google_dns_policy.default_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_policy) | resource |
| [google_active_folder.bootstrap](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/active_folder) | data source |
| [google_active_folder.common](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/active_folder) | data source |
| [google_active_folder.development](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/active_folder) | data source |
| [google_active_folder.production](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/active_folder) | data source |
| [google_active_folder.staging](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/active_folder) | data source |
| [google_projects.base_net_hub](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |
| [google_projects.dns_hub](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |
| [google_projects.restricted_net_hub](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |
| [google_service_account_access_token.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account_access_token) | data source |
| [terraform_remote_state.bootstrap](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.org](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_advertised_ip_ranges"></a> [advertised\_ip\_ranges](#input\_advertised\_ip\_ranges) | User-specified list of individual IP ranges to advertise in custom mode. | `string` | n/a | yes |
| <a name="input_allow-inbound-source-ranges"></a> [allow-inbound-source-ranges](#input\_allow-inbound-source-ranges) | n/a | `list` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_allow-mgmt-source-ranges"></a> [allow-mgmt-source-ranges](#input\_allow-mgmt-source-ranges) | n/a | `list` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_allow-outbound-source-ranges"></a> [allow-outbound-source-ranges](#input\_allow-outbound-source-ranges) | n/a | `list` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_base_hub_dns_enable_inbound_forwarding"></a> [base\_hub\_dns\_enable\_inbound\_forwarding](#input\_base\_hub\_dns\_enable\_inbound\_forwarding) | Toggle inbound query forwarding for Base Hub VPC DNS. | `bool` | `true` | no |
| <a name="input_base_hub_dns_enable_logging"></a> [base\_hub\_dns\_enable\_logging](#input\_base\_hub\_dns\_enable\_logging) | Toggle DNS logging for Base Hub VPC DNS. | `bool` | `true` | no |
| <a name="input_base_hub_firewall_enable_logging"></a> [base\_hub\_firewall\_enable\_logging](#input\_base\_hub\_firewall\_enable\_logging) | Toggle firewall logging for VPC Firewalls in Base Hub VPC. | `bool` | `true` | no |
| <a name="input_base_hub_nat_bgp_asn"></a> [base\_hub\_nat\_bgp\_asn](#input\_base\_hub\_nat\_bgp\_asn) | BGP ASN for first NAT cloud routes in Base Hub. | `number` | `64514` | no |
| <a name="input_base_hub_nat_enabled"></a> [base\_hub\_nat\_enabled](#input\_base\_hub\_nat\_enabled) | Toggle creation of NAT cloud router in Base Hub. | `bool` | `false` | no |
| <a name="input_base_hub_nat_num_addresses_region1"></a> [base\_hub\_nat\_num\_addresses\_region1](#input\_base\_hub\_nat\_num\_addresses\_region1) | Number of external IPs to reserve for first Cloud NAT in Base Hub. | `number` | `2` | no |
| <a name="input_base_hub_nat_num_addresses_region2"></a> [base\_hub\_nat\_num\_addresses\_region2](#input\_base\_hub\_nat\_num\_addresses\_region2) | Number of external IPs to reserve for second Cloud NAT in Base Hub. | `number` | `2` | no |
| <a name="input_base_hub_optional_fw_rules_enabled"></a> [base\_hub\_optional\_fw\_rules\_enabled](#input\_base\_hub\_optional\_fw\_rules\_enabled) | Toggle creation of optional firewall rules: IAP SSH, IAP RDP and Internal & Global load balancing health check and load balancing IP ranges in Base Hub VPC. | `bool` | `false` | no |
| <a name="input_base_hub_windows_activation_enabled"></a> [base\_hub\_windows\_activation\_enabled](#input\_base\_hub\_windows\_activation\_enabled) | Enable Windows license activation for Windows workloads in Base Hub | `bool` | `false` | no |
| <a name="input_bgp_asn_dns"></a> [bgp\_asn\_dns](#input\_bgp\_asn\_dns) | BGP Autonomous System Number (ASN). | `number` | `64667` | no |
| <a name="input_bootstrap_bucket_fw"></a> [bootstrap\_bucket\_fw](#input\_bootstrap\_bucket\_fw) | n/a | `string` | `"bootstrap-alb"` | no |
| <a name="input_delete_default_internet_gateway_routes"></a> [delete\_default\_internet\_gateway\_routes](#input\_delete\_default\_internet\_gateway\_routes) | If set to true, default routes (0.0.0.0/0) will be deleted immediately after network creation | `bool` | `true` | no |
| <a name="input_destination_range"></a> [destination\_range](#input\_destination\_range) | The destination range of outgoing packets that this route applies to. Only IPv4 is supported | `string` | n/a | yes |
| <a name="input_dns_enable_logging"></a> [dns\_enable\_logging](#input\_dns\_enable\_logging) | Toggle DNS logging for VPC DNS. | `bool` | `true` | no |
| <a name="input_enable_inbound_forwarding"></a> [enable\_inbound\_forwarding](#input\_enable\_inbound\_forwarding) | When enabled, a virtual IP address will be allocated from each of the sub-networks that are bound to this policy | `bool` | n/a | yes |
| <a name="input_enable_partner_interconnect"></a> [enable\_partner\_interconnect](#input\_enable\_partner\_interconnect) | Enable Partner Interconnect in the environment. | `bool` | `false` | no |
| <a name="input_firewall_name"></a> [firewall\_name](#input\_firewall\_name) | FIREWALL Variables | `string` | `"firewall"` | no |
| <a name="input_firewall_policies_enable_logging"></a> [firewall\_policies\_enable\_logging](#input\_firewall\_policies\_enable\_logging) | Toggle hierarchical firewall logging. | `bool` | `true` | no |
| <a name="input_image_fw"></a> [image\_fw](#input\_image\_fw) | n/a | `string` | `"https://www.googleapis.com/compute/v1/projects/paloaltonetworksgcp-public/global/images/vmseries-bundle1-810"` | no |
| <a name="input_image_web"></a> [image\_web](#input\_image\_web) | n/a | `string` | `"debian-8"` | no |
| <a name="input_interface_0_name"></a> [interface\_0\_name](#input\_interface\_0\_name) | n/a | `string` | `"management"` | no |
| <a name="input_interface_1_name"></a> [interface\_1\_name](#input\_interface\_1\_name) | n/a | `string` | `"untrust"` | no |
| <a name="input_interface_2_name"></a> [interface\_2\_name](#input\_interface\_2\_name) | n/a | `string` | `"trust"` | no |
| <a name="input_machine_cpu_fw"></a> [machine\_cpu\_fw](#input\_machine\_cpu\_fw) | n/a | `string` | `"Intel Skylake"` | no |
| <a name="input_machine_type_fw"></a> [machine\_type\_fw](#input\_machine\_type\_fw) | n/a | `string` | `"n1-standard-4"` | no |
| <a name="input_machine_type_web"></a> [machine\_type\_web](#input\_machine\_type\_web) | n/a | `string` | `"f1-micro"` | no |
| <a name="input_management-sub-ip_cidr_range"></a> [management-sub-ip\_cidr\_range](#input\_management-sub-ip\_cidr\_range) | n/a | `string` | `"10.0.0.0/24"` | no |
| <a name="input_next_hop_internet"></a> [next\_hop\_internet](#input\_next\_hop\_internet) | URL to a gateway that should handle matching packets. Currently, you can only specify the internet gateway, using a full or partial valid URL | `bool` | n/a | yes |
| <a name="input_parent_folder"></a> [parent\_folder](#input\_parent\_folder) | Optional - for an organization with existing projects or for development/validation. It will place all the example foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist. Must be the same value used in previous step. | `string` | `""` | no |
| <a name="input_preactivate_partner_interconnect"></a> [preactivate\_partner\_interconnect](#input\_preactivate\_partner\_interconnect) | Preactivate Partner Interconnect VLAN attachment in the environment. | `bool` | `false` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The ID of the Google Cloud project | `string` | `"prj-c-interconnect-9791"` | no |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | n/a | `string` | `"admin:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDnYnPRM4fJzdYmG8K3zN3wkx2fS+mkT6zfjVkxY7MHDbQ9UlGsw6G0Z3a3S/huAzG1eLC4Oxw56u2vzFBbsT1da0tM4JD1IWCq2alisptZK8YRx9ddm/1kNlES8CbnN8VEzq9Rh+uA2F6i1zH33rNHXu0HuecS18sUAne5uiodH2L8pa/QWJgDrdL9oIrcD0sNkAZPmBoVN4XV4sDmj+qlL4zX6+kAy0Em1G3bGQQ4kTsEqDJB56+dezyAjvEfRTvmavPV5eftefIbX0rHRkNkdA7+IcjWkks64rQJMVra7RpevpuB9XnSQ+Aal41ZKr7tyIV8B9IKQXF5ZeznV31GEIIEseEcXHVdvWIT1UgTEz+/Tpg8zJwFfE/FbjFfkk8cXrKe7huofbsdk2YSBhMZRR27kSe+o9E0JCo13CzIxV2qj3iGx1D8oq4UuqOXmppnyfrbioF5QJeHj2tfpcceseNNZ6bLcIs7M7L2IXsAH1XKQLBCRt1cv8NfrvWMNV8= admin"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-west1"` | no |
| <a name="input_region_zone"></a> [region\_zone](#input\_region\_zone) | n/a | `string` | `"us-west1-a"` | no |
| <a name="input_restricted_hub_dns_enable_inbound_forwarding"></a> [restricted\_hub\_dns\_enable\_inbound\_forwarding](#input\_restricted\_hub\_dns\_enable\_inbound\_forwarding) | Toggle inbound query forwarding for Restricted Hub VPC DNS. | `bool` | `true` | no |
| <a name="input_restricted_hub_dns_enable_logging"></a> [restricted\_hub\_dns\_enable\_logging](#input\_restricted\_hub\_dns\_enable\_logging) | Toggle DNS logging for Restricted Hub VPC DNS. | `bool` | `true` | no |
| <a name="input_restricted_hub_firewall_enable_logging"></a> [restricted\_hub\_firewall\_enable\_logging](#input\_restricted\_hub\_firewall\_enable\_logging) | Toggle firewall logging for VPC Firewalls in Restricted Hub VPC. | `bool` | `true` | no |
| <a name="input_restricted_hub_nat_bgp_asn"></a> [restricted\_hub\_nat\_bgp\_asn](#input\_restricted\_hub\_nat\_bgp\_asn) | BGP ASN for first NAT cloud routes in Restricted Hub. | `number` | `64514` | no |
| <a name="input_restricted_hub_nat_enabled"></a> [restricted\_hub\_nat\_enabled](#input\_restricted\_hub\_nat\_enabled) | Toggle creation of NAT cloud router in Restricted Hub. | `bool` | `false` | no |
| <a name="input_restricted_hub_nat_num_addresses_region1"></a> [restricted\_hub\_nat\_num\_addresses\_region1](#input\_restricted\_hub\_nat\_num\_addresses\_region1) | Number of external IPs to reserve for first Cloud NAT in Restricted Hub. | `number` | `2` | no |
| <a name="input_restricted_hub_nat_num_addresses_region2"></a> [restricted\_hub\_nat\_num\_addresses\_region2](#input\_restricted\_hub\_nat\_num\_addresses\_region2) | Number of external IPs to reserve for second Cloud NAT in Restricted Hub. | `number` | `2` | no |
| <a name="input_restricted_hub_optional_fw_rules_enabled"></a> [restricted\_hub\_optional\_fw\_rules\_enabled](#input\_restricted\_hub\_optional\_fw\_rules\_enabled) | Toggle creation of optional firewall rules: IAP SSH, IAP RDP and Internal & Global load balancing health check and load balancing IP ranges in Restricted Hub VPC. | `bool` | `false` | no |
| <a name="input_restricted_hub_windows_activation_enabled"></a> [restricted\_hub\_windows\_activation\_enabled](#input\_restricted\_hub\_windows\_activation\_enabled) | Enable Windows license activation for Windows workloads in Restricted Hub. | `bool` | `false` | no |
| <a name="input_scopes_fw"></a> [scopes\_fw](#input\_scopes\_fw) | n/a | `list` | <pre>[<br>  "https://www.googleapis.com/auth/cloud.useraccounts.readonly",<br>  "https://www.googleapis.com/auth/devstorage.read_only",<br>  "https://www.googleapis.com/auth/logging.write",<br>  "https://www.googleapis.com/auth/monitoring.write",<br>  "https://www.googleapis.com/auth/compute"<br>]</pre> | no |
| <a name="input_scopes_web"></a> [scopes\_web](#input\_scopes\_web) | n/a | `list` | <pre>[<br>  "https://www.googleapis.com/auth/cloud.useraccounts.readonly",<br>  "https://www.googleapis.com/auth/devstorage.read_only",<br>  "https://www.googleapis.com/auth/logging.write",<br>  "https://www.googleapis.com/auth/monitoring.write",<br>  "https://www.googleapis.com/auth/compute.readonly"<br>]</pre> | no |
| <a name="input_shared_vpc_host_project"></a> [shared\_vpc\_host\_project](#input\_shared\_vpc\_host\_project) | Toggle shared VPC host project | `bool` | `false` | no |
| <a name="input_subnet_private_access"></a> [subnet\_private\_access](#input\_subnet\_private\_access) | When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access. | `bool` | `true` | no |
| <a name="input_subnetworks_enable_logging"></a> [subnetworks\_enable\_logging](#input\_subnetworks\_enable\_logging) | Toggle subnetworks flow logging for VPC Subnetworks. | `bool` | `true` | no |
| <a name="input_trust-dest_range"></a> [trust-dest\_range](#input\_trust-dest\_range) | n/a | `string` | `"0.0.0.0/0"` | no |
| <a name="input_trust-sub-ip_cidr_range"></a> [trust-sub-ip\_cidr\_range](#input\_trust-sub-ip\_cidr\_range) | n/a | `string` | `"10.0.2.0/24"` | no |
| <a name="input_untrust-sub-ip_cidr_range"></a> [untrust-sub-ip\_cidr\_range](#input\_untrust-sub-ip\_cidr\_range) | n/a | `string` | `"10.0.1.0/24"` | no |
| <a name="input_web_server_name"></a> [web\_server\_name](#input\_web\_server\_name) | WEB-SERVER Vaiables | `string` | `"webserver"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `string` | `"us-west1-a"` | no |
| <a name="input_zone_2"></a> [zone\_2](#input\_zone\_2) | n/a | `string` | `"us-west1-b"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_hub_project_id"></a> [dns\_hub\_project\_id](#output\_dns\_hub\_project\_id) | The DNS hub project ID |
| <a name="output_elb_public_ip"></a> [elb\_public\_ip](#output\_elb\_public\_ip) | n/a |
| <a name="output_firewall-name"></a> [firewall-name](#output\_firewall-name) | n/a |
| <a name="output_firewall-untrust-ips-for-nat-healthcheck"></a> [firewall-untrust-ips-for-nat-healthcheck](#output\_firewall-untrust-ips-for-nat-healthcheck) | n/a |
| <a name="output_internal-lb-ip-for-nat-healthcheck"></a> [internal-lb-ip-for-nat-healthcheck](#output\_internal-lb-ip-for-nat-healthcheck) | n/a |

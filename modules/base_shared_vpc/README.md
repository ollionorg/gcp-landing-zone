
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
| <a name="module_base_gcr"></a> [base\_gcr](#module\_base\_gcr) | ../../modules/terraform-google-cloud-dns | n/a |
| <a name="module_base_pkg_dev"></a> [base\_pkg\_dev](#module\_base\_pkg\_dev) | ../../modules/terraform-google-cloud-dns | n/a |
| <a name="module_main"></a> [main](#module\_main) | ../../modules/terraform-google-network | n/a |
| <a name="module_peering"></a> [peering](#module\_peering) | ../../modules/terraform-google-network/modules/network-peering | n/a |
| <a name="module_peering_zone"></a> [peering\_zone](#module\_peering\_zone) | ../../modules/terraform-google-cloud-dns | n/a |
| <a name="module_private_googleapis"></a> [private\_googleapis](#module\_private\_googleapis) | ../../modules/terraform-google-cloud-dns | n/a |
| <a name="module_region1_router1"></a> [region1\_router1](#module\_region1\_router1) | ../../modules/terraform-google-cloud-router | n/a |
| <a name="module_region1_router2"></a> [region1\_router2](#module\_region1\_router2) | ../../modules/terraform-google-cloud-router | n/a |
| <a name="module_region2_router1"></a> [region2\_router1](#module\_region2\_router1) | ../../modules/terraform-google-cloud-router | n/a |
| <a name="module_region2_router2"></a> [region2\_router2](#module\_region2\_router2) | ../../modules/terraform-google-cloud-router | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_address.nat_external_addresses_region1](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_address.nat_external_addresses_region2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_firewall.allow_all_egress](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow_all_ingress](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow_iap_rdp](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow_iap_ssh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow_lb](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow_private_api_egress](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow_windows_activation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.deny_all_egress](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_global_address.private_service_access_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_router.nat_router_region1](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router.nat_router_region2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_nat.egress_nat2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
| [google_compute_router_nat.egress_nat_region1](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
| [google_dns_policy.default_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_policy) | resource |
| [google_service_networking_connection.private_vpc_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |
| [google_active_folder.common](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/active_folder) | data source |
| [google_compute_network.vpc_base_net_hub](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) | data source |
| [google_compute_network.vpc_dns_hub](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) | data source |
| [google_netblock_ip_ranges.health_checkers](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/netblock_ip_ranges) | data source |
| [google_netblock_ip_ranges.iap_forwarders](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/netblock_ip_ranges) | data source |
| [google_netblock_ip_ranges.legacy_health_checkers](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/netblock_ip_ranges) | data source |
| [google_projects.base_net_hub](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |
| [google_projects.dns_hub](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_all_egress_ranges"></a> [allow\_all\_egress\_ranges](#input\_allow\_all\_egress\_ranges) | List of network ranges to which all egress traffic will be allowed | `any` | `null` | no |
| <a name="input_allow_all_ingress_ranges"></a> [allow\_all\_ingress\_ranges](#input\_allow\_all\_ingress\_ranges) | List of network ranges from which all ingress traffic will be allowed | `any` | `null` | no |
| <a name="input_bgp_asn_subnet"></a> [bgp\_asn\_subnet](#input\_bgp\_asn\_subnet) | BGP ASN for Subnets cloud routers. | `number` | n/a | yes |
| <a name="input_default_region1"></a> [default\_region1](#input\_default\_region1) | Default region 1 for subnets and Cloud Routers | `string` | n/a | yes |
| <a name="input_default_region2"></a> [default\_region2](#input\_default\_region2) | Default region 2 for subnets and Cloud Routers | `string` | n/a | yes |
| <a name="input_dns_enable_inbound_forwarding"></a> [dns\_enable\_inbound\_forwarding](#input\_dns\_enable\_inbound\_forwarding) | Toggle inbound query forwarding for VPC DNS. | `bool` | `true` | no |
| <a name="input_dns_enable_logging"></a> [dns\_enable\_logging](#input\_dns\_enable\_logging) | Toggle DNS logging for VPC DNS. | `bool` | `true` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | The DNS name of peering managed zone, for instance 'example.com.' | `string` | n/a | yes |
| <a name="input_environment_code"></a> [environment\_code](#input\_environment\_code) | A short form of the folder level resources (environment) within the Google Cloud organization. | `string` | n/a | yes |
| <a name="input_firewall_enable_logging"></a> [firewall\_enable\_logging](#input\_firewall\_enable\_logging) | Toggle firewall logging for VPC Firewalls. | `bool` | `true` | no |
| <a name="input_folder_prefix"></a> [folder\_prefix](#input\_folder\_prefix) | Name prefix to use for folders created. | `string` | `"fldr"` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Network deployment mode, should be set to `hub` or `spoke` when `enable_hub_and_spoke` architecture chosen, keep as `null` otherwise. | `string` | `null` | no |
| <a name="input_nat_bgp_asn"></a> [nat\_bgp\_asn](#input\_nat\_bgp\_asn) | BGP ASN for first NAT cloud routes. | `number` | `0` | no |
| <a name="input_nat_enabled"></a> [nat\_enabled](#input\_nat\_enabled) | Toggle creation of NAT cloud router. | `bool` | `false` | no |
| <a name="input_nat_num_addresses"></a> [nat\_num\_addresses](#input\_nat\_num\_addresses) | Number of external IPs to reserve for Cloud NAT. | `number` | `2` | no |
| <a name="input_nat_num_addresses_region1"></a> [nat\_num\_addresses\_region1](#input\_nat\_num\_addresses\_region1) | Number of external IPs to reserve for first Cloud NAT. | `number` | `2` | no |
| <a name="input_nat_num_addresses_region2"></a> [nat\_num\_addresses\_region2](#input\_nat\_num\_addresses\_region2) | Number of external IPs to reserve for second Cloud NAT. | `number` | `2` | no |
| <a name="input_optional_fw_rules_enabled"></a> [optional\_fw\_rules\_enabled](#input\_optional\_fw\_rules\_enabled) | Toggle creation of optional firewall rules: IAP SSH, IAP RDP and Internal & Global load balancing health check and load balancing IP ranges. | `bool` | `false` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Organization ID | `string` | n/a | yes |
| <a name="input_parent_folder"></a> [parent\_folder](#input\_parent\_folder) | Optional - if using a folder for testing. | `string` | `""` | no |
| <a name="input_private_service_cidr"></a> [private\_service\_cidr](#input\_private\_service\_cidr) | CIDR range for private service networking. Used for Cloud SQL and other managed services. | `string` | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID for Private Shared VPC. | `string` | n/a | yes |
| <a name="input_secondary_ranges"></a> [secondary\_ranges](#input\_secondary\_ranges) | Secondary ranges that will be used in some of the subnets | `map(list(object({ range_name = string, ip_cidr_range = string })))` | `{}` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | The list of subnets being created | `list(map(string))` | `[]` | no |
| <a name="input_windows_activation_enabled"></a> [windows\_activation\_enabled](#input\_windows\_activation\_enabled) | Enable Windows license activation for Windows workloads. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | The name of the VPC being created |
| <a name="output_network_self_link"></a> [network\_self\_link](#output\_network\_self\_link) | The URI of the VPC being created |
| <a name="output_region1_router1"></a> [region1\_router1](#output\_region1\_router1) | Router 1 for Region 1 |
| <a name="output_region1_router2"></a> [region1\_router2](#output\_region1\_router2) | Router 2 for Region 1 |
| <a name="output_region2_router1"></a> [region2\_router1](#output\_region2\_router1) | Router 1 for Region 2 |
| <a name="output_region2_router2"></a> [region2\_router2](#output\_region2\_router2) | Router 2 for Region 2 |
| <a name="output_subnets_flow_logs"></a> [subnets\_flow\_logs](#output\_subnets\_flow\_logs) | Whether the subnets have VPC flow logs enabled |
| <a name="output_subnets_ips"></a> [subnets\_ips](#output\_subnets\_ips) | The IPs and CIDRs of the subnets being created |
| <a name="output_subnets_names"></a> [subnets\_names](#output\_subnets\_names) | The names of the subnets being created |
| <a name="output_subnets_private_access"></a> [subnets\_private\_access](#output\_subnets\_private\_access) | Whether the subnets have access to Google API's without a public IP |
| <a name="output_subnets_regions"></a> [subnets\_regions](#output\_subnets\_regions) | The region where the subnets will be created |
| <a name="output_subnets_secondary_ranges"></a> [subnets\_secondary\_ranges](#output\_subnets\_secondary\_ranges) | The secondary ranges associated with these subnets |
| <a name="output_subnets_self_links"></a> [subnets\_self\_links](#output\_subnets\_self\_links) | The self-links of subnets being created |

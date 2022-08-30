
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
| <a name="module_interconnect_attachment1_region1"></a> [interconnect\_attachment1\_region1](#module\_interconnect\_attachment1\_region1) | ../../modules/interconnect_attachment | n/a |
| <a name="module_interconnect_attachment1_region2"></a> [interconnect\_attachment1\_region2](#module\_interconnect\_attachment1\_region2) | ../../modules/interconnect_attachment | n/a |
| <a name="module_interconnect_attachment2_region1"></a> [interconnect\_attachment2\_region1](#module\_interconnect\_attachment2\_region1) | ../../modules/interconnect_attachment | n/a |
| <a name="module_interconnect_attachment2_region2"></a> [interconnect\_attachment2\_region2](#module\_interconnect\_attachment2\_region2) | ../../modules/interconnect_attachment | n/a |

## Resources

| Name | Type |
|------|------|
| [google_active_folder.common](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/active_folder) | data source |
| [google_projects.interconnect_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_router_labels"></a> [cloud\_router\_labels](#input\_cloud\_router\_labels) | A map of suffixes for labelling vlans with four entries like "vlan\_1" => "suffix1" with keys from `vlan_1` to `vlan_4`. | `map(string)` | `{}` | no |
| <a name="input_folder_prefix"></a> [folder\_prefix](#input\_folder\_prefix) | Name prefix to use for folders created. | `string` | `"fldr"` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Organization ID | `string` | n/a | yes |
| <a name="input_parent_folder"></a> [parent\_folder](#input\_parent\_folder) | Optional - if using a folder for testing. | `string` | `""` | no |
| <a name="input_peer_asn"></a> [peer\_asn](#input\_peer\_asn) | Peer BGP Autonomous System Number (ASN). | `number` | n/a | yes |
| <a name="input_peer_name"></a> [peer\_name](#input\_peer\_name) | Name of this BGP peer. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? | `string` | n/a | yes |
| <a name="input_region1"></a> [region1](#input\_region1) | First subnet region. The Dedicated Interconnect module only configures two regions. | `string` | n/a | yes |
| <a name="input_region1_interconnect1"></a> [region1\_interconnect1](#input\_region1\_interconnect1) | URL of the underlying Interconnect object that this attachment's traffic will traverse through. | `string` | n/a | yes |
| <a name="input_region1_interconnect1_candidate_subnets"></a> [region1\_interconnect1\_candidate\_subnets](#input\_region1\_interconnect1\_candidate\_subnets) | Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc). | `list(string)` | `null` | no |
| <a name="input_region1_interconnect1_location"></a> [region1\_interconnect1\_location](#input\_region1\_interconnect1\_location) | Name of the interconnect location used in the creation of the Interconnect for the first location of region1 | `string` | n/a | yes |
| <a name="input_region1_interconnect1_vlan_tag8021q"></a> [region1\_interconnect1\_vlan\_tag8021q](#input\_region1\_interconnect1\_vlan\_tag8021q) | The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094. | `string` | `null` | no |
| <a name="input_region1_interconnect2"></a> [region1\_interconnect2](#input\_region1\_interconnect2) | URL of the underlying Interconnect object that this attachment's traffic will traverse through. | `string` | n/a | yes |
| <a name="input_region1_interconnect2_candidate_subnets"></a> [region1\_interconnect2\_candidate\_subnets](#input\_region1\_interconnect2\_candidate\_subnets) | Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc). | `list(string)` | `null` | no |
| <a name="input_region1_interconnect2_location"></a> [region1\_interconnect2\_location](#input\_region1\_interconnect2\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region1 | `string` | n/a | yes |
| <a name="input_region1_interconnect2_vlan_tag8021q"></a> [region1\_interconnect2\_vlan\_tag8021q](#input\_region1\_interconnect2\_vlan\_tag8021q) | The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094. | `string` | `null` | no |
| <a name="input_region1_router1_name"></a> [region1\_router1\_name](#input\_region1\_router1\_name) | Name of the Router 1 for Region 1 where the attachment resides. | `string` | n/a | yes |
| <a name="input_region1_router2_name"></a> [region1\_router2\_name](#input\_region1\_router2\_name) | Name of the Router 2 for Region 1 where the attachment resides. | `string` | n/a | yes |
| <a name="input_region2"></a> [region2](#input\_region2) | Second subnet region. The Dedicated Interconnect module only configures two regions. | `string` | n/a | yes |
| <a name="input_region2_interconnect1"></a> [region2\_interconnect1](#input\_region2\_interconnect1) | URL of the underlying Interconnect object that this attachment's traffic will traverse through. | `string` | n/a | yes |
| <a name="input_region2_interconnect1_candidate_subnets"></a> [region2\_interconnect1\_candidate\_subnets](#input\_region2\_interconnect1\_candidate\_subnets) | Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc). | `list(string)` | `null` | no |
| <a name="input_region2_interconnect1_location"></a> [region2\_interconnect1\_location](#input\_region2\_interconnect1\_location) | Name of the interconnect location used in the creation of the Interconnect for the first location of region2 | `string` | n/a | yes |
| <a name="input_region2_interconnect1_vlan_tag8021q"></a> [region2\_interconnect1\_vlan\_tag8021q](#input\_region2\_interconnect1\_vlan\_tag8021q) | The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094. | `string` | `null` | no |
| <a name="input_region2_interconnect2"></a> [region2\_interconnect2](#input\_region2\_interconnect2) | URL of the underlying Interconnect object that this attachment's traffic will traverse through. | `string` | n/a | yes |
| <a name="input_region2_interconnect2_candidate_subnets"></a> [region2\_interconnect2\_candidate\_subnets](#input\_region2\_interconnect2\_candidate\_subnets) | Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc). | `list(string)` | `null` | no |
| <a name="input_region2_interconnect2_location"></a> [region2\_interconnect2\_location](#input\_region2\_interconnect2\_location) | Name of the interconnect location used in the creation of the Interconnect for the second location of region2 | `string` | n/a | yes |
| <a name="input_region2_interconnect2_vlan_tag8021q"></a> [region2\_interconnect2\_vlan\_tag8021q](#input\_region2\_interconnect2\_vlan\_tag8021q) | The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094. | `string` | `null` | no |
| <a name="input_region2_router1_name"></a> [region2\_router1\_name](#input\_region2\_router1\_name) | Name of the Router 1 for Region 2 where the attachment resides. | `string` | n/a | yes |
| <a name="input_region2_router2_name"></a> [region2\_router2\_name](#input\_region2\_router2\_name) | Name of the Router 2 for Region 2 where the attachment resides | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Label to identify the VPC associated with shared VPC that will use the Interconnect. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_interconnect_attachment1_region1"></a> [interconnect\_attachment1\_region1](#output\_interconnect\_attachment1\_region1) | The interconnect attachment 1 for region 1 |
| <a name="output_interconnect_attachment1_region1_customer_router_ip_address"></a> [interconnect\_attachment1\_region1\_customer\_router\_ip\_address](#output\_interconnect\_attachment1\_region1\_customer\_router\_ip\_address) | IPv4 address + prefix length to be configured on the customer router subinterface for this interconnect attachment. |
| <a name="output_interconnect_attachment1_region2"></a> [interconnect\_attachment1\_region2](#output\_interconnect\_attachment1\_region2) | The interconnect attachment 1 for region 2 |
| <a name="output_interconnect_attachment1_region2_customer_router_ip_address"></a> [interconnect\_attachment1\_region2\_customer\_router\_ip\_address](#output\_interconnect\_attachment1\_region2\_customer\_router\_ip\_address) | IPv4 address + prefix length to be configured on the customer router subinterface for this interconnect attachment. |
| <a name="output_interconnect_attachment2_region1"></a> [interconnect\_attachment2\_region1](#output\_interconnect\_attachment2\_region1) | The interconnect attachment 2 for region 1 |
| <a name="output_interconnect_attachment2_region1_customer_router_ip_address"></a> [interconnect\_attachment2\_region1\_customer\_router\_ip\_address](#output\_interconnect\_attachment2\_region1\_customer\_router\_ip\_address) | IPv4 address + prefix length to be configured on the customer router subinterface for this interconnect attachment. |
| <a name="output_interconnect_attachment2_region2"></a> [interconnect\_attachment2\_region2](#output\_interconnect\_attachment2\_region2) | The interconnect attachment 2 for region 2 |
| <a name="output_interconnect_attachment2_region2_customer_router_ip_address"></a> [interconnect\_attachment2\_region2\_customer\_router\_ip\_address](#output\_interconnect\_attachment2\_region2\_customer\_router\_ip\_address) | IPv4 address + prefix length to be configured on the customer router subinterface for this interconnect attachment. |


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpn_ha_region1_router1"></a> [vpn\_ha\_region1\_router1](#module\_vpn\_ha\_region1\_router1) | ../../modules/vpn_ha | n/a |
| <a name="module_vpn_ha_region1_router2"></a> [vpn\_ha\_region1\_router2](#module\_vpn\_ha\_region1\_router2) | ../../modules/vpn_ha | n/a |
| <a name="module_vpn_ha_region2_router1"></a> [vpn\_ha\_region2\_router1](#module\_vpn\_ha\_region2\_router1) | ../../modules/vpn_ha | n/a |
| <a name="module_vpn_ha_region2_router2"></a> [vpn\_ha\_region2\_router2](#module\_vpn\_ha\_region2\_router2) | ../../modules/vpn_ha | n/a |

## Resources

| Name | Type |
|------|------|
| [google_active_folder.env](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/active_folder) | data source |
| [google_projects.env_secrets](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/projects) | data source |
| [google_secret_manager_secret_version.psk](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/secret_manager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bgp_peer_asn"></a> [bgp\_peer\_asn](#input\_bgp\_peer\_asn) | BGP ASN for cloud routes. | `number` | n/a | yes |
| <a name="input_default_region1"></a> [default\_region1](#input\_default\_region1) | Default region 1 for Cloud Routers | `string` | n/a | yes |
| <a name="input_default_region2"></a> [default\_region2](#input\_default\_region2) | Default region 2 for Cloud Routers | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment for the VPN configuration. Valid options are development, non-production, production | `string` | n/a | yes |
| <a name="input_folder_prefix"></a> [folder\_prefix](#input\_folder\_prefix) | Name prefix to use for folders created. | `string` | `"fldr"` | no |
| <a name="input_on_prem_router_ip_address1"></a> [on\_prem\_router\_ip\_address1](#input\_on\_prem\_router\_ip\_address1) | On-Prem Router IP address | `string` | n/a | yes |
| <a name="input_on_prem_router_ip_address2"></a> [on\_prem\_router\_ip\_address2](#input\_on\_prem\_router\_ip\_address2) | On-Prem Router IP address | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Organization ID | `string` | n/a | yes |
| <a name="input_parent_folder"></a> [parent\_folder](#input\_parent\_folder) | Optional - if using a folder for testing. | `string` | `""` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | VPC Project ID | `string` | n/a | yes |
| <a name="input_region1_router1_name"></a> [region1\_router1\_name](#input\_region1\_router1\_name) | Name of the Router 1 for Region 1 where the attachment resides. | `string` | n/a | yes |
| <a name="input_region1_router1_tunnel0_bgp_peer_address"></a> [region1\_router1\_tunnel0\_bgp\_peer\_address](#input\_region1\_router1\_tunnel0\_bgp\_peer\_address) | BGP session address for router 1 in region 1 tunnel 0 | `string` | n/a | yes |
| <a name="input_region1_router1_tunnel0_bgp_peer_range"></a> [region1\_router1\_tunnel0\_bgp\_peer\_range](#input\_region1\_router1\_tunnel0\_bgp\_peer\_range) | BGP session range for router 1 in region 1 tunnel 0 | `string` | n/a | yes |
| <a name="input_region1_router1_tunnel1_bgp_peer_address"></a> [region1\_router1\_tunnel1\_bgp\_peer\_address](#input\_region1\_router1\_tunnel1\_bgp\_peer\_address) | BGP session address for router 1 in region 1 tunnel 1 | `string` | n/a | yes |
| <a name="input_region1_router1_tunnel1_bgp_peer_range"></a> [region1\_router1\_tunnel1\_bgp\_peer\_range](#input\_region1\_router1\_tunnel1\_bgp\_peer\_range) | BGP session range for router 1 in region 1 tunnel 1 | `string` | n/a | yes |
| <a name="input_region1_router2_name"></a> [region1\_router2\_name](#input\_region1\_router2\_name) | Name of the Router 2 for Region 1 where the attachment resides. | `string` | n/a | yes |
| <a name="input_region1_router2_tunnel0_bgp_peer_address"></a> [region1\_router2\_tunnel0\_bgp\_peer\_address](#input\_region1\_router2\_tunnel0\_bgp\_peer\_address) | BGP session address for router 2 in region 1 tunnel 0 | `string` | n/a | yes |
| <a name="input_region1_router2_tunnel0_bgp_peer_range"></a> [region1\_router2\_tunnel0\_bgp\_peer\_range](#input\_region1\_router2\_tunnel0\_bgp\_peer\_range) | BGP session range for router 2 in region 1 tunnel 0 | `string` | n/a | yes |
| <a name="input_region1_router2_tunnel1_bgp_peer_address"></a> [region1\_router2\_tunnel1\_bgp\_peer\_address](#input\_region1\_router2\_tunnel1\_bgp\_peer\_address) | BGP session address for router 2 in region 1 tunnel 1 | `string` | n/a | yes |
| <a name="input_region1_router2_tunnel1_bgp_peer_range"></a> [region1\_router2\_tunnel1\_bgp\_peer\_range](#input\_region1\_router2\_tunnel1\_bgp\_peer\_range) | BGP session range for router 2 in region 1 tunnel 1 | `string` | n/a | yes |
| <a name="input_region2_router1_name"></a> [region2\_router1\_name](#input\_region2\_router1\_name) | Name of the Router 1 for Region 2 where the attachment resides. | `string` | n/a | yes |
| <a name="input_region2_router1_tunnel0_bgp_peer_address"></a> [region2\_router1\_tunnel0\_bgp\_peer\_address](#input\_region2\_router1\_tunnel0\_bgp\_peer\_address) | BGP session address for router 1 in region 2 tunnel 0 | `string` | n/a | yes |
| <a name="input_region2_router1_tunnel0_bgp_peer_range"></a> [region2\_router1\_tunnel0\_bgp\_peer\_range](#input\_region2\_router1\_tunnel0\_bgp\_peer\_range) | BGP session range for router 1 in region 2 tunnel 0 | `string` | n/a | yes |
| <a name="input_region2_router1_tunnel1_bgp_peer_address"></a> [region2\_router1\_tunnel1\_bgp\_peer\_address](#input\_region2\_router1\_tunnel1\_bgp\_peer\_address) | BGP session address for router 1 in region 2 tunnel 2 | `string` | n/a | yes |
| <a name="input_region2_router1_tunnel1_bgp_peer_range"></a> [region2\_router1\_tunnel1\_bgp\_peer\_range](#input\_region2\_router1\_tunnel1\_bgp\_peer\_range) | BGP session range for router 1 in region 2 tunnel 2 | `string` | n/a | yes |
| <a name="input_region2_router2_name"></a> [region2\_router2\_name](#input\_region2\_router2\_name) | Name of the Router 2 for Region 2 where the attachment resides | `string` | n/a | yes |
| <a name="input_region2_router2_tunnel0_bgp_peer_address"></a> [region2\_router2\_tunnel0\_bgp\_peer\_address](#input\_region2\_router2\_tunnel0\_bgp\_peer\_address) | BGP session address for router 2 in region 2 tunnel 0 | `string` | n/a | yes |
| <a name="input_region2_router2_tunnel0_bgp_peer_range"></a> [region2\_router2\_tunnel0\_bgp\_peer\_range](#input\_region2\_router2\_tunnel0\_bgp\_peer\_range) | BGP session range for router 2 in region 2 tunnel 0 | `string` | n/a | yes |
| <a name="input_region2_router2_tunnel1_bgp_peer_address"></a> [region2\_router2\_tunnel1\_bgp\_peer\_address](#input\_region2\_router2\_tunnel1\_bgp\_peer\_address) | BGP session address for router 2 in region 1 tunnel 1 | `string` | n/a | yes |
| <a name="input_region2_router2_tunnel1_bgp_peer_range"></a> [region2\_router2\_tunnel1\_bgp\_peer\_range](#input\_region2\_router2\_tunnel1\_bgp\_peer\_range) | BGP session range for router 2 in region 1 tunnel 1 | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Label to identify the VPC associated with shared VPC that will use the Interconnect. | `string` | n/a | yes |
| <a name="input_vpn_psk_secret_name"></a> [vpn\_psk\_secret\_name](#input\_vpn\_psk\_secret\_name) | The name of the secret to retrieve from secret manager. This will be retrieved from the environment secrets project. | `string` | n/a | yes |

## Outputs

No outputs.

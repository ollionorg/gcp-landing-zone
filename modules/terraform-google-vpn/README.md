## Requirements
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.89 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_address.vpn_gw_ip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_forwarding_rule.vpn_esp](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_forwarding_rule) | resource |
| [google_compute_forwarding_rule.vpn_udp4500](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_forwarding_rule) | resource |
| [google_compute_forwarding_rule.vpn_udp500](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_forwarding_rule) | resource |
| [google_compute_route.route](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_route) | resource |
| [google_compute_router_interface.router_interface](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_interface) | resource |
| [google_compute_router_peer.bgp_peer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_peer) | resource |
| [google_compute_vpn_gateway.vpn_gateway](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_vpn_gateway) | resource |
| [google_compute_vpn_tunnel.tunnel-dynamic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_vpn_tunnel) | resource |
| [google_compute_vpn_tunnel.tunnel-static](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_vpn_tunnel) | resource |
| [random_id.ipsec_secret](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_advertised_route_priority"></a> [advertised\_route\_priority](#input\_advertised\_route\_priority) | Please enter the priority for the advertised route to BGP peer(default is 100) | `number` | `100` | no |
| <a name="input_bgp_cr_session_range"></a> [bgp\_cr\_session\_range](#input\_bgp\_cr\_session\_range) | Please enter the cloud-router interface IP/Session IP | `list(string)` | <pre>[<br>  "169.254.1.1/30",<br>  "169.254.1.5/30"<br>]</pre> | no |
| <a name="input_bgp_remote_session_range"></a> [bgp\_remote\_session\_range](#input\_bgp\_remote\_session\_range) | Please enter the remote environments BGP Session IP | `list(string)` | <pre>[<br>  "169.254.1.2",<br>  "169.254.1.6"<br>]</pre> | no |
| <a name="input_cr_enabled"></a> [cr\_enabled](#input\_cr\_enabled) | If there is a cloud router for BGP routing | `bool` | `false` | no |
| <a name="input_cr_name"></a> [cr\_name](#input\_cr\_name) | The name of cloud router for BGP routing | `string` | `""` | no |
| <a name="input_gateway_name"></a> [gateway\_name](#input\_gateway\_name) | The name of VPN gateway | `string` | `"test-vpn"` | no |
| <a name="input_ike_version"></a> [ike\_version](#input\_ike\_version) | Please enter the IKE version used by this tunnel (default is IKEv2) | `number` | `2` | no |
| <a name="input_local_traffic_selector"></a> [local\_traffic\_selector](#input\_local\_traffic\_selector) | Local traffic selector to use when establishing the VPN tunnel with peer VPN gateway.<br>Value should be list of CIDR formatted strings and ranges should be disjoint. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_network"></a> [network](#input\_network) | The name of VPC being created | `string` | n/a | yes |
| <a name="input_peer_asn"></a> [peer\_asn](#input\_peer\_asn) | Please enter the ASN of the BGP peer that cloud router will use | `list(string)` | <pre>[<br>  "65101"<br>]</pre> | no |
| <a name="input_peer_ips"></a> [peer\_ips](#input\_peer\_ips) | IP address of remote-peer/gateway | `list(string)` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project where this VPC will be created | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region in which you want to create the VPN gateway | `string` | n/a | yes |
| <a name="input_remote_subnet"></a> [remote\_subnet](#input\_remote\_subnet) | remote subnet ip range in CIDR format - x.x.x.x/x | `list(string)` | `[]` | no |
| <a name="input_remote_traffic_selector"></a> [remote\_traffic\_selector](#input\_remote\_traffic\_selector) | Remote traffic selector to use when establishing the VPN tunnel with peer VPN gateway.<br>Value should be list of CIDR formatted strings and ranges should be disjoint. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_route_priority"></a> [route\_priority](#input\_route\_priority) | Priority for static route being created | `number` | `1000` | no |
| <a name="input_route_tags"></a> [route\_tags](#input\_route\_tags) | A list of instance tags to which this route applies. | `list(string)` | `[]` | no |
| <a name="input_shared_secret"></a> [shared\_secret](#input\_shared\_secret) | Please enter the shared secret/pre-shared key | `string` | `""` | no |
| <a name="input_tunnel_count"></a> [tunnel\_count](#input\_tunnel\_count) | The number of tunnels from each VPN gw (default is 1) | `number` | `1` | no |
| <a name="input_tunnel_name_prefix"></a> [tunnel\_name\_prefix](#input\_tunnel\_name\_prefix) | The optional custom name of VPN tunnel being created | `string` | `""` | no |
| <a name="input_vpn_gw_ip"></a> [vpn\_gw\_ip](#input\_vpn\_gw\_ip) | Please enter the public IP address of the VPN Gateway, if you have already one. Do not set this variable to autocreate one | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gateway_ip"></a> [gateway\_ip](#output\_gateway\_ip) | The VPN Gateway Public IP |
| <a name="output_gateway_self_link"></a> [gateway\_self\_link](#output\_gateway\_self\_link) | The self-link of the Gateway |
| <a name="output_ipsec_secret-dynamic"></a> [ipsec\_secret-dynamic](#output\_ipsec\_secret-dynamic) | The secret |
| <a name="output_ipsec_secret-static"></a> [ipsec\_secret-static](#output\_ipsec\_secret-static) | The secret |
| <a name="output_name"></a> [name](#output\_name) | The name of the Gateway |
| <a name="output_network"></a> [network](#output\_network) | The name of the VPC |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | The Project-ID |
| <a name="output_vpn_tunnels_names-dynamic"></a> [vpn\_tunnels\_names-dynamic](#output\_vpn\_tunnels\_names-dynamic) | The VPN tunnel name is |
| <a name="output_vpn_tunnels_names-static"></a> [vpn\_tunnels\_names-static](#output\_vpn\_tunnels\_names-static) | The VPN tunnel name is |
| <a name="output_vpn_tunnels_self_link-dynamic"></a> [vpn\_tunnels\_self\_link-dynamic](#output\_vpn\_tunnels\_self\_link-dynamic) | The VPN tunnel self-link is |
| <a name="output_vpn_tunnels_self_link-static"></a> [vpn\_tunnels\_self\_link-static](#output\_vpn\_tunnels\_self\_link-static) | The VPN tunnel self-link is |


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_router_interface.interface](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_interface) | resource |
| [google_compute_router_peer.peers](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_peer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_interconnect_attachment"></a> [interconnect\_attachment](#input\_interconnect\_attachment) | The name or resource link to the VLAN interconnect for this interface | `string` | `null` | no |
| <a name="input_ip_range"></a> [ip\_range](#input\_ip\_range) | IP address and range of the interface | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the interface | `string` | n/a | yes |
| <a name="input_peers"></a> [peers](#input\_peers) | BGP peers for this interface. | `any` | `[]` | no |
| <a name="input_project"></a> [project](#input\_project) | The project ID to deploy to | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where the interface resides | `string` | n/a | yes |
| <a name="input_router"></a> [router](#input\_router) | Name of the router the interface resides | `string` | n/a | yes |
| <a name="input_vpn_tunnel"></a> [vpn\_tunnel](#input\_vpn\_tunnel) | The name or resource link to the VPN tunnel this interface will be linked to | `string` | `null` | no |

## Outputs

No outputs.


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_interface"></a> [interface](#module\_interface) | ../interface | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_interconnect_attachment.attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_interconnect_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_enabled"></a> [admin\_enabled](#input\_admin\_enabled) | Whether the VLAN attachment is enabled or disabled | `bool` | `true` | no |
| <a name="input_bandwidth"></a> [bandwidth](#input\_bandwidth) | Provisioned bandwidth capacity for the interconnect attachment | `string` | `"BPS_10G"` | no |
| <a name="input_candidate_subnets"></a> [candidate\_subnets](#input\_candidate\_subnets) | Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc). | `list(string)` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | An optional description of this resource | `string` | `null` | no |
| <a name="input_interconnect"></a> [interconnect](#input\_interconnect) | URL of the underlying Interconnect object that this attachment's traffic will traverse through. | `string` | n/a | yes |
| <a name="input_interface"></a> [interface](#input\_interface) | Interface to deploy for this attachment. | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the interconnect attachment | `string` | n/a | yes |
| <a name="input_peer"></a> [peer](#input\_peer) | BGP Peer for this attachment. | `any` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project ID to deploy to | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where the attachment resides | `string` | n/a | yes |
| <a name="input_router"></a> [router](#input\_router) | Name of the router the attachment resides | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | The type of InterconnectAttachment you wish to create | `string` | `"DEDICATED"` | no |
| <a name="input_vlan_tag8021q"></a> [vlan\_tag8021q](#input\_vlan\_tag8021q) | The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_attachment"></a> [attachment](#output\_attachment) | The created attachment |
| <a name="output_customer_router_ip_address"></a> [customer\_router\_ip\_address](#output\_customer\_router\_ip\_address) | IPv4 address + prefix length to be configured on the customer router subinterface for this interconnect attachment. |

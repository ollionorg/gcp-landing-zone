
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_compute_network_peering.local_network_peering](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_network_peering) | resource |
| [google-beta_google_compute_network_peering.peer_network_peering](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_network_peering) | resource |
| [null_resource.complete](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.module_depends_on](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_string.network_peering_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_export_local_custom_routes"></a> [export\_local\_custom\_routes](#input\_export\_local\_custom\_routes) | Export custom routes to peer network from local network. | `bool` | `false` | no |
| <a name="input_export_local_subnet_routes_with_public_ip"></a> [export\_local\_subnet\_routes\_with\_public\_ip](#input\_export\_local\_subnet\_routes\_with\_public\_ip) | Export custom routes to peer network from local network (defaults to true; causes the Local Peering Connection to align with the [provider default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering#export_subnet_routes_with_public_ip), and the Remote Peering Connection to be opposite the provider default). | `bool` | `true` | no |
| <a name="input_export_peer_custom_routes"></a> [export\_peer\_custom\_routes](#input\_export\_peer\_custom\_routes) | Export custom routes to local network from peer network. | `bool` | `false` | no |
| <a name="input_export_peer_subnet_routes_with_public_ip"></a> [export\_peer\_subnet\_routes\_with\_public\_ip](#input\_export\_peer\_subnet\_routes\_with\_public\_ip) | Export custom routes to local network from peer network (defaults to false; causes the Local Peering Connection to align with the [provider default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering#import_subnet_routes_with_public_ip), and the Remote Peering Connection to be opposite the provider default). | `bool` | `false` | no |
| <a name="input_local_network"></a> [local\_network](#input\_local\_network) | Resource link of the network to add a peering to. | `string` | n/a | yes |
| <a name="input_module_depends_on"></a> [module\_depends\_on](#input\_module\_depends\_on) | List of modules or resources this module depends on. | `list(any)` | `[]` | no |
| <a name="input_peer_network"></a> [peer\_network](#input\_peer\_network) | Resource link of the peer network. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Name prefix for the network peerings | `string` | `"network-peering"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_complete"></a> [complete](#output\_complete) | Output to be used as a module dependency. |
| <a name="output_local_network_peering"></a> [local\_network\_peering](#output\_local\_network\_peering) | Network peering resource. |
| <a name="output_peer_network_peering"></a> [peer\_network\_peering](#output\_peer\_network\_peering) | Peer network peering resource. |


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
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | >= 3.89 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_dns_managed_zone.forwarding](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_dns_managed_zone) | resource |
| [google-beta_google_dns_managed_zone.peering](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_dns_managed_zone) | resource |
| [google_dns_managed_zone.private](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_managed_zone) | resource |
| [google_dns_managed_zone.public](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_managed_zone) | resource |
| [google_dns_record_set.cloud-static-records](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_key_specs_key"></a> [default\_key\_specs\_key](#input\_default\_key\_specs\_key) | Object containing default key signing specifications : algorithm, key\_length, key\_type, kind. Please see https://www.terraform.io/docs/providers/google/r/dns_managed_zone.html#dnssec_config for futhers details | `any` | `{}` | no |
| <a name="input_default_key_specs_zone"></a> [default\_key\_specs\_zone](#input\_default\_key\_specs\_zone) | Object containing default zone signing specifications : algorithm, key\_length, key\_type, kind. Please see https://www.terraform.io/docs/providers/google/r/dns_managed_zone.html#dnssec_config for futhers details | `any` | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | zone description (shown in console) | `string` | `"Managed by Terraform"` | no |
| <a name="input_dnssec_config"></a> [dnssec\_config](#input\_dnssec\_config) | Object containing : kind, non\_existence, state. Please see https://www.terraform.io/docs/providers/google/r/dns_managed_zone.html#dnssec_config for futhers details | `any` | `{}` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Zone domain, must end with a period. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Zone name, must be unique within the project. | `string` | n/a | yes |
| <a name="input_private_visibility_config_networks"></a> [private\_visibility\_config\_networks](#input\_private\_visibility\_config\_networks) | List of VPC self links that can see this zone. | `list(string)` | `[]` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project id for the zone. | `string` | n/a | yes |
| <a name="input_recordsets"></a> [recordsets](#input\_recordsets) | List of DNS record objects to manage, in the standard terraform dns structure. | <pre>list(object({<br>    name    = string<br>    type    = string<br>    ttl     = number<br>    records = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_target_name_server_addresses"></a> [target\_name\_server\_addresses](#input\_target\_name\_server\_addresses) | List of target name servers for forwarding zone. | `list(string)` | `[]` | no |
| <a name="input_target_network"></a> [target\_network](#input\_target\_network) | Peering network. | `string` | `""` | no |
| <a name="input_type"></a> [type](#input\_type) | Type of zone to create, valid values are 'public', 'private', 'forwarding', 'peering'. | `string` | `"private"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain"></a> [domain](#output\_domain) | The DNS zone domain. |
| <a name="output_name"></a> [name](#output\_name) | The DNS zone name. |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | The DNS zone name servers. |
| <a name="output_type"></a> [type](#output\_type) | The DNS zone type. |


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.89 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.allow-admins](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow-internal](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow-tag-http](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow-tag-https](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow-tag-ssh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.custom](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_ranges"></a> [admin\_ranges](#input\_admin\_ranges) | IP CIDR ranges that have complete access to all subnets. | `list(string)` | `[]` | no |
| <a name="input_admin_ranges_enabled"></a> [admin\_ranges\_enabled](#input\_admin\_ranges\_enabled) | Enable admin ranges-based rules. | `bool` | `false` | no |
| <a name="input_custom_rules"></a> [custom\_rules](#input\_custom\_rules) | List of custom rule definitions (refer to variables file for syntax). | <pre>map(object({<br>    description          = string<br>    direction            = string<br>    action               = string # (allow|deny)<br>    ranges               = list(string)<br>    sources              = list(string)<br>    targets              = list(string)<br>    use_service_accounts = bool<br>    rules = list(object({<br>      protocol = string<br>      ports    = list(string)<br>    }))<br>    extra_attributes = map(string)<br>  }))</pre> | `{}` | no |
| <a name="input_http_source_ranges"></a> [http\_source\_ranges](#input\_http\_source\_ranges) | List of IP CIDR ranges for tag-based HTTP rule, defaults to 0.0.0.0/0. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_http_target_tags"></a> [http\_target\_tags](#input\_http\_target\_tags) | List of target tags for tag-based HTTP rule, defaults to http-server. | `list(string)` | <pre>[<br>  "http-server"<br>]</pre> | no |
| <a name="input_https_source_ranges"></a> [https\_source\_ranges](#input\_https\_source\_ranges) | List of IP CIDR ranges for tag-based HTTPS rule, defaults to 0.0.0.0/0. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_https_target_tags"></a> [https\_target\_tags](#input\_https\_target\_tags) | List of target tags for tag-based HTTPS rule, defaults to https-server. | `list(string)` | <pre>[<br>  "https-server"<br>]</pre> | no |
| <a name="input_internal_allow"></a> [internal\_allow](#input\_internal\_allow) | Allow rules for internal ranges. | `list` | <pre>[<br>  {<br>    "protocol": "icmp"<br>  }<br>]</pre> | no |
| <a name="input_internal_ranges"></a> [internal\_ranges](#input\_internal\_ranges) | IP CIDR ranges for intra-VPC rules. | `list(string)` | `[]` | no |
| <a name="input_internal_ranges_enabled"></a> [internal\_ranges\_enabled](#input\_internal\_ranges\_enabled) | Create rules for intra-VPC ranges. | `bool` | `false` | no |
| <a name="input_internal_target_tags"></a> [internal\_target\_tags](#input\_internal\_target\_tags) | List of target tags for intra-VPC rules. | `list(string)` | `[]` | no |
| <a name="input_network"></a> [network](#input\_network) | Name of the network this set of firewall rules applies to. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project id of the project that holds the network. | `string` | n/a | yes |
| <a name="input_ssh_source_ranges"></a> [ssh\_source\_ranges](#input\_ssh\_source\_ranges) | List of IP CIDR ranges for tag-based SSH rule, defaults to 0.0.0.0/0. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_ssh_target_tags"></a> [ssh\_target\_tags](#input\_ssh\_target\_tags) | List of target tags for tag-based SSH rule, defaults to ssh. | `list` | <pre>[<br>  "ssh"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_ranges"></a> [admin\_ranges](#output\_admin\_ranges) | Admin ranges data. |
| <a name="output_custom_egress_allow_rules"></a> [custom\_egress\_allow\_rules](#output\_custom\_egress\_allow\_rules) | Custom egress rules with allow blocks. |
| <a name="output_custom_egress_deny_rules"></a> [custom\_egress\_deny\_rules](#output\_custom\_egress\_deny\_rules) | Custom egress rules with allow blocks. |
| <a name="output_custom_ingress_allow_rules"></a> [custom\_ingress\_allow\_rules](#output\_custom\_ingress\_allow\_rules) | Custom ingress rules with allow blocks. |
| <a name="output_custom_ingress_deny_rules"></a> [custom\_ingress\_deny\_rules](#output\_custom\_ingress\_deny\_rules) | Custom ingress rules with deny blocks. |
| <a name="output_internal_ranges"></a> [internal\_ranges](#output\_internal\_ranges) | Internal ranges. |

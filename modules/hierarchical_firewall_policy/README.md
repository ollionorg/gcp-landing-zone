
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | >= 3.89 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_compute_organization_security_policy.policy](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_organization_security_policy) | resource |
| [google-beta_google_compute_organization_security_policy_association.association](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_organization_security_policy_association) | resource |
| [google-beta_google_compute_organization_security_policy_rule.rule](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_organization_security_policy_rule) | resource |
| [random_string.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_associations"></a> [associations](#input\_associations) | Resources to associate the policy to | `list(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Hierarchical policy name | `string` | n/a | yes |
| <a name="input_parent"></a> [parent](#input\_parent) | Where the firewall policy will be created (can be organizations/{organization\_id} or folders/{folder\_id}) | `string` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | Firewall rules to add to the policy | <pre>map(object({<br>    description             = string<br>    direction               = string<br>    action                  = string<br>    priority                = number<br>    ranges                  = list(string)<br>    ports                   = map(list(string))<br>    target_service_accounts = list(string)<br>    target_resources        = list(string)<br>    logging                 = bool<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |

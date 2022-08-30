<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.89.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.89.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_security_policy.armor-policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_security_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_rules"></a> [default\_rules](#input\_default\_rules) | default rule | <pre>map(object({<br>    action         = string<br>    priority       = string<br>    versioned_expr = string<br>    src_ip_ranges  = list(string)<br>    description    = string<br>    })<br>  )</pre> | <pre>{<br>  "def_rule": {<br>    "action": "allow",<br>    "description": "default rule",<br>    "priority": "2147483647",<br>    "src_ip_ranges": [<br>      "*"<br>    ],<br>    "versioned_expr": "SRC_IPS_V1"<br>  }<br>}</pre> | no |
| <a name="input_owasp_rules"></a> [owasp\_rules](#input\_owasp\_rules) | n/a | <pre>map(object({<br>    description = string<br>    action      = string<br>    priority    = string<br>    expression  = string<br>  }))</pre> | <pre>{<br>  "rule_sqli": {<br>    "action": "deny(403)",<br>    "description": "SQL Injection sensitivity level 2",<br>    "expression": "evaluatePreconfiguredExpr('sqli-v33-stable',['owasp-crs-v030301-id942251-sqli','owasp-crs-v030301-id942490-sqli','owasp-crs-v030301-id942420-sqli','owasp-crs-v030301-id942431-sqli','owasp-crs-v030301-id942460-sqli','owasp-crs-v030301-id942511-sqli','owasp-crs-v030301-id942421-sqli','owasp-crs-v030301-id942432-sqli'])",<br>    "priority": 1000<br>  },<br>  "rule_xss": {<br>    "action": "deny(403)",<br>    "description": "Cross-site scripting sensitivity level 2",<br>    "expression": "evaluatePreconfiguredExpr('xss-v33-stable')",<br>    "priority": 1001<br>  }<br>}</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | It contains the projectID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_armor_id"></a> [armor\_id](#output\_armor\_id) | It contains Cloud Armor policyId |
<!-- END_TF_DOCS -->

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
| [google_access_context_manager_service_perimeter.regular_service_perimeter](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_service_perimeter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_levels"></a> [access\_levels](#input\_access\_levels) | A list of AccessLevel resource names that allow resources within the ServicePerimeter to be accessed from the internet. AccessLevels listed must be in the same policy as this ServicePerimeter. Referencing a nonexistent AccessLevel is a syntax error. If no AccessLevel names are listed, resources within the perimeter can only be accessed via GCP calls with request origins within the perimeter. Example: 'accessPolicies/MY\_POLICY/accessLevels/MY\_LEVEL'. For Service Perimeter Bridge, must be empty. | `list(string)` | `[]` | no |
| <a name="input_access_levels_dry_run"></a> [access\_levels\_dry\_run](#input\_access\_levels\_dry\_run) | (Dry-run) A list of AccessLevel resource names that allow resources within the ServicePerimeter to be accessed from the internet. AccessLevels listed must be in the same policy as this ServicePerimeter. Referencing a nonexistent AccessLevel is a syntax error. If no AccessLevel names are listed, resources within the perimeter can only be accessed via GCP calls with request origins within the perimeter. Example: 'accessPolicies/MY\_POLICY/accessLevels/MY\_LEVEL'. For Service Perimeter Bridge, must be empty. If set, a dry-run policy will be set. | `list(string)` | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the regular perimeter | `string` | n/a | yes |
| <a name="input_egress_policies"></a> [egress\_policies](#input\_egress\_policies) | A list of all [egress policies](https://cloud.google.com/vpc-service-controls/docs/ingress-egress-rules#egress-rules-reference), each list object has a `from` and `to` value that describes egress\_from and egress\_to. | <pre>list(object({<br>    from = any<br>    to   = any<br>  }))</pre> | `[]` | no |
| <a name="input_egress_policies_dry_run"></a> [egress\_policies\_dry\_run](#input\_egress\_policies\_dry\_run) | A list of all [egress policies](https://cloud.google.com/vpc-service-controls/docs/ingress-egress-rules#egress-rules-reference), each list object has a `from` and `to` value that describes egress\_from and egress\_to. | <pre>list(object({<br>    from = any<br>    to   = any<br>  }))</pre> | `[]` | no |
| <a name="input_ingress_policies"></a> [ingress\_policies](#input\_ingress\_policies) | A list of all [ingress policies](https://cloud.google.com/vpc-service-controls/docs/ingress-egress-rules#ingress-rules-reference), each list object has a `from` and `to` value that describes ingress\_from and ingress\_to. | <pre>list(object({<br>    from = any<br>    to   = any<br>  }))</pre> | `[]` | no |
| <a name="input_ingress_policies_dry_run"></a> [ingress\_policies\_dry\_run](#input\_ingress\_policies\_dry\_run) | A list of all [ingress policies](https://cloud.google.com/vpc-service-controls/docs/ingress-egress-rules#ingress-rules-reference), each list object has a `from` and `to` value that describes ingress\_from and ingress\_to. | <pre>list(object({<br>    from = any<br>    to   = any<br>  }))</pre> | `[]` | no |
| <a name="input_perimeter_name"></a> [perimeter\_name](#input\_perimeter\_name) | Name of the perimeter. Should be one unified string. Must only be letters, numbers and underscores | `any` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | Name of the parent policy | `string` | n/a | yes |
| <a name="input_resources"></a> [resources](#input\_resources) | A list of GCP resources that are inside of the service perimeter. Currently only projects are allowed. | `list(string)` | `[]` | no |
| <a name="input_resources_dry_run"></a> [resources\_dry\_run](#input\_resources\_dry\_run) | (Dry-run) A list of GCP resources that are inside of the service perimeter. Currently only projects are allowed. If set, a dry-run policy will be set. | `list(string)` | `[]` | no |
| <a name="input_restricted_services"></a> [restricted\_services](#input\_restricted\_services) | GCP services that are subject to the Service Perimeter restrictions. Must contain a list of services. For example, if storage.googleapis.com is specified, access to the storage buckets inside the perimeter must meet the perimeter's access restrictions. | `list(string)` | `[]` | no |
| <a name="input_restricted_services_dry_run"></a> [restricted\_services\_dry\_run](#input\_restricted\_services\_dry\_run) | (Dry-run) GCP services that are subject to the Service Perimeter restrictions. Must contain a list of services. For example, if storage.googleapis.com is specified, access to the storage buckets inside the perimeter must meet the perimeter's access restrictions.  If set, a dry-run policy will be set. | `list(string)` | `[]` | no |
| <a name="input_shared_resources"></a> [shared\_resources](#input\_shared\_resources) | A map of lists of resources to share in a Bridge perimeter module. Each list should contain all or a subset of the perimeters resources | `object({ all = list(string) })` | <pre>{<br>  "all": []<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_perimeter_name"></a> [perimeter\_name](#output\_perimeter\_name) | The perimeter's name. |
| <a name="output_resources"></a> [resources](#output\_resources) | A list of GCP resources that are inside of the service perimeter. Currently only projects are allowed. |
| <a name="output_shared_resources"></a> [shared\_resources](#output\_shared\_resources) | A map of lists of resources to share in a Bridge perimeter module. Each list should contain all or a subset of the perimeters resources |

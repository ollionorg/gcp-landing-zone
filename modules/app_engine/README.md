
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
| [google_app_engine_application.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_application) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auth_domain"></a> [auth\_domain](#input\_auth\_domain) | The domain to authenticate users with when using App Engine's User API. | `string` | `""` | no |
| <a name="input_feature_settings"></a> [feature\_settings](#input\_feature\_settings) | A list of maps of optional settings to configure specific App Engine features. | `list(object({ split_health_checks = bool }))` | <pre>[<br>  {<br>    "split_health_checks": true<br>  }<br>]</pre> | no |
| <a name="input_location_id"></a> [location\_id](#input\_location\_id) | The location to serve the app from. | `string` | `""` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project to enable app engine on. | `any` | n/a | yes |
| <a name="input_serving_status"></a> [serving\_status](#input\_serving\_status) | The serving status of the app. | `string` | `"SERVING"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_code_bucket"></a> [code\_bucket](#output\_code\_bucket) | The GCS bucket code is being stored in for this app. |
| <a name="output_default_bucket"></a> [default\_bucket](#output\_default\_bucket) | The GCS bucket content is being stored in for this app. |
| <a name="output_default_hostname"></a> [default\_hostname](#output\_default\_hostname) | The default hostname for this app. |
| <a name="output_location_id"></a> [location\_id](#output\_location\_id) | The location app engine is serving from |
| <a name="output_name"></a> [name](#output\_name) | Unique name of the app, usually apps/{PROJECT\_ID}. |
| <a name="output_url_dispatch_rule"></a> [url\_dispatch\_rule](#output\_url\_dispatch\_rule) | A list of dispatch rule blocks. Each block has a domain, path, and service field. |

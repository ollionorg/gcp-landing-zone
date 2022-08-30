
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | >= 3.89 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_compute_route.route](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_compute_route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_module_depends_on"></a> [module\_depends\_on](#input\_module\_depends\_on) | List of modules or resources this module depends on. | `list(any)` | `[]` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name of the network where routes will be created | `any` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project where the routes will be created | `any` | n/a | yes |
| <a name="input_routes"></a> [routes](#input\_routes) | List of routes being created in this VPC | `list(map(string))` | `[]` | no |
| <a name="input_routes_count"></a> [routes\_count](#input\_routes\_count) | Amount of routes being created in this VPC | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_routes"></a> [routes](#output\_routes) | The created routes resources |

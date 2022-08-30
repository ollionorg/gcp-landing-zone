
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

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ilbs"></a> [ilbs](#module\_ilbs) | ../../modules/terraform-google-ilb-internal | n/a |
| <a name="module_migs"></a> [migs](#module\_migs) | ../../modules/terraform-google-vm/modules/mig | n/a |
| <a name="module_service_account"></a> [service\_account](#module\_service\_account) | ../../modules/terraform-google-service-accounts | n/a |
| <a name="module_templates"></a> [templates](#module\_templates) | ../../modules/terraform-google-vm/modules/instance_template | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.allow_transitivity_egress](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.allow_transtivity_ingress](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_route.routes](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_commands"></a> [commands](#input\_commands) | Commands for the transitivity gateway to run on every boot. | `list(string)` | `[]` | no |
| <a name="input_firewall_enable_logging"></a> [firewall\_enable\_logging](#input\_firewall\_enable\_logging) | Toggle firewall logging for VPC Firewalls. | `bool` | `true` | no |
| <a name="input_gw_subnets"></a> [gw\_subnets](#input\_gw\_subnets) | Subnets in {REGION => SUBNET} format. | `map(string)` | n/a | yes |
| <a name="input_health_check_enable_log"></a> [health\_check\_enable\_log](#input\_health\_check\_enable\_log) | Toggle logging for health checks. | `bool` | `false` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | VPC Project ID | `string` | n/a | yes |
| <a name="input_regional_aggregates"></a> [regional\_aggregates](#input\_regional\_aggregates) | Aggregate ranges for each region in {REGION => [AGGREGATE\_CIDR,] } format. | `map(list(string))` | n/a | yes |
| <a name="input_regions"></a> [regions](#input\_regions) | Regions to deploy the transitivity appliances | `set(string)` | `null` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Label to identify the VPC associated with shared VPC that will use the Interconnect. | `string` | n/a | yes |

## Outputs

No outputs.

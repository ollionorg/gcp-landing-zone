
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.89 |
| <a name="provider_null"></a> [null](#provider\_null) | >= 3.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_disk_resource_policy_attachment.attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk_resource_policy_attachment) | resource |
| [google_compute_resource_policy.policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_resource_policy) | resource |
| [null_resource.module_depends_on](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disks"></a> [disks](#input\_disks) | List of self\_links persistent disks to attach the snapshot policy to (ie. projects/project\_id/disks/diskname/zones/zone\_name) | `list(string)` | `[]` | no |
| <a name="input_module_depends_on"></a> [module\_depends\_on](#input\_module\_depends\_on) | List of modules or resources this module depends on | `list(any)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the resource policy to create | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project ID where the resources will be created | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where resource policy resides | `string` | n/a | yes |
| <a name="input_snapshot_properties"></a> [snapshot\_properties](#input\_snapshot\_properties) | The properties of the schedule policy. For more details see https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_resource_policy#snapshot_properties | <pre>object(<br>    {<br>      guest_flush       = bool<br>      labels            = map(string)<br>      storage_locations = list(string)<br>    }<br>  )</pre> | `null` | no |
| <a name="input_snapshot_retention_policy"></a> [snapshot\_retention\_policy](#input\_snapshot\_retention\_policy) | The retention policy to be applied to the schedule policy. For more details see https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_resource_policy#retention_policy | <pre>object(<br>    {<br>      max_retention_days    = number<br>      on_source_disk_delete = string<br>    }<br>  )</pre> | n/a | yes |
| <a name="input_snapshot_schedule"></a> [snapshot\_schedule](#input\_snapshot\_schedule) | The scheduled to be used by the snapshot policy. For more details see https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_resource_policy#schedule | <pre>object(<br>    {<br>      daily_schedule = object(<br>        {<br>          days_in_cycle = number<br>          start_time    = string<br>        }<br>      )<br>      hourly_schedule = object(<br>        {<br>          hours_in_cycle = number<br>          start_time     = string<br>        }<br>      )<br>      weekly_schedule = object(<br>        {<br>          day_of_weeks = set(object(<br>            {<br>              day        = string<br>              start_time = string<br>            }<br>          ))<br>        }<br>      )<br>    }<br>  )</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_attachments"></a> [attachments](#output\_attachments) | Disk attachments to the resource policy |
| <a name="output_policy"></a> [policy](#output\_policy) | Resource snapshot policy details |

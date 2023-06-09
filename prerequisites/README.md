## Github repo configuration.

Copyright 2021 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 4.20.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.2.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | 4.20.0 |
| <a name="provider_google"></a> [google](#provider\_google) | 4.64.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.2.2 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_branch_protection.bu_name_main_branch_protection](https://registry.terraform.io/providers/integrations/github/4.20.0/docs/resources/branch_protection) | resource |
| [github_repository_deploy_key.runner_deploy_key](https://registry.terraform.io/providers/integrations/github/4.20.0/docs/resources/repository_deploy_key) | resource |
| [google_secret_manager_secret.git_gcplz_ssh_pvt](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret) | resource |
| [google_secret_manager_secret_version.git_gcplz_ssh_pvt_data](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version) | resource |
| [null_resource.secret_key_null_resource](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_id.gh_deploy_key](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [local_file.key_file_pub](https://registry.terraform.io/providers/hashicorp/local/2.2.2/docs/data-sources/file) | data source |
| [local_sensitive_file.key_file](https://registry.terraform.io/providers/hashicorp/local/2.2.2/docs/data-sources/sensitive_file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gh_key_comment"></a> [gh\_key\_comment](#input\_gh\_key\_comment) | comment for the created key to be added to the github. | `string` | `"runner@key"` | no |
| <a name="input_gh_key_file_name"></a> [gh\_key\_file\_name](#input\_gh\_key\_file\_name) | file names for the created private and public keys. | `string` | `"secretkey"` | no |
| <a name="input_gh_token"></a> [gh\_token](#input\_gh\_token) | Github token that is used for generating Self Hosted Runner Token | `string` | `"default-runner-token"` | no |
| <a name="input_git_pvt_key_scrt_name"></a> [git\_pvt\_key\_scrt\_name](#input\_git\_pvt\_key\_scrt\_name) | The name / secret id which holds the private key for the deploy keys added to the Github repo. | `string` | `"git-gcplz-ssh-pvt"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Custom project ID to use for project created. If not supplied, the default id is {project\_prefix}-seed-{random suffix}. | `string` | `""` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The prefix for name of the main branch. | `string` | n/a | yes |
| <a name="input_runner_repo_name"></a> [runner\_repo\_name](#input\_runner\_repo\_name) | Name of the repo for the Github Action | `string` | n/a | yes |

## Outputs

No outputs.

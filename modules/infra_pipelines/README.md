
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
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_artifact_registry_repository.tf-image-repo](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_artifact_registry_repository) | resource |
| [google-beta_google_artifact_registry_repository_iam_member.terraform-image-iam](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_artifact_registry_repository_iam_member) | resource |
| [google_cloudbuild_trigger.main_trigger](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger) | resource |
| [google_cloudbuild_trigger.non_main_trigger](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger) | resource |
| [google_folder_iam_member.browser_cloud_build](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_iam_member) | resource |
| [google_sourcerepo_repository.app_infra_repo](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sourcerepo_repository) | resource |
| [google_sourcerepo_repository.gcp_policies](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sourcerepo_repository) | resource |
| [google_storage_bucket.cloudbuild_artifacts](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket.tfstate](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_iam_member.cloudbuild_artifacts_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [null_resource.cloudbuild_terraform_builder](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_id.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [google_project.cloudbuild_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_infra_repos"></a> [app\_infra\_repos](#input\_app\_infra\_repos) | A list of Cloud Source Repos to be created to hold app infra Terraform configs | `list(string)` | n/a | yes |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associated this project with | `string` | n/a | yes |
| <a name="input_bucket_region"></a> [bucket\_region](#input\_bucket\_region) | Region to create GCS buckets for tfstate and Cloud Build artifacts | `string` | `"us-central1"` | no |
| <a name="input_cloudbuild_apply_filename"></a> [cloudbuild\_apply\_filename](#input\_cloudbuild\_apply\_filename) | Path and name of Cloud Build YAML definition used for terraform apply. | `string` | `"cloudbuild-tf-apply.yaml"` | no |
| <a name="input_cloudbuild_plan_filename"></a> [cloudbuild\_plan\_filename](#input\_cloudbuild\_plan\_filename) | Path and name of Cloud Build YAML definition used for terraform plan. | `string` | `"cloudbuild-tf-plan.yaml"` | no |
| <a name="input_cloudbuild_project_id"></a> [cloudbuild\_project\_id](#input\_cloudbuild\_project\_id) | The project id where the pipelines and repos should be created | `string` | n/a | yes |
| <a name="input_default_region"></a> [default\_region](#input\_default\_region) | Default region to create resources where applicable. | `string` | n/a | yes |
| <a name="input_folders_to_grant_browser_role"></a> [folders\_to\_grant\_browser\_role](#input\_folders\_to\_grant\_browser\_role) | List of folders to grant browser role to the cloud build service account. Used by terraform validator to able to load IAM policies. | `list(string)` | `[]` | no |
| <a name="input_gar_repo_name"></a> [gar\_repo\_name](#input\_gar\_repo\_name) | Custom name to use for GAR repo. | `string` | `""` | no |
| <a name="input_impersonate_service_account"></a> [impersonate\_service\_account](#input\_impersonate\_service\_account) | Service account email of the account to impersonate to run Terraform | `string` | n/a | yes |
| <a name="input_project_prefix"></a> [project\_prefix](#input\_project\_prefix) | Name prefix to use for projects created. | `string` | `"prj"` | no |
| <a name="input_terraform_apply_branches"></a> [terraform\_apply\_branches](#input\_terraform\_apply\_branches) | List of git branches configured to run terraform apply Cloud Build trigger. All other branches will run plan by default. | `list(string)` | <pre>[<br>  "development",<br>  "non-production",<br>  "production"<br>]</pre> | no |
| <a name="input_terraform_validator_release"></a> [terraform\_validator\_release](#input\_terraform\_validator\_release) | Default terraform-validator release. | `string` | `"v0.4.0"` | no |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | Default terraform version. | `string` | `"1.0.9"` | no |
| <a name="input_terraform_version_sha256sum"></a> [terraform\_version\_sha256sum](#input\_terraform\_version\_sha256sum) | sha256sum for default terraform version. | `string` | `"f06ac64c6a14ed6a923d255788e4a5daefa2b50e35f32d7a3b5a2f9a5a91e255"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_apply_triggers"></a> [apply\_triggers](#output\_apply\_triggers) | CB apply triggers |
| <a name="output_artifact_buckets"></a> [artifact\_buckets](#output\_artifact\_buckets) | GCS Buckets to store Cloud Build Artifacts |
| <a name="output_cloudbuild_sa"></a> [cloudbuild\_sa](#output\_cloudbuild\_sa) | Cloud Build service account |
| <a name="output_default_region"></a> [default\_region](#output\_default\_region) | Default region to create resources where applicable. |
| <a name="output_gar_name"></a> [gar\_name](#output\_gar\_name) | GAR Repo name created to store runner images |
| <a name="output_plan_triggers"></a> [plan\_triggers](#output\_plan\_triggers) | CB plan triggers |
| <a name="output_repos"></a> [repos](#output\_repos) | CSRs to store source code |
| <a name="output_state_buckets"></a> [state\_buckets](#output\_state\_buckets) | GCS Buckets to store TF state |
| <a name="output_tf_runner_artifact_repo"></a> [tf\_runner\_artifact\_repo](#output\_tf\_runner\_artifact\_repo) | GAR Repo created to store runner images |

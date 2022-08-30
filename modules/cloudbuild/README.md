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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudbuild_project"></a> [cloudbuild\_project](#module\_cloudbuild\_project) | ../terraform-google-project-factory | n/a |

## Resources

| Name | Type |
|------|------|
| [google-beta_google_artifact_registry_repository.tf-image-repo](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_artifact_registry_repository) | resource |
| [google-beta_google_artifact_registry_repository_iam_member.terraform-image-iam](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_artifact_registry_repository_iam_member) | resource |
| [google_cloudbuild_trigger.main_trigger](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger) | resource |
| [google_cloudbuild_trigger.non_main_trigger](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger) | resource |
| [google_kms_crypto_key.tf_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key) | resource |
| [google_kms_crypto_key_iam_binding.cloud_build_crypto_key_encrypter](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key_iam_binding) | resource |
| [google_kms_crypto_key_iam_binding.cloudbuild_crypto_key_decrypter](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key_iam_binding) | resource |
| [google_kms_key_ring.tf_keyring](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_key_ring) | resource |
| [google_organization_iam_member.cloudbuild_serviceusage_consumer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_project_iam_member.org_admins_cloudbuild_editor](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.org_admins_cloudbuild_viewer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.org_admins_source_repo_admin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account_iam_member.cloudbuild_terraform_sa_impersonate_permissions](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [google_sourcerepo_repository.gcp_repo](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sourcerepo_repository) | resource |
| [google_storage_bucket.cloudbuild_artifacts](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_iam_member.cloudbuild_artifacts_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [google_storage_bucket_iam_member.cloudbuild_state_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [null_resource.cloudbuild_terraform_builder](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_id.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [google_organization.org](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activate_apis"></a> [activate\_apis](#input\_activate\_apis) | List of APIs to enable in the Cloudbuild project. | `list(string)` | <pre>[<br>  "serviceusage.googleapis.com",<br>  "servicenetworking.googleapis.com",<br>  "compute.googleapis.com",<br>  "logging.googleapis.com",<br>  "bigquery.googleapis.com",<br>  "cloudresourcemanager.googleapis.com",<br>  "cloudbilling.googleapis.com",<br>  "iam.googleapis.com",<br>  "admin.googleapis.com",<br>  "appengine.googleapis.com",<br>  "storage-api.googleapis.com"<br>]</pre> | no |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The ID of the billing account to associate projects with. | `string` | n/a | yes |
| <a name="input_cloud_source_repos"></a> [cloud\_source\_repos](#input\_cloud\_source\_repos) | List of Cloud Source Repos to create with CloudBuild triggers. | `list(string)` | <pre>[<br>  "gcp-org",<br>  "gcp-networks",<br>  "gcp-projects"<br>]</pre> | no |
| <a name="input_cloudbuild_apply_filename"></a> [cloudbuild\_apply\_filename](#input\_cloudbuild\_apply\_filename) | Path and name of Cloud Build YAML definition used for terraform apply. | `string` | `"cloudbuild-tf-apply.yaml"` | no |
| <a name="input_cloudbuild_plan_filename"></a> [cloudbuild\_plan\_filename](#input\_cloudbuild\_plan\_filename) | Path and name of Cloud Build YAML definition used for terraform plan. | `string` | `"cloudbuild-tf-plan.yaml"` | no |
| <a name="input_create_cloud_source_repos"></a> [create\_cloud\_source\_repos](#input\_create\_cloud\_source\_repos) | If shared Cloud Source Repos should be created. | `bool` | `true` | no |
| <a name="input_default_region"></a> [default\_region](#input\_default\_region) | Default region to create resources where applicable. | `string` | `"us-central1"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of a folder to host this project | `string` | `""` | no |
| <a name="input_gar_repo_name"></a> [gar\_repo\_name](#input\_gar\_repo\_name) | Custom name to use for GAR repo. | `string` | `""` | no |
| <a name="input_group_org_admins"></a> [group\_org\_admins](#input\_group\_org\_admins) | Google Group for GCP Organization Administrators | `string` | n/a | yes |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | GCP Organization ID | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Custom project ID to use for project created. | `string` | `""` | no |
| <a name="input_project_labels"></a> [project\_labels](#input\_project\_labels) | Labels to apply to the project. | `map(string)` | `{}` | no |
| <a name="input_project_prefix"></a> [project\_prefix](#input\_project\_prefix) | Name prefix to use for projects created. | `string` | `"cft"` | no |
| <a name="input_random_suffix"></a> [random\_suffix](#input\_random\_suffix) | Appends a 4 character random suffix to project ID and GCS bucket name. | `bool` | `true` | no |
| <a name="input_sa_enable_impersonation"></a> [sa\_enable\_impersonation](#input\_sa\_enable\_impersonation) | Allow org\_admins group to impersonate service account & enable APIs required. | `bool` | `false` | no |
| <a name="input_storage_bucket_labels"></a> [storage\_bucket\_labels](#input\_storage\_bucket\_labels) | Labels to apply to the storage bucket. | `map(string)` | `{}` | no |
| <a name="input_terraform_apply_branches"></a> [terraform\_apply\_branches](#input\_terraform\_apply\_branches) | List of git branches configured to run terraform apply Cloud Build trigger. All other branches will run plan by default. | `list(string)` | <pre>[<br>  "main"<br>]</pre> | no |
| <a name="input_terraform_sa_email"></a> [terraform\_sa\_email](#input\_terraform\_sa\_email) | Email for terraform service account. | `string` | n/a | yes |
| <a name="input_terraform_sa_name"></a> [terraform\_sa\_name](#input\_terraform\_sa\_name) | Fully-qualified name of the terraform service account. | `string` | n/a | yes |
| <a name="input_terraform_state_bucket"></a> [terraform\_state\_bucket](#input\_terraform\_state\_bucket) | Default state bucket, used in Cloud Build substitutions. | `string` | n/a | yes |
| <a name="input_terraform_validator_release"></a> [terraform\_validator\_release](#input\_terraform\_validator\_release) | Default terraform-validator release. | `string` | `"v0.4.0"` | no |
| <a name="input_terraform_version"></a> [terraform\_version](#input\_terraform\_version) | Default terraform version. | `string` | `"1.0.9"` | no |
| <a name="input_terraform_version_sha256sum"></a> [terraform\_version\_sha256sum](#input\_terraform\_version\_sha256sum) | sha256sum for default terraform version. | `string` | `"f06ac64c6a14ed6a923d255788e4a5daefa2b50e35f32d7a3b5a2f9a5a91e255"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudbuild_project_id"></a> [cloudbuild\_project\_id](#output\_cloudbuild\_project\_id) | Project where CloudBuild configuration and terraform container image will reside. |
| <a name="output_csr_repos"></a> [csr\_repos](#output\_csr\_repos) | List of Cloud Source Repos created by the module, linked to Cloud Build triggers. |
| <a name="output_gcs_bucket_cloudbuild_artifacts"></a> [gcs\_bucket\_cloudbuild\_artifacts](#output\_gcs\_bucket\_cloudbuild\_artifacts) | Bucket used to store Cloud/Build artefacts in CloudBuild project. |
| <a name="output_kms_crypto_key"></a> [kms\_crypto\_key](#output\_kms\_crypto\_key) | KMS key created by the module. |
| <a name="output_kms_keyring"></a> [kms\_keyring](#output\_kms\_keyring) | KMS Keyring created by the module. |
| <a name="output_project_service_account"></a> [project\_service\_account](#output\_project\_service\_account) | n/a |
| <a name="output_tf_runner_artifact_repo"></a> [tf\_runner\_artifact\_repo](#output\_tf\_runner\_artifact\_repo) | GAR Repo created to store runner images |

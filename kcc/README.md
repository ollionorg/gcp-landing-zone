changequote(,)
## KCC - Kubernetes Config Controller

The Kubernetes Config Controller is based on the [Anthos Config Management](https://cloud.google.com/anthos/config-management])
Anthos Config Management enables platform operators to automatically deploy shared environment configurations and enforce/audit approved security policies across Kubernetes clusters on-premises, on GKE, and in other public cloud platforms. 
It also lets platform admins configure Google Cloud services using the same resource model.

The Kubernetes Config Controller makes use of the below features from the Anthos Config Management to monitor and ensure that the infrastructure and the resources that were created in the Landing Zone are compliant to the security policies.

    1. Anthos Config Sync: It lets cluster operators and platform administrators deploy consistent configurations and policies.
    2. Anthos Config Controller:  It  lets you define and operate with a simple, declarative configuration in Kubernetes style to create GCP resources.
    3. Anthos Policy Controller: It enables enforcement of compliance, security, and organizational policies on GKE clusters. It is built upon the open-source Open Policy Agent (OPA) Gatekeeper, which uses a Kubernetes validating webhook to enforce/audit your workloads according to the defined policies.



## Integration with the Landing Zone

The KCC cluster will be created inside the cicd project under the bootstrap folder.

### Prerequisites

1. 0-bootstrap executed successfully.
2. 1-org executed successfully.
3. 2-environments executed successfully.
4. 3-networks executed successfully. 
5. 4-projects executed successfully.
6. resources imported into the controller by applying resource manifests by executing the script `bulk-export.sh`


### Deploying with Cloud Build and GitHub Actions

1. The initial wrapper script execution will make the relevant changes to store the details related to the terraform code to spin up the config controller.
2. Add the changes made by the wrapper script to the git staging, commit and push to the `sync-branch` i.e `prj-name-main` branch by raising the PR.
3. Once the PR is reviewed and approved by the Codeowners, merge the code.
4. This will create the cluster and configure it with all the required components and apply the constraints from the policy directory using config sync.


```commandline
git add kcc
git commit -m "Deploy KCC"
git push origin prj-name-init

Raise PR to merge prj-name-init into prj-name-main
```

### Import Existing Cloud Resources

The GitHub Actions and Cloud Build will install and configure the kubernetes config controller with all the policy constraints as defined within the policy directory. 
However, to import the already existing resources, execute the script to export the resources from the cloud infrastructure and import them by applying the respective manifest files.
The pre-requisite for this is to enable the `cloudasset.googleapis.com` which is done by the terraform during the initial deployment.

```commandline
#To export the resource manifests for resources under a specific project:
bash bulk-export.sh -p <project_id>

#To export the resource manifests for resources under a specific folder:
bash bulk-export.sh -f <folder_id>

#To export the resource manifests for resources under the entire organization:
bash bulk-export.sh -o <organization_id>

#The execution output of this scripts will create folder structure as below: 
resource-manifests/
├── folders
├── organizations
└── projects
3 directories, 0 files

#The resources exported from a project will have their manifests inside `projects` folder with a sub-folder as `project_id`
#The resources exported from a folder will have their manifests inside `folders` folder with a sub-folder as `folder_id`
#The resources exported from the organization will have their manifests inside `organizations folder with a sub-folder as `organization_id`


#Once all the relevant resource manifests are obtained, apply the manifests to the KCC:

gcloud container clusters get-credentials lz-config-controller-cluster --region us-east1 --project <cicd-project-id>
kubectl apply -f resource-manifests/path/to/manifest/file/for/the/resources

 
```




<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.27.0 |
| <a name="provider_google.impersonate"></a> [google.impersonate](#provider\_google.impersonate) | 4.27.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | 4.28.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke"></a> [gke](#module\_gke) | ../modules/terraform-google-kubernetes-engine/modules/beta-private-cluster | n/a |
| <a name="module_wi"></a> [wi](#module\_wi) | ../modules/terraform-google-kubernetes-engine/modules/workload-identity | n/a |

## Resources

| Name | Type |
|------|------|
| [google-beta_google_gke_hub_feature.configmanagement_acm_feature](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_gke_hub_feature) | resource |
| [google-beta_google_gke_hub_feature_membership.feature_member](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_gke_hub_feature_membership) | resource |
| [google-beta_google_gke_hub_membership.membership](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_gke_hub_membership) | resource |
| [google_compute_router.cc_router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_nat.cc_nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.cc_subnetwork](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_organization_iam_binding.workload_identity_org_sa_bindings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_binding) | resource |
| [google_project_service.cc_services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_service_account_access_token.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account_access_token) | data source |
| [terraform_remote_state.bootstrap](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.org](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cc_location"></a> [cc\_location](#input\_cc\_location) | The location of the config controller instance from the following locations: us-central1,us-east1,northamerica-northeast1,northamerica-northeast2,europe-north1,europe-west1,europe-west3,australia-southeast1,australia-southeast2,asia-northeast1,asia-northeast2 | `string` | `"us-east1"` | no |
| <a name="input_cc_name"></a> [cc\_name](#input\_cc\_name) | The name of the managed config controller instance. | `string` | `"lz-config-controller"` | no |
| <a name="input_cc_subnet_cidr"></a> [cc\_subnet\_cidr](#input\_cc\_subnet\_cidr) | Subnetwork's CIDR for the config controller cluster. | `string` | `"192.168.1.0/24"` | no |
| <a name="input_cc_subnet_name"></a> [cc\_subnet\_name](#input\_cc\_subnet\_name) | Subnetwork in the cc\_location under the gh-runner-network. | `string` | `"gh-runner-subnet-2"` | no |
| <a name="input_policy_dir"></a> [policy\_dir](#input\_policy\_dir) | The path within the Git repository that represents the top level of the repo to sync. Default: the root directory of the repository. | `string` | `""` | no |
| <a name="input_sa_email_role"></a> [sa\_email\_role](#input\_sa\_email\_role) | Role for the Service Account for Config Controller to manage resources organization wide. | `string` | `"roles/editor"` | no |
| <a name="input_sync_branch"></a> [sync\_branch](#input\_sync\_branch) | The branch of the repository to sync from. Default: master. | `string` | `"master"` | no |
| <a name="input_sync_repo"></a> [sync\_repo](#input\_sync\_repo) | The URL of the Git repository to use as the source of truth. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cicd_project"></a> [cicd\_project](#output\_cicd\_project) | n/a |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | n/a |
<!-- END_TF_DOCS -->
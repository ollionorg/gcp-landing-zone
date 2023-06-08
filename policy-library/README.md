# Terraform validation

Business are shifting towards IaC, and with the change comes a concern that configuration error can cause security and governance violations.

Constraints define your organization's source of truth for security and governance requirements. The constraints must be compatible with tools across every stage of the application lifecycle, for development, to development, and even to an audit of deployed resources.

`gcloud beta terraform vet` is a tool for enforcing policy compliance as part of infrastructure CI/CD pipeline.

With `gcloud beta terraform vet` we can:

- Enforce your organization's policy at any stage of application development.
- Remove manual errors by automating policy validation.
- Reduce learning time by using a single paradigm for all policy management.

### Library Structure
A policy library repository contains the following directories.

- `policies/` - This directory contains two subdirectories:
  - `constraints/` - This directory is initially empty. Place your constraint files here.
  - `templates/` - This directory contains pre-defined constraint templates.
- `validator` - This directory contains the .rego files and their associated unit tests. You don't need to touch this directory unless you intend to modify existing constraint templates or create new ones.

### CLI 
To run terraform vet from commandline you need to install terraform-tools
```yaml
sudo apt-get install google-cloud-sdk-terraform-tools
```
Enter the following command to validate that your Terraform plan complies with you policies:
```
gcloud beta terraform vet tfplan.json --policy-library=. --format=json
```

### Expected Output

If there is no violation 
```yaml
[]
```
else there is any violations
```json
  {
    "constraint": "GCPAlwaysViolatesConstraintV1.always_violates_all",
    "constraint_config": {
      "api_version": "constraints.gatekeeper.sh/v1alpha1",
      "kind": "GCPAlwaysViolatesConstraintV1",
      "metadata": {
        "annotations": {
          "description": "Testing policy, will always violate.",
          "validation.gcp.forsetisecurity.org/originalName": "always_violates_all",
          "validation.gcp.forsetisecurity.org/yamlpath": "policies/constraints/always_violates.yaml"
        },
        "name": "always-violates-all"
      },
      "spec": {
        "constraintVersion": "0.1.0",
        "match": {
          "ancestries": [
            "organizations/**"
          ]
        },
        "parameters": {},
        "severity": "high"
      }
    },
    "message": "violates on all resources.",
    "metadata": {
      "ancestry_path": "<ProjectPath>",
      "constraint": {
        "annotations": {
          "description": "Testing policy, will always violate.",
          "validation.gcp.forsetisecurity.org/originalName": "always_violates_all",
          "validation.gcp.forsetisecurity.org/yamlpath": "policies/constraints/always_violates.yaml"
        },
        "labels": {},
        "parameters": {}
      },
      "details": {
        "asset": {
          "ancestors": [
            "projects/<ProjectID>",
            "folders/<FolderID>",
            "folders/<FolderID>",
            "organizations/<Org-ID>"
          ],
          "ancestry_path": "<ProjectPath>",
          "asset_type": "cloudkms.googleapis.com/KeyRing",
          "name": "//cloudkms.googleapis.com/projects/prj-b-seed-471d/locations/global/keyRings/keyring-example",
          "resource": {
            "discovery_document_uri": "https://www.googleapis.com/discovery/v1/apis/cloudkms/v1/rest",
            "discovery_name": "KeyRing",
            "parent": "//cloudresourcemanager.googleapis.com/projects/prj-b-seed-471d",
            "version": "v1"
          }
        }
      }
    },
    "resource": "//cloudkms.googleapis.com/projects/prj-b-seed-471d/locations/global/keyRings/keyring-example",
    "severity": "high"
  }

```
### With CI/CD

We can use `gcloud beta terraform vet` with CI/CD refer to the following block of code.
```shell
    - |
      date -u +%Y%m%d-T%H%M%S > _TAG
      gcloud beta terraform vet /workspace/tf.json --policy-library=${_REPO}/policy-library --format=json > /workspace/tfvalidator-${_WORKFLOW}-$(cat _TAG).json
      ls -ltr /workspace/tfvalidator-${_WORKFLOW}-$(cat _TAG).json | tr -s ' ' | cut -d ' ' -f 5 > _SIZE
      if [ $(cat _SIZE) -le 3  ]
      then 
        echo " -------------------------- Terraform Validator -------------------------- "
        echo -e " Infrastructure is in compliance according to the policies present at ${_REPO}/policy-library \n Nothing to upload to bucket"
      else 
        gsutil cp /workspace/tfvalidator-${_WORKFLOW}-$(cat _TAG).json gs://${_BUCKET}/tf-validator/tfvalidator-${_WORKFLOW}-$(cat _TAG).json
        echo "-------------------------- Running Terraform Validator --------------------------"
        gcloud beta terraform vet /workspace/tf.json --policy-library=${_REPO}/policy-library --format=json
        echo -e " Please fix the above findings \n Uploading tfvalidator-${_WORKFLOW}-$(cat _TAG).json to gs://${_BUCKET}/tf-validator)"
        exit 1
      fi
```

### Reference:
- [https://cloud.google.com/docs/terraform/policy-validation](https://cloud.google.com/docs/terraform/policy-validation)
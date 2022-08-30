# Service Account Key Distributor

Downloading Google Cloud Service Account keys is [typically a bad idea](https://medium.com/@jryancanty/stop-downloading-google-cloud-service-account-keys-1811d44a97d9) but sometimes you can't help it.
For example if you need to create a key to distribute to a CICD system on-prem like Jenkins, or you need to give some third party
access to Google Cloud without giving them a user account. If you download the key and directly distribute it, not only is it
directly visible to you, but it's in plain text in whatever storage medium you put it in (i.e. GCS, etc). A better idea would
be to use [GPG](https://gnupg.org/) to download the key and encrypt it such that only the intended party can decrypt it. However,
in this case, the person downloading the key still has access to see it, which means they could accidentally commit it to Github,
send it off to a friend, etc.

This solution allows operators to generate a Google Cloud service account key for another system (e.g. CICD pipeline) or user without
ever needing to see the key itself, adhering to the principle of least privilege. This is possible using asymmetric encryption
and the GPG software utility. This assumes the receiving service has a GPG private key which can be used to decrypt the service
account key, and the deployer of this function has access to the GPG public key.

## Architecture

![](./arch.png)

In this diagram, you can see the Cloud Function is used to broker the Service Account key generation and public key encryption. The operator then only needs to be granted
access to call the function, but not to create the service account key. The function returns the encrypted key, which the operator can then distribute to
the application or user that owns the private key.

## Deployment
```
module "distributor" {
  source  = "terraform-google-modules/service-accounts/google//key-distributor"

  project_id      = "<project-id>"
  org_id          = "<org-id>"
  public_key_file = "/path/to/pubkey.asc"

  # These folks will be granted access to use the function
  cfn_members = [
      "user:someuser@example.com",
      "group:somegroup@example.com",
  ]
}
```

### Prerequisites
#### Required APIs:

* `iam.googleapis.com`
* `cloudbuild.googleapis.com`
* `cloudfunctions.googleapis.com`

#### Required software:

* [gpg](https://gnupg.org/) - Used for fetching and exporting public keys as well as decrypting
* [terraform](https://www.terraform.io/downloads.html) - Used for deployment of the Cloud Function
* [jq](https://stedolan.github.io/jq/) - Used to parse JSON response

On top of the typical terraform setup, we need to export the public key the Cloud Function will use. Make sure you have the key you need in your local
gpg key chain. If it's in a public key server you can download it with:

```
gpg --receive-keys <key-id>
```

Once it's there locally, you can export the ASCII armored version of it with this and store it into a file:

```
gpg --export --armor <key-id> > pubkey.asc
```

### Apply

With your variables and public key setup, simply run:

```
terraform init
terraform apply
```

## Usage

When you run the terraform, a new script will appear at `get-key` from a template. This is a basic wrapper
script that writes an encrypted file after invoking the cloud function. Feel free to take this and expand on it for
your own use cases, or just run it as is.

```
./get-key <sa-email>
Success! Wrote encrypted key to <sa-email>.json.gpg
```

Now you can safely distribute this gpg-encrypted file to the server or container that has the private key associated
with it, all while you never had to see the service account key or the private key!

## Validation

Now let's try an end to end demo since we have everything deployed.

#### Create a new test GPG key

```
$ gpg --generate-key
pub   rsa2048 2020-08-17 [SC] [expires: 2022-08-17]
      91514EA9AA7111CD22EB786417316086C30144C8
uid                      Test User <thing@example.com>
sub   rsa2048 2020-08-17 [E] [expires: 2022-08-17]

$ gpg --export --armor 91514EA9AA7111CD22EB786417316086C30144C8 > pubkey.asc
```

#### Create a new service account

```
$ gcloud iam service-accounts create test-gsa --display-name "Test GSA"
```

#### Create an encrypted key for that service account

```
$ ./get-key test-gsa@<project-name>.iam.gserviceaccount.com
Success! Wrote encrypted key to test-gsa@<project-name>.iam.gserviceaccount.com.json.gpg
```

#### Verify the key decryption

```
gpg --decrypt test-gsa@<project-name>.iam.gserviceaccount.com.json.gpg > credentials.json
```

At this point `credentials.json` should have valid Google Cloud credentials.


## Development

If you would like to run the code locally without deploying the Cloud Function, just start the server with:

```
make run
```

Then in a separate terminal, issue curl requests to the server on localhost:

```
curl -d '{"email": "test-gsa@<my-project>.iam.gserviceaccount.com"}' \
  'http://localhost:8080/encrypt' | jq -r .encryptedKey | base64 --decode > data.gpg
gpg --decrypt data.gpg
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.9 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.89 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | n/a |
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.89 |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloudfunctions_function.function](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function) | resource |
| [google_cloudfunctions_function_iam_member.invoker](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function_iam_member) | resource |
| [google_folder_iam_member.distributor](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_iam_member) | resource |
| [google_organization_iam_member.distributor](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_member) | resource |
| [google_project_iam_member.distributor](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.distributor](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_storage_bucket.function_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_object.archive](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |
| [local_file.invoker](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [archive_file.function](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_wrapper_script"></a> [create\_wrapper\_script](#input\_create\_wrapper\_script) | Whether to create the get-key wrapper script | `bool` | `true` | no |
| <a name="input_folder_ids"></a> [folder\_ids](#input\_folder\_ids) | Folder IDs where the Cloud Function will have access to create Service Account keys. | `list(any)` | `[]` | no |
| <a name="input_function_members"></a> [function\_members](#input\_function\_members) | List of IAM members (users, groups, etc) with the invoker permission on the CLoud Function | `list(string)` | n/a | yes |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | Name of the Cloud Function | `string` | `"key-distributor"` | no |
| <a name="input_org_id"></a> [org\_id](#input\_org\_id) | Organization ID where the Cloud Function will have access to create Service Account keys. | `string` | `""` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project Id for the Cloud Function. Also if folder\_ids and project\_ids are empty, the Cloud Function will be granted access to create keys in this project by default. | `string` | n/a | yes |
| <a name="input_project_ids"></a> [project\_ids](#input\_project\_ids) | Project IDs where the Cloud Function will have access to create Service Account keys. | `list(any)` | `[]` | no |
| <a name="input_public_key_file"></a> [public\_key\_file](#input\_public\_key\_file) | Path of the ascii armored gpg public key. Create by running `gpg --export --armor <key-id> > pubkey.asc` | `string` | `"pubkey.asc"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where the Cloud Function will run | `string` | `"us-central1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_function_name"></a> [function\_name](#output\_function\_name) | n/a |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | n/a |
| <a name="output_region"></a> [region](#output\_region) | n/a |

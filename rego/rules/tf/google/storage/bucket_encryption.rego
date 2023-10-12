package rules.tf_google_storage_bucket_encryption

import data.fugue


__rego__metadoc__ := {
	"id": "NFR8",
	"custom": {
	      "severity": "Medium"
	},
	"title": "Ensure that Cloud Storage bucket is encrypted",
	"description": "Storage buckets should be encrypted with KMS key",

}

resource_type := "google_storage_bucket"

default allow = false

allow {
 input.encryption[_].default_kms_key_name != ""
}
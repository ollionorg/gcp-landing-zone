package rules.tf_google_storage_uniform_access

import data.fugue

__rego__metadoc__ := {
	"id": "NFR8",
	"title": "Storage bucket uniform access control should be enabled",
	"description": "Storage bucket uniform access control should be enabled. Permissions for Cloud Storage can be granted using Cloud IAM or ACLs. Cloud IAM allows permissions at the bucket and project levels, whereas ACLs are only used by Cloud Storage, but allow per-object permissions. Uniform bucket-level access disables ACLs, which ensures that only Cloud IAM is used for permissions. This ensures that bucket-level and/or project-level permissions will be the same as object-level permissions.",
	"custom": {"severity": "Medium"},
}

resource_type := "google_storage_bucket"

default allow = false

allow {
  input.uniform_bucket_level_access == true
}
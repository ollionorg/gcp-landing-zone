package rules.tf_google_storage_no_public

import data.fugue
import data.google.storage.bucket_policy_library as lib

__rego__metadoc__ := {
	"id": "NFR8",
	"title": "Ensure Storage bucket access control should not contain allAuthenticateUsers or allUsers",
	"description": "Storage buckets should not be anonymously or publicly accessible. Cloud Storage bucket permissions should not be configured to allow 'allUsers' or 'allAuthenticatedUsers' access. These permissions provides broad, public access, which can result in unknown or undesired data access.",
	"custom": {"severity": "Medium"},
}

resource_type := "MULTIPLE"

buckets = fugue.resources("google_storage_bucket_access_control")

anonymous_users = {"allAuthenticatedUsers", "allUsers"}

has_public_access(bucket) {
  members = lib.members_for_bucket(bucket)
  count(members & anonymous_users) > 0
}

policy[j] {
  bucket = buckets[_]
  not has_public_access(bucket)
  j = fugue.allow_resource(bucket)
}

policy[j] {
  bucket = buckets[_]
  has_public_access(bucket)
  j = fugue.deny_resource(bucket)
}


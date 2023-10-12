package rules.tf_google_kms_no_anonymous_access_keyring

import data.fugue
import data.google.iam.policy_library as lib_policy
import data.google.kms.kms_policy_library as lib_kms_policy

__rego__metadoc__ := {
  "custom": {
    "controls": {
        "tool_detail": [
            "DSS05.06.6"
        ],
        "implementation": [
            "DSS05.06.2"
        ],
        "test_definition": [
            "DSS05.03.10"
        ]
      },
    "severity": "Critical"
  },
  "description": "KMS keys ring should not be anonymously or publicly accessible. IAM policy on Cloud KMS cryptokeys should restrict anonymous and/or public access. Granting permissions to `allUsers` or `allAuthenticatedUsers` allows anyone to access the dataset, which is not desirable if sensitive data is stored at the location.",
  "id": "FR43",
  "title": "KMS keys ring should not be anonymously or publicly accessible"
}

resource_type := "MULTIPLE"

kms_crypto_keys = fugue.resources("google_kms_key_ring")

invalid_members = {"allUsers", "allAuthenticatedUsers"}

access_granted_in_project_iam := true {
  m = invalid_members[_]
  role = lib_policy.project_roles_by_member[m][_]
  startswith(role, "roles/cloudkms")
}

has_anonymous_access(key) {
  access_granted_in_project_iam == true
}

has_anonymous_access(key) {
  members = lib_kms_policy.kms_members_for_key_id(key.id)
  count(members & invalid_members) > 0
}

policy[j] {
  key = kms_crypto_keys[_]
  not has_anonymous_access(key)
  j = fugue.allow_resource(key)
}

policy[j] {
  key = kms_crypto_keys[_]
  has_anonymous_access(key)
  j = fugue.deny_resource(key)
}
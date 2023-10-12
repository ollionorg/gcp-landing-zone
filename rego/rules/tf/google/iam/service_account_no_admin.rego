package rules.tf_google_iam_service_account_no_admin

import data.fugue
import data.google.iam.policy_library as lib

__rego__metadoc__ := {
  "custom": {
    "controls": {
        "tool_detail": [
            "DSS01.01.5"
        ],
        "implementation": [
            "DSS02.02.1"
        ],
        "test_definition": [
            ""
        ]
      },
    "severity": "High"
  },
  "description": "User-managed service accounts should not have admin privileges. A service account is a special Google account that belongs to an application or a VM instead of to an individual end-user. Service accounts should not have admin privileges as they give full access to an assigned application or a VM, and a service account can perform critical actions like delete, update, etc. without user intervention.",
  "id": "FR35",
  "title": "User-managed service accounts should not have admin privileges"
}

resource_type := "MULTIPLE"

admin_suffix = {"admin", "roles/editor", "roles/owner"}

is_admin_role(role) {
  endswith(lower(role), admin_suffix[_])
}

members_with_admin_role := {m |
  roles = lib.project_roles_by_member[m]
  is_admin_role(roles[_])
}

service_account_has_admin(service_account) {
  members_with_admin_role[service_account.id]
} {
  is_string(service_account.email)
  member_name := concat(":", ["serviceAccount", service_account.email])
  members_with_admin_role[member_name]
}

policy[j] {
  sa = lib.user_managed_service_accounts[_]
  not service_account_has_admin(sa)
  j = fugue.allow_resource(sa)
}

policy[j] {
  sa = lib.user_managed_service_accounts[_]
  service_account_has_admin(sa)
  j = fugue.deny_resource(sa)
}
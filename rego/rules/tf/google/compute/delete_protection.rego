package rules.tf_google_compute_delete_protection

__rego__metadoc__ := {
  "custom": {
    "severity": "High"
  },
  "description": "Enabling deletion protection ensures that any user or anonymous user can’t accidentally or intentionally delete your instance.",
  "id": "GCP_003",
  "title": "Ensure deletion protection is enabled to avoid accidental VM deletion and disable disk deletion."
}

resource_type := "google_compute_instance"

default allow = false

allow {
    input.deletion_protection == true
}
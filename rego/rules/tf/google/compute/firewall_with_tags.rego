package rules.tf_google_compute_firewall_with_tags

__rego__metadoc__ := {
  "custom": {
    "severity": "Low"
  },
  "description": "Add source_tags and target_tags to firewall rules",
  "id": "GCP_006",
  "title": "Ensure Firewall Rules are configured via Tag's (or) Label's"
}

resource_type := "google_compute_firewall"

default allow = false

allow {
  count(input.source_tags) > 0
  count(input.target_tags) > 0
}
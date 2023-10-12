package rules.tf_google_compute_subnet_private_google_access

__rego__metadoc__ := {
  "custom": {
    "severity": "Low"
  },
  "description": "Enabling \"Private Google Access\" for VPC subnets allows virtual machines to connect to the external IP addresses used by Google APIs and services.",
  "id": "GCP_011",
  "title": "VPC subnet 'Private Google Access' should be enabled"
}

resource_type := "google_compute_subnetwork"

default allow = false

allow {
  input.private_ip_google_access == true
}
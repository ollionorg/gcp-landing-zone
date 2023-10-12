package rules.tf_google_disable_ip_forwarding

__rego__metadoc__ := {
	"custom": {"severity": "Low"},
	"description": "Compute instances 'IP forwarding' should not be enabled. By default, a Compute Engine instance cannot forward a packet originated by another instance (\"IP forwarding\"). If this is enabled, Google Cloud no longer enforces packet source and destination checking, which can result in data loss or unintended information disclosure.",
	"id": "GCP_004",
	"title": "Compute instances 'IP forwarding' should not be enabled",
}

resource_type := "google_compute_instance"

default allow = false

allow {
	not input.can_ip_forward
}

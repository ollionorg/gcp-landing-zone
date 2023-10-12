package rules.tf_google_compute_no_public_ip

__rego__metadoc__ := {
	"custom": {"severity": "Medium"},
	"description": "Compute instances should not have public IP addresses. Compute Engine instances should not have public IP addresses to reduce potential attack surfaces, as public IPs enable direct access via the internet. Instances serving internet traffic should be configured behind load balancers, which provide an additional layer of security.",
	"id": "GCP_009",
	"title": "Compute instances should not have public IP addresses",
}

resource_type := "google_compute_instance"

default deny = false

deny {
	count(input.network_interface[_].access_config) > 0
}

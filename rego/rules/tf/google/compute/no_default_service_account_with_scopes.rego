package rules.tf_google_compute_no_default_service_account_with_scopes

import data.google.compute.compute_instance_library as lib

__rego__metadoc__ := {
	"custom": {"severity": "High"},
	"description": "Compute instances should not use the default service account with full access to all Cloud APIs. If using the default Compute Engine service account (which is not recommended), note that the \"Editor\" role is assigned with three possible scopes: allow default access, allow full access to all Cloud APIs, and set access for each Cloud API. Avoid allowing the scope for full access to all Cloud APIs, as this may enable users accessing the Compute Engine instance to perform cloud operations outside the scope of responsibility, or increase the potential impact of a compromised instance. Note that GKE-created instances should be exempted from this.",
	"id": "GCP_010",
	"title": "Compute instances should not use the default service account with full access to all Cloud APIs",
}

resource_type := "google_compute_instance"

default deny = false

invalid_scopes = {
	"https://www.googleapis.com/auth/cloud-platform",
	"cloud-platform",
}

deny {
	sa = input.service_account[_]
	lib.is_default_service_account(sa)
	invalid_scopes[sa.scopes[_]]
}

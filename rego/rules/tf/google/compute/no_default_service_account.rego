package rules.tf_google_compute_no_default_service_account

import data.google.compute.compute_instance_library as lib

__rego__metadoc__ := {
	"custom": {"severity": "Medium"},
	"description": "Compute instances should not use the default service account. The default Compute Engine service account has an \"Editor\" role, which allows read and write access to most Google Cloud services. To apply the principle of least privileges and mitigate the risk of a Compute Engine instance being compromised, create a new service account for an instance with only the necessary permissions assigned. Note that GKE-created instances should be exempted from this.",
	"id": "GCP_008",
	"title": "Compute instances should not use the default service account",
}

resource_type := "google_compute_instance"

default deny = false

deny {
	sa = input.service_account[_]
	lib.is_default_service_account(sa)
}

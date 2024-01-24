package rules.tf_google_disable_ip_forwarding

__rego__metadoc__ := {
	"custom": {"severity": "Low",
	"controls": {
	    "tool_detail": [
	            "DSS05.02.4"
	        ],
	        "implementation": [
	            ""
	        ],
	        "test_definition": [
	            ""
	        ],
	        "CIS-Google_v1.1.0": [
                "CIS-Google_v1.1.0_4.6"
            ],
              "CIS-Google_v1.2.0": [
                "CIS-Google_v1.2.0_4.6"
            ]
	    }
	},
	"description": "Compute instances 'IP forwarding' should not be enabled. By default, a Compute Engine instance cannot forward a packet originated by another instance (\"IP forwarding\"). If this is enabled, Google Cloud no longer enforces packet source and destination checking, which can result in data loss or unintended information disclosure.",
	"id": "GCP_004",
	"title": "Compute instances 'IP forwarding' should not be enabled",
}

resource_type := "google_compute_instance"

default allow = false

allow {
	not input.can_ip_forward
}

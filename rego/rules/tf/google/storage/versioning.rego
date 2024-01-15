package rules.tf_google_storage_versioning

__rego__metadoc__ := {
	"id": "NFR8",
	"title": "Ensure storage bucket should have versioning enabled",
	"description": "To check storage bucket has versioning enabled. resolution enable versioning.",
	"custom": {"severity": "Medium",
	    "controls": {
            "tool_detail": [
                "DSS06.06.3"
            ],
            "implementation": [
                ""
            ],
            "test_definition": [
                ""
            ]
        }
	},
}

resource_type := "google_storage_bucket"

default allow = false

allow {
    input.versioning[_].enabled == true
}
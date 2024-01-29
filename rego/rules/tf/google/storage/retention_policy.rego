package rules.tf_google_storage_retention_policy

__rego__metadoc__ := {
	"id": "NFR8",
	"title": "Ensure storage bucket retention policy enabled",
	"description": "To check storage bucket has retention policy enabled. resolution enable rentention policy for bucket.",
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
    count(input.retention_policy) > 0
}
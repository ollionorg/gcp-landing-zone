package rules.tf_google_pubsub_encryption

import data.fugue


__rego__metadoc__ := {
	"id": "FR35",
	"custom": {
        "controls": {
            "tool_detail": [
                "DSS01.01.5"
            ],
            "implementation": [
                "DSS02.02.1"
            ],
            "test_definition": [
                ""
            ]
          },
	    "severity": "Medium"
	},
	"title": "Ensure that pubsub encryption is enabled",
	"description": "Pub Sub topic should be encrypted with KMS key",
}

resource_type := "google_pubsub_topic"

default allow = false

allow {
 input.kms_key_name != ""
}
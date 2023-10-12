package rules.tf_google_kms_key_versioning

import data.fugue
import future.keywords.in

__rego__metadoc__ := {
	"id": "FR43",
	"custom": {
	    "controls": {
	        "tool_detail": [
	            "DSS05.06.6"
	        ],
	        "implementation": [
	            "DSS05.06.2"
	        ],
	        "test_definition": [
	            "DSS05.03.10"
	        ]
	      },
        "severity": "High"
    },
	"title": "Ensure kms key has versioning enabled",
	"description": "KMS keys should be have versioning enabled",
}

resource_type := "google_kms_crypto_key"

default allow = false

allow {
      input.version_template[_].protection_level != ""
      input.version_template[_].algorithm != ""
}
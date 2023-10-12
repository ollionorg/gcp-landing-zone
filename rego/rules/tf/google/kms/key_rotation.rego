package rules.tf_google_kms_key_rotation

import data.fugue

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
	"title": "KMS keys should be rotated every 100 days or less",
	"description": "KMS keys should be rotated frequently because rotation helps reduce the potential impact of a compromised key as users cannot use the old key to access the data.",
}

resource_type := "google_kms_crypto_key"

default allow = false

allow {
  rotation_per = input.rotation_period
  is_string(rotation_per)
  trimmed_rotation_per = trim_right(rotation_per, "s")
  num_rotation_per = to_number(trimmed_rotation_per)
  # 100 days in seconds
  num_rotation_per <= 8640000
}
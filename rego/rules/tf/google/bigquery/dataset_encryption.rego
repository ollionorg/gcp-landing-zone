package rules.tf_google_bigquery_dataset_encryption

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
	      "severity": "High"
	},
	"title": "Ensure that all BigQuery Tables are encrypted with Customer managed encryption key",
	"description": "BigQuery by default encrypts the data as rest by employing Envelope Encryption using Google managed cryptographic keys. The data is encrypted using the data encryption keys and data encryption keys themselves are further encrypted using key encryption keys. This is seamless and do not require any additional input from the user. ",
}

resource_type := "google_bigquery_table"

default allow = false

allow {
    input.encryption_configuration[_].kms_key_name != ""
}
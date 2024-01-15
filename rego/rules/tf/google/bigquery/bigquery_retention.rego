package rules.tf_google_bigquery_retention

__rego__metadoc__ := {
    "custom": {
        "severity": "High",
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
	      },
    },
	"id": "NFR1",
	"title": "Ensure that all BigQuery Table has retention policy",
	"description": "",
}

resource_type := "google_bigquery_table"

default allow = false

allow {
    input.expiration_time != ""
}
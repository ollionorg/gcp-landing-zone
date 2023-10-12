package rules.tf_google_compute_firewall_logging

__rego__metadoc__ := {
  "custom": {
	    "controls": {
	        "tool_detail": [
	            "DSS05.01.2"
	        ],
	        "implementation": [
	            "DSS05.07.5"
	        ],
	        "test_definition": [
	            "BAI07.05.6"
	        ]
	      },
    "severity": "Medium"
  },
  "description": "Firewall flow logs should be enabled. It is recommended that flow logs be enabled.",
  "id": "FR18",
  "title": "Firewall flow logs should be enabled"
}

resource_type := "google_compute_firewall"

default allow = false

allow {
  count(input.log_config) > 0
}
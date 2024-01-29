package rules.tf_google_compute_subnetwork_flow_logs

__rego__metadoc__ := {
  "custom": {
    "controls": {
        "tool_detail": [
            "DSS05.02.4"
        ],
        "implementation": [
            ""
        ],
        "test_definition": [
            ""
        ]
      },
    "severity": "Medium"
  },
  "description": "Network subnet flow logs should be enabled. It is recommended that flow logs be enabled for every business-critical VPC subnet, as they provide visibility into network traffic for each VM inside the subnet and can be used to detect anomalous traffic or insight during security workflows.",
  "id": "FR18",
  "title": "Network subnet flow logs should be enabled"
}

resource_type := "google_compute_subnetwork"

default allow = false

allow {
  count(input.log_config) > 0
} {
    input.enable_flow_logs == true
}
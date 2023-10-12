package rules.tf_google_kms_prevent_deletion

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
	"title": "Ensure KMS keys are protected from deletion",
	"description": "Protecting your Google Cloud Platform (GCP) KMS keys from deletion can help ensure the security and integrity of your keys. KMS keys are used to encrypt and decrypt data, and deleting them can cause data loss and disrupt the operation of your systems.",
}

resource_type := "google_kms_crypto_key"

default allow = false

allow {
    input.lifecycle[_].prevent_destroy == true
}
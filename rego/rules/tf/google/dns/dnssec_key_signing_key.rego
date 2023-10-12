package rules.tf_google_dns_dnssec_key_signing_key

__rego__metadoc__ := {
  "custom": {
    "controls": {
        "tool_detail": [
            "DSS01.02.1"
        ],
        "implementation": [
            "DSS05.02.3"
        ],
        "test_definition": [
            "BAI05.02.2"
        ]
      },
    "severity": "High"
  },
  "description": "DNS managed zone DNSSEC key-signing keys should not use RSASHA1. Domain Name System Security Extensions (DNSSEC) algorithm numbers may be used in CERT RRs. Zone signing (DNSSEC) and transaction security mechanisms (SIG(0) and TSIG) make use of particular subsets of these algorithms. The key-signing key algorithm should be strong, and RSASHA1 is no longer considered secure. Use it only for compatibility reasons.",
  "id": "FR47",
  "title": "DNS managed zone DNSSEC key-signing keys should not use RSASHA1"
}

resource_type := "google_dns_managed_zone"

invalid_algorithms = {"rsasha1"}

has_invalid_algorithm(dnssec_config) {
  key_spec := dnssec_config.default_key_specs[_]
  key_spec.key_type == "keySigning"
  invalid_algorithms[key_spec.algorithm]
}

default allow = false

allow {
  dnssec_config := input.dnssec_config[_]
  dnssec_config.state == "on"
  not has_invalid_algorithm(dnssec_config)
}
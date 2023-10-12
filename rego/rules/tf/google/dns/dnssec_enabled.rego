package rules.tf_google_dns_dnssec_enabled

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
    "severity": "Medium"
  },
  "description": "DNS managed zone DNSSEC should be enabled. Attackers can hijack the process of domain/IP lookup and redirect users to a malicious site. Domain Name System Security Extensions (DNSSEC) cryptographically signs DNS records and can help prevent attackers from issuing fake DNS responses that redirect browsers.",
  "id": "FR47",
  "title": "DNS managed zone DNSSEC should be enabled"
}

resource_type := "google_dns_managed_zone"

default allow = false

allow {
  input.dnssec_config[_].state == "on"
}
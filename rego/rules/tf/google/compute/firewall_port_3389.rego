package rules.tf_google_compute_firewall_port_3389

import data.google.compute.firewall_library as lib

import data.fugue

__rego__metadoc__ := {
	"id": "FR51",
	"custom": {
          "controls": {
            "tool_detail": [
                "DSS05.03.5"
            ],
            "implementation": [
                "DSS05.03.5"
            ],
            "test_definition": [
                "DSS05.02.3"
            ]
        },
      "severity": "High"
    },
	"description": "Network firewall rules should not permit ingress from 0.0.0.0/0 to port 3389 (RDP). If RDP is open to the internet, attackers can attempt to gain access to VM instances. Removing unfettered connectivity to remote console services, such as RDP, reduces a server's exposure to risk.",
	"title": "Network firewall rules should not permit ingress from 0.0.0.0/0 to port 3389 (RDP)",
}

firewalls = fugue.resources("google_compute_firewall")

resource_type := "MULTIPLE"

port = "3389"

policy[j] {
	firewall = firewalls[_]
	network = lib.network_for_firewall(firewall)
	lib.is_network_vulnerable(network, port)
	j = fugue.allow_resource(firewall)
}

policy[j] {
	firewall = firewalls[_]
	network = lib.network_for_firewall(firewall)
	not lib.is_network_vulnerable(network, port)
	p = lib.lowest_allow_ingress_zero_cidr_by_port(network, port)
	f = lib.firewalls_by_priority_and_port(network, p, port)[_]
	j = fugue.deny_resource(f)
}

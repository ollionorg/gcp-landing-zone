package rules.tf_google_compute_disable_serial_ports

import data.fugue
import data.google.compute.compute_instance_library as lib

__rego__metadoc__ := {
	"custom": {"severity": "High"},
	"description": "Compute instances 'Enable connecting to serial ports' should not be enabled. A Compute Engine instance's serial port - also known as an interactive serial console - does not support IP-based access restrictions. If enabled, the interactive serial console can be used by clients to connect to the instance from any IP address. This enables anyone who has the correct SSH key, username, and other login information to connect to the instance.",
	"id": "GCP_005",
	"title": "Compute instances 'Enable connecting to serial ports' should not be enabled",
}

resource_type := "MULTIPLE"

compute_instances = fugue.resources("google_compute_instance")

serial_port_enabled(instance) {
	lib.get_metadata_with_default(instance, "serial-port-enable", false)
}

policy[j] {
	instance = compute_instances[_]
	not serial_port_enabled(instance)
	j = fugue.allow_resource(instance)
}

policy[j] {
	instance = compute_instances[_]
	serial_port_enabled(instance)
	j = fugue.deny_resource(instance)
}

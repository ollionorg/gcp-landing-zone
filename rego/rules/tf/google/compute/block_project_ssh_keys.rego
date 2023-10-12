package rules.tf_google_compute_block_project_ssh_keys

import data.fugue
import data.google.compute.compute_instance_library as lib

__rego__metadoc__ := {
	"custom": {"severity": "Medium"},
	"description": "Compute instance 'block-project-ssh-keys' should be enabled. Project-wide SSH keys for Compute Engine instances may be easier to manage than instance-specific SSH keys, but if compromised, present increase security risk to all instances within a given project. Given this, using instance-specific SSH keys is the more secure approach. Please note that if OS Login is enabled, SSH keys in instance metadata are ignored, so blocking project-wide SSH keys is not necessary.",
	"id": "GCP_002",
	"title": "Compute instance 'block-project-ssh-keys' should be enabled",
}

resource_type := "MULTIPLE"

compute_instances = fugue.resources("google_compute_instance")

policy[j] {
	instance = compute_instances[_]

	# When enable-oslogin is true, it supersedes  block-project-ssh-keys
	lib.get_metadata_with_default(instance, "enable-oslogin", false)
	j = fugue.allow_resource(instance)
}

policy[j] {
	instance = compute_instances[_]
	lib.get_metadata_with_default(instance, "block-project-ssh-keys", false)
	j = fugue.allow_resource(instance)
}

policy[j] {
	instance = compute_instances[_]
	not lib.get_metadata_with_default(instance, "enable-oslogin", false)
	not lib.get_metadata_with_default(instance, "block-project-ssh-keys", false)
	j = fugue.deny_resource(instance)
}

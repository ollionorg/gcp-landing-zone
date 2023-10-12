package rules.tf_google_compute_disk_encryption

import data.fugue

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
	      "severity": "Medium"
	},
	"description": "Compute instance disks should be encrypted with customer-supplied encryption keys (CSEKs). Google Cloud encrypts all data at rest by default with Google-generated keys. However, for business critical instances, users may want to use customer-supplied encryption keys (CSEKs) for an additional layer of protection as data encrypted with CSEKs cannot be accessed by Google.",
	"title": "Compute instance disks should be encrypted with customer-supplied encryption keys (CSEKs)",
}

resource_type := "MULTIPLE"

compute_instances = fugue.resources("google_compute_instance")

base_message = "The following disks attached to this instance are not encrypted with a CSEK: %s"

encrypted(disk) {
	is_string(disk.disk_encryption_key_sha256)
	disk.disk_encryption_key_sha256 != ""
}

encrypted(disk) {
	is_string(disk.disk_encryption_key_raw)
	disk.disk_encryption_key_raw != ""
}

extract_unencrypted_disks(compute_instance) = ret {
	boot = object.get(compute_instance, "boot_disk", [])
	attached = object.get(compute_instance, "attached_disk", [])
	scratch = object.get(compute_instance, "scratch_disk", [])
	ret = [d |
		d = array.concat(boot, array.concat(attached, scratch))[_]
		not encrypted(d)
	]
}

policy[j] {
	instance = compute_instances[_]
	unencrypted_disks = extract_unencrypted_disks(instance)
	count(unencrypted_disks) < 1
	j = fugue.allow_resource(instance)
}

policy[j] {
	instance = compute_instances[_]
	unencrypted_disks = extract_unencrypted_disks(instance)
	count(unencrypted_disks) > 0
	disk_names = [d.device_name | d = unencrypted_disks[_]]
	message = sprintf(base_message, [concat(", ", disk_names)])
	j = fugue.deny_resource_with_message(instance, message)
}

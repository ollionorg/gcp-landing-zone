package rules.tf_google_logging_bucket_lock

import data.fugue

__rego__metadoc__ := {
  "custom": {
    "controls": {
        "tool_detail": [
            "DSS01.03.1"
        ],
        "implementation": [
            "MEA02.04.3"
        ],
        "test_definition": [
            "DSS01.03.4"
        ]
      },
    "severity": "Medium"
  },
  "description": "Logging storage bucket retention policies and Bucket Lock should be configured. A retention policy for a Cloud Storage bucket governs how long objects in the bucket must be retained. Bucket Lock is a feature to permanently restrict edits to the data retention policy. Bucket Lock should be enabled because it preserves activity logs for forensics and security investigations if the system is compromised by an attacker or malicious insider who wants to cover their tracks.",
  "id": "FR10",
  "title": "Logging storage bucket retention policies and Bucket Lock should be configured"
}

resource_type := "MULTIPLE"

buckets = fugue.resources("google_storage_bucket")
sinks = fugue.resources("google_logging_project_sink")

sink_buckets[id] {
  bucket = buckets[id]
  sink = sinks[_]
  sink.destination == concat("/", ["storage.googleapis.com", bucket.name])
} {
  bucket = buckets[id]
  sink = sinks[_]
  sink.destination == bucket.name  # Work with names at design time
}

valid_retention_policy(bucket) {
  bucket.retention_policy[_].is_locked == true
}

policy[j] {
  bucket = buckets[id]
  sink_buckets[id]
  valid_retention_policy(bucket)
  j = fugue.allow_resource(bucket)
}

policy[j] {
  bucket = buckets[_]
  sink_buckets[id]
  not valid_retention_policy(bucket)
  j = fugue.deny_resource(bucket)
}
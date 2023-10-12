package rules.tf_google_bigquery_no_public_access

import data.fugue

__rego__metadoc__ := {
	"id": "GCP_001",
	"title": "BigQuery datasets should not be anonymously or publicly accessible",
	"description": "BigQuery datasets should not be anonymously or publicly accessible. BigQuery datasets should not grant the 'allUsers' or 'allAuthenticatedUsers' permissions because these will allow anyone to access the dataset and any stored sensitive data.",
	"custom": {"severity": "Critical"},
}

resource_type := "google_bigquery_dataset"

anonymous_users = {"allAuthenticatedUsers", "allUsers"}

access_attributes = {"special_group", "iam_member"}

has_anonymous_access(ds) {
	access_attributes[k]
	member := ds.access[_][k]
	anonymous_users[member]
}

default deny = false

deny {
	has_anonymous_access(input)
}

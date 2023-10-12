package rules.tf_google_logging_audit_config_logtype

import data.fugue
import data.google.logging.audit_config_library as lib

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
  "description": "IAM default audit log config should include 'DATA_READ' and 'DATA_WRITE' log types. A best practice is to enable 'DATA_READ' and 'DATA_WRITE' data access log types as part of the default IAM audit log config, so that read and write operations on user-provided data are tracked across all relevant services. Please note that the 'ADMIN_WRITE' log type and BigQuery data access logs are enabled by default.",
  "id": "FR10",
  "title": "IAM default audit log config should include 'DATA_READ' and 'DATA_WRITE' log types"
}

resource_type := "MULTIPLE"
required_log_types = {"DATA_READ", "DATA_WRITE"}

has_required_log_types(audit_config) {
  log_types := {c | c = audit_config.audit_log_config[_].log_type}
  count(required_log_types - log_types) == 0
}

policy[j] {
  audit_config = lib.default_audit_config[_]
  has_required_log_types(audit_config)
  j = fugue.allow_resource(audit_config)
}

policy[j] {
  audit_config = lib.default_audit_config[_]
  not has_required_log_types(audit_config)
  j = fugue.deny_resource(audit_config)
}

policy[j] {
  fugue.input_type == "tf_runtime"
  count(lib.default_audit_config) == 0
  j = fugue.missing_resource_with_message(lib.audit_config_type, lib.missing_default_config_message)
}
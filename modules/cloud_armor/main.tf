#
# CLOUD ARMOR SECURITY POLICY RULES
#
resource "google_compute_security_policy" "armor-policy" {
  project = var.project_id
  name    = "cloud-armor-policy"
  #
  # for Default Allow Rule
  #

  dynamic "rule" {
    for_each = var.default_rules
    content {
      action   = rule.value.action
      priority = rule.value.priority
      match {
        versioned_expr = rule.value.versioned_expr
        config {
          src_ip_ranges = rule.value.src_ip_ranges
        }
      }
      description = rule.value.description
    }
  }

  dynamic "rule" {
    for_each = var.owasp_rules
    content {
      action   = rule.value.action
      priority = rule.value.priority
      match {
        expr {
          expression = rule.value.expression
        }
      }
      description = rule.value.description
    }
  }
}
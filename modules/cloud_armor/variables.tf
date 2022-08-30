# --------------------------------------------------------------------------
# Default ALLOW Rule
# --------------------------------------------------------------------------
variable "default_rules" {
  description = "default rule"
  default = {
    def_rule = {
      action         = "allow"
      priority       = "2147483647"
      versioned_expr = "SRC_IPS_V1"
      src_ip_ranges  = ["*"]
      description    = "default rule"
    }
  }
  type = map(object({
    action         = string
    priority       = string
    versioned_expr = string
    src_ip_ranges  = list(string)
    description    = string
    })
  )
}

variable "owasp_rules" {
  default = {
    rule_sqli = {
      description = "SQL Injection sensitivity level 2"
      action      = "deny(403)"
      priority    = 1000
      expression  = "evaluatePreconfiguredExpr('sqli-v33-stable',['owasp-crs-v030301-id942251-sqli','owasp-crs-v030301-id942490-sqli','owasp-crs-v030301-id942420-sqli','owasp-crs-v030301-id942431-sqli','owasp-crs-v030301-id942460-sqli','owasp-crs-v030301-id942511-sqli','owasp-crs-v030301-id942421-sqli','owasp-crs-v030301-id942432-sqli'])"
    }
    rule_xss = {
      description = "Cross-site scripting sensitivity level 2"
      action      = "deny(403)"
      priority    = 1001
      expression  = "evaluatePreconfiguredExpr('xss-v33-stable')"
    }
  }
  type = map(object({
    description = string
    action      = string
    priority    = string
    expression  = string
  }))
}


variable "project_id" {
  type        = string
  description = "It contains the projectID"
}










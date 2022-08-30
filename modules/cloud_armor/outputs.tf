output "armor_id" {
  description = "It contains Cloud Armor policyId"
  value       = google_compute_security_policy.armor-policy.id
}
/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

output "dns_hub_project_id" {
  value       = local.dns_hub_project_id
  description = "The DNS hub project ID"
}

//interconnect-firewall

output "firewall-name" {
  value = google_compute_instance.firewall.*.name
}

output "elb_public_ip" {
  #value = google_compute_global_forwarding_rule.default.ip_address
  value = google_compute_global_forwarding_rule.default.*.id

}

output "firewall-untrust-ips-for-nat-healthcheck" {
  value = google_compute_instance.firewall.*.network_interface.0.subnetwork #address
}

output "internal-lb-ip-for-nat-healthcheck" {
  value = google_compute_forwarding_rule.my-int-lb-forwarding-rule.*.ip_address
}

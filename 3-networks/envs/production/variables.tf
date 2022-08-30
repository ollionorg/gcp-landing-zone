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

variable "dns_enable_logging" {
  type        = bool
  description = "Toggle DNS logging for VPC DNS."
  default     = true
}

variable "subnetworks_enable_logging" {
  type        = bool
  description = "Toggle subnetworks flow logging for VPC Subnetworks."
  default     = true
}

variable "firewall_enable_logging" {
  type        = bool
  description = "Toggle firewall logging for VPC Firewalls."
  default     = true
}

variable "dns_enable_inbound_forwarding" {
  type        = bool
  description = "Toggle inbound query forwarding for VPC DNS."
  default     = true
}

variable "windows_activation_enabled" {
  type        = bool
  description = "Enable Windows license activation for Windows workloads."
  default     = false
}

variable "nat_enabled" {
  type        = bool
  description = "Toggle creation of NAT cloud router."
  default     = false
}

variable "nat_bgp_asn" {
  type        = number
  description = "BGP ASN for first NAT cloud routes."
  default     = 64514
}

variable "nat_num_addresses_region1" {
  type        = number
  description = "Number of external IPs to reserve for first Cloud NAT."
  default     = 2
}

variable "nat_num_addresses_region2" {
  type        = number
  description = "Number of external IPs to reserve for second Cloud NAT."
  default     = 2
}

variable "nat_num_addresses" {
  type        = number
  description = "Number of external IPs to reserve for Cloud NAT."
  default     = 2
}

variable "optional_fw_rules_enabled" {
  type        = bool
  description = "Toggle creation of optional firewall rules: IAP SSH, IAP RDP and Internal & Global load balancing health check and load balancing IP ranges."
  default     = false
}

variable "parent_folder" {
  description = "Optional - for an organization with existing projects or for development/validation. It will place all the example foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist. Must be the same value used in previous step."
  type        = string
  default     = ""
}

variable "enable_partner_interconnect" {
  description = "Enable Partner Interconnect in the environment."
  type        = bool
  default     = false
}

variable "preactivate_partner_interconnect" {
  description = "Preactivate Partner Interconnect VLAN attachment in the environment."
  type        = bool
  default     = false
}
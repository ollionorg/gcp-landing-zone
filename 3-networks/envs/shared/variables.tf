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

variable "bgp_asn_dns" {
  type        = number
  description = "BGP Autonomous System Number (ASN)."
  default     = 64667
}

variable "parent_folder" {
  description = "Optional - for an organization with existing projects or for development/validation. It will place all the example foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist. Must be the same value used in previous step."
  type        = string
  default     = ""
}

variable "base_hub_windows_activation_enabled" {
  type        = bool
  description = "Enable Windows license activation for Windows workloads in Base Hub"
  default     = false
}

variable "restricted_hub_windows_activation_enabled" {
  type        = bool
  description = "Enable Windows license activation for Windows workloads in Restricted Hub."
  default     = false
}

variable "base_hub_dns_enable_inbound_forwarding" {
  type        = bool
  description = "Toggle inbound query forwarding for Base Hub VPC DNS."
  default     = true
}

variable "restricted_hub_dns_enable_inbound_forwarding" {
  type        = bool
  description = "Toggle inbound query forwarding for Restricted Hub VPC DNS."
  default     = true
}

variable "base_hub_dns_enable_logging" {
  type        = bool
  description = "Toggle DNS logging for Base Hub VPC DNS."
  default     = true
}

variable "restricted_hub_dns_enable_logging" {
  type        = bool
  description = "Toggle DNS logging for Restricted Hub VPC DNS."
  default     = true
}

variable "base_hub_firewall_enable_logging" {
  type        = bool
  description = "Toggle firewall logging for VPC Firewalls in Base Hub VPC."
  default     = true
}

variable "restricted_hub_firewall_enable_logging" {
  type        = bool
  description = "Toggle firewall logging for VPC Firewalls in Restricted Hub VPC."
  default     = true
}

variable "base_hub_optional_fw_rules_enabled" {
  type        = bool
  description = "Toggle creation of optional firewall rules: IAP SSH, IAP RDP and Internal & Global load balancing health check and load balancing IP ranges in Base Hub VPC."
  default     = false
}

variable "restricted_hub_optional_fw_rules_enabled" {
  type        = bool
  description = "Toggle creation of optional firewall rules: IAP SSH, IAP RDP and Internal & Global load balancing health check and load balancing IP ranges in Restricted Hub VPC."
  default     = false
}

variable "base_hub_nat_enabled" {
  type        = bool
  description = "Toggle creation of NAT cloud router in Base Hub."
  default     = false
}

variable "restricted_hub_nat_enabled" {
  type        = bool
  description = "Toggle creation of NAT cloud router in Restricted Hub."
  default     = false
}

variable "base_hub_nat_bgp_asn" {
  type        = number
  description = "BGP ASN for first NAT cloud routes in Base Hub."
  default     = 64514
}

variable "restricted_hub_nat_bgp_asn" {
  type        = number
  description = "BGP ASN for first NAT cloud routes in Restricted Hub."
  default     = 64514
}

variable "base_hub_nat_num_addresses_region1" {
  type        = number
  description = "Number of external IPs to reserve for first Cloud NAT in Base Hub."
  default     = 2
}

variable "restricted_hub_nat_num_addresses_region1" {
  type        = number
  description = "Number of external IPs to reserve for first Cloud NAT in Restricted Hub."
  default     = 2
}

variable "base_hub_nat_num_addresses_region2" {
  type        = number
  description = "Number of external IPs to reserve for second Cloud NAT in Base Hub."
  default     = 2
}

variable "restricted_hub_nat_num_addresses_region2" {
  type        = number
  description = "Number of external IPs to reserve for second Cloud NAT in Restricted Hub."
  default     = 2
}

variable "firewall_policies_enable_logging" {
  type        = bool
  description = "Toggle hierarchical firewall logging."
  default     = true
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

variable "shared_vpc_host_project" {
  description = "Toggle shared VPC host project"
  default     = false
  type        = bool
}

variable "delete_default_internet_gateway_routes" {
  description = "If set to true, default routes (0.0.0.0/0) will be deleted immediately after network creation"
  default     = true
  type        = bool
}

variable "subnet_private_access" {
  description = "When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access."
  default     = true
  type        = bool
}

variable "destination_range" {
  description = "The destination range of outgoing packets that this route applies to. Only IPv4 is supported"
  type        = string
}

variable "next_hop_internet" {
  description = "URL to a gateway that should handle matching packets. Currently, you can only specify the internet gateway, using a full or partial valid URL"
  type        = bool
}

variable "enable_inbound_forwarding" {
  description = "When enabled, a virtual IP address will be allocated from each of the sub-networks that are bound to this policy"
  type        = bool
}

variable "advertised_ip_ranges" {
  description = "User-specified list of individual IP ranges to advertise in custom mode."
  type        = string
}

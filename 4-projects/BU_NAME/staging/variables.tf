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

variable "parent_folder" {
  description = "Optional - for an organization with existing projects or for development/validation. It will place all the example foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist. Must be the same value used in previous step."
  type        = string
  default     = ""
}

variable "peering_module_depends_on" {
  description = "List of modules or resources peering module depends on."
  type        = list(any)
  default     = []
}

variable "firewall_enable_logging" {
  type        = bool
  description = "Toggle firewall logging for VPC Firewalls."
  default     = true
}

variable "optional_fw_rules_enabled" {
  type        = bool
  description = "Toggle creation of optional firewall rules: IAP SSH, IAP RDP and Internal & Global load balancing health check and load balancing IP ranges."
  default     = false
}

variable "windows_activation_enabled" {
  type        = bool
  description = "Enable Windows license activation for Windows workloads."
  default     = false
}

variable "alert_spent_percents" {
  description = "A list of percentages of the budget to alert on when threshold is exceeded"
  type        = list(number)
  default     = [0.5, 0.75, 0.9, 0.95]
}

variable "alert_pubsub_topic" {
  description = "The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}`"
  type        = string
  default     = null
}

variable "budget_amount" {
  description = "The amount to use as the budget"
  type        = number
  default     = 1000
}

variable "secrets_prj_suffix" {
  description = "Name suffix to use for secrets project created."
  type        = string
  default     = "env-secrets"
}

variable "location_kms" {
  description = "Case-Sensitive Location for KMS Keyring (Should be same region as the GCS Bucket)"
  type        = string
  default     = "us"
}

variable "location_gcs" {
  description = "Case-Sensitive Location for GCS Bucket (Should be same region as the KMS Keyring)"
  type        = string
  default     = "US"
}

variable "keyring_name" {
  description = "Name to be used for KMS Keyring"
  type        = string
  default     = "sample-keyring"
}

variable "key_name" {
  description = "Name to be used for KMS Key"
  type        = string
  default     = "crypto-key-example"
}

variable "key_rotation_period" {
  description = "Rotation period in seconds to be used for KMS Key"
  type        = string
  default     = "7776000s"
}

variable "gcs_bucket_prefix" {
  description = "Name prefix to be used for GCS Bucket"
  type        = string
  default     = "cmek-encrypted-bucket"
}

variable "base_suffix" {
  description = "Base shared VPC suffix name"
  type        = string
}

variable "peer_suffix" {
  description = "Peering VPC suffix name"
  type        = string
}

variable "res_suffix" {
  description = "Restricted shared VPC suffix nam"
  type        = string
}

variable "app" {
  description = "Application name"
  type        = string
}


variable "billing_code" {
  description = "billing code for application"
  type        = string
}

variable "floating_suffix" {
  description = "floating project suffix"
  type        = string
}

variable "base_vpc_type" {
  description = "Base shared VPC type"
  type        = string
}

variable "res_vpc_type" {
  description = "Restricted shared VPC type"
  type        = string
}

variable "peer_base" {
  description = "peering base name suffix"
  type        = string
}

variable "peer_fw_name" {
  description = "peering firewall name prefix"
  type        = string
}

variable "stage_name" {
  description = "it contains the stage name"
  type        = string
}

variable "infra_suffix" {
  description = "prefix used to attach for infra-pipeline project"
  type        = string
}

variable "bu_name" {
  description = "Name to create the business unit"
  type        = string
}

variable "bu_code" {
  description = "Name to create the business unit"
  type        = string

  validation {
    condition = length(var.bu_code) == 3
    error_message = "INVALID bu_code VALUE: The 'bu_code' variable should be 3 characters. Please pass the correct value in the terraform.tfvars file."
  }

}
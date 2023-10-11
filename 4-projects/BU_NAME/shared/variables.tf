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

variable "infra_suffix" {
  description = "inrfa_pipeline project suffix"
  type        = string
  default     = null
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
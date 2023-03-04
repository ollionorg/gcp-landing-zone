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
  description = "Optional - for an organization with existing projects or for production/validation. It will place all the example foundation resources under the provided folder instead of the root organization. The value is the numeric folder ID. The folder must already exist. Must be the same value used in previous step."
  type        = string
  default     = ""
}

variable "stage_name" {
  description = "it contains the stage name"
  type        = string
}

variable "dbps" {
  description = "SQL Database instance"
  type = string
  sensitive = true
}

variable "bu_name" {
  description = "BU Name"
  type = string
}

variable "bu_code" {
  description = "BU Code"
  type = string
}
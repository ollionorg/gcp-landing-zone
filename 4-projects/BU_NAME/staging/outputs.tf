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

output "base_shared_vpc_project" {
  description = "Project sample base project."
  value       = module.base_shared_vpc_project.project_id
}

output "base_shared_vpc_project_sa" {
  description = "Project sample base project SA."
  value       = module.base_shared_vpc_project.sa
}

output "base_shared_vpc_project_number" {
  description = "Base Project number."
  value       = module.base_shared_vpc_project.project_number
}

output "floating_project" {
  description = "Project sample floating project."
  value       = module.floating_project.project_id
}

output "peering_project" {
  description = "Project sample peering project id."
  value       = module.peering_project.project_id
}

output "peering_network" {
  description = "Peer network peering resource."
  value       = module.peering.peer_network_peering
}

output "restricted_shared_vpc_project" {
  description = "Project sample restricted project id."
  value       = try(module.restricted_shared_vpc_project[0].project_id, null)
}

output "restricted_shared_vpc_project_number" {
  description = "Project sample restricted project."
  value       = try(module.restricted_shared_vpc_project[0].project_number, null)
}

output "vpc_service_control_perimeter_name" {
  description = "VPC Service Control name."
  value       = try(data.terraform_remote_state.networks.outputs.restricted_service_perimeter_name, null)
}

output "restricted_enabled_apis" {
  description = "Activated APIs."
  value       = try(module.restricted_shared_vpc_project[0].enabled_apis, null)
}

output "access_context_manager_policy_id" {
  description = "Access Context Manager Policy ID."
  value       = data.terraform_remote_state.org.outputs.access_context_manager_policy_id
}

output "peering_complete" {
  description = "Output to be used as a module dependency."
  value       = module.peering.complete
}

output "env_secrets_project" {
  description = "Project sample peering project id."
  value       = module.env_secrets_project.project_id
}

output "keyring" {
  description = "The name of the keyring."
  value       = module.kms.keyring
}

output "keys" {
  description = "List of created key names."
  value       = keys(module.kms.keys)
}

output "bucket" {
  description = "The created storage bucket"
  value       = module.gcs_buckets.bucket
}

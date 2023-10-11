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
 **/

module "env" {
  source                     = "../../../modules/env_baseline"
  env                        = basename(path.cwd)
  environment_code           = local.environment_code
  parent_id                  = local.parent_folder != "" ? "folders/${local.parent_folder}" : "organizations/${data.terraform_remote_state.bootstrap.outputs.org_id}"
  org_id                     = local.org_id
  billing_account            = local.billing_account
  terraform_service_account  = local.terraform_service_account
  monitoring_workspace_users = local.monitoring_workspace_users
  project_prefix             = local.project_prefix
  folder_prefix              = local.folder_prefix
  primary_contact            = local.primary_contact
  secondary_contact          = local.secondary_contact
  vpc_prefix                 = local.vpc_prefix
  custom_labels              = local.custom_labels
  enable_env_log_sink        = local.enable_env_log_sink
  enable_restricted_network  = local.enable_restricted_network
}

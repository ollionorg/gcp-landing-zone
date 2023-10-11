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

module "floating_project" {
  source                      = "../../../modules/single_project"
  impersonate_service_account = local.terraform_service_account
  org_id                      = local.org_id
  billing_account             = local.billing_account
  folder_id                   = data.google_active_folder.env.name
  environment                 = basename(path.cwd)
  stage                       = var.stage_name
  bu                          = var.bu_name
  alert_spent_percents        = var.alert_spent_percents
  alert_pubsub_topic          = var.alert_pubsub_topic
  budget_amount               = var.budget_amount
  project_prefix              = local.project_prefix

  # Metadata
  project_suffix    = "${var.bu_code}-${var.floating_suffix}"
  application_name  = "${var.bu_code}-${local.prod_env_code}-${var.app}"
  billing_code      = var.billing_code
  primary_contact   = local.primary_contact
  secondary_contact = local.secondary_contact
  business_code     = var.bu_code
  custom_labels     = local.custom_labels
}

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

/******************************************
  Projects for monitoring workspaces
*****************************************/

module "logging_project" {
  count                       = var.enable_env_log_sink ? 1 : 0
  source                      = "../../modules/monitoring_project"
  random_project_id           = "true"
  impersonate_service_account = var.terraform_service_account
  name                        = "${var.project_prefix}-${var.environment_code}-logging"
  org_id                      = var.org_id
  billing_account             = var.billing_account
  folder_id                   = google_folder.env.id
  disable_services_on_destroy = false
  activate_apis = [
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "billingbudgets.googleapis.com"
  ]

  labels = merge(
    var.custom_labels, {
      environment       = var.env
      application_name  = "${var.env}-logging"
      billing_code      = "${var.env}-${random_id.billing_code_random_id.hex}"
      primary_contact   = var.primary_contact
      secondary_contact = var.secondary_contact
      business_code     = var.bu_code
      env_code          = var.environment_code
      stage_name        = var.stage
      bu_name           = var.bu
      organisation_id   = var.org_id
    }
  )

  budget_alert_pubsub_topic   = var.monitoring_project_alert_pubsub_topic
  budget_alert_spent_percents = var.monitoring_project_alert_spent_percents
  budget_amount               = var.monitoring_project_budget_amount
}

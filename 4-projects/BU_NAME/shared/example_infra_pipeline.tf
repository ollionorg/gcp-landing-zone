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

module "app_infra_cloudbuild_project" {
  source                      = "../../../modules/single_project"
  impersonate_service_account = local.terraform_service_account
  org_id                      = local.org_id
  billing_account             = local.billing_account
  folder_id                   = data.google_active_folder.common.name
  environment                 = "common"
  stage                       = var.stage_name
  bu                          = var.bu_name
  alert_spent_percents        = var.alert_spent_percents
  alert_pubsub_topic          = var.alert_pubsub_topic
  budget_amount               = var.budget_amount
  project_prefix              = local.project_prefix

  activate_apis = [
    "cloudbuild.googleapis.com",
    "sourcerepo.googleapis.com",
    "cloudkms.googleapis.com",
    "iam.googleapis.com",
    "artifactregistry.googleapis.com",
    "cloudresourcemanager.googleapis.com"
  ]

  # Metadata
  project_suffix    = var.infra_suffix
  application_name  = "${var.app}-${var.infra_suffix}"
  billing_code      = var.billing_code
  primary_contact   = local.primary_contact
  secondary_contact = local.secondary_contact
  business_code     = var.bu_code
}

module "infra_pipelines" {
  source                      = "../../../modules/infra_pipelines"
  impersonate_service_account = local.terraform_service_account
  cloudbuild_project_id       = module.app_infra_cloudbuild_project.project_id
  project_prefix              = local.project_prefix
  billing_account             = local.billing_account
  default_region              = local.default_region
  app_infra_repos             = ["${var.bu_code}-app"]
  depends_on = [
    module.app_infra_cloudbuild_project
  ]
}


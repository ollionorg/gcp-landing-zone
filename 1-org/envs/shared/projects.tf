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
  Projects for log sinks
*****************************************/

module "org_audit_logs" {
  source                      = "../../../modules/base_network_hub"
  random_project_id           = "true"
  impersonate_service_account = local.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${local.project_prefix}-${local.shared_environment_code}-audit-logging"
  org_id                      = local.org_id
  billing_account             = local.billing_account
  folder_id                   = google_folder.common.id
  activate_apis = [
    "logging.googleapis.com",
    "bigquery.googleapis.com",
    "billingbudgets.googleapis.com",
    "cloudkms.googleapis.com"
  ]

  labels = merge(
    local.custom_labels, {
      environment       = "production"
      application_name  = "org-logging"
      primary_contact   = local.primary_contact
      secondary_contact = local.secondary_contact
      organisation_id   = local.org_id
    }
  )
  budget_alert_pubsub_topic   = var.org_audit_logs_project_alert_pubsub_topic
  budget_alert_spent_percents = var.org_audit_logs_project_alert_spent_percents
  budget_amount               = var.org_audit_logs_project_budget_amount
}

/******************************************
  Projects for log sinks
*****************************************/

module "org_security_logs" {
  source                      = "../../../modules/base_network_hub"
  random_project_id           = "true"
  impersonate_service_account = local.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${local.project_prefix}-${local.shared_environment_code}-security-logging"
  org_id                      = local.org_id
  billing_account             = local.billing_account
  folder_id                   = google_folder.common.id
  activate_apis = [
    "logging.googleapis.com",
    "bigquery.googleapis.com",
    "billingbudgets.googleapis.com",
    "cloudkms.googleapis.com"
  ]

  labels = merge(
    local.custom_labels, {
      environment       = "production"
      application_name  = "org-logging"
      primary_contact   = local.primary_contact
      secondary_contact = local.secondary_contact
      organisation_id   = local.org_id
    }
  )
  budget_alert_pubsub_topic   = var.org_audit_logs_project_alert_pubsub_topic
  budget_alert_spent_percents = var.org_audit_logs_project_alert_spent_percents
  budget_amount               = var.org_audit_logs_project_budget_amount
}

/******************************************
  Projects for log sinks
*****************************************/

module "org_operations_logs" {
  source                      = "../../../modules/base_network_hub"
  random_project_id           = "true"
  impersonate_service_account = local.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${local.project_prefix}-${local.shared_environment_code}-operations-logging"
  org_id                      = local.org_id
  billing_account             = local.billing_account
  folder_id                   = google_folder.common.id
  activate_apis = [
    "logging.googleapis.com",
    "bigquery.googleapis.com",
    "billingbudgets.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudfunctions.googleapis.com"
  ]

  labels = merge(
    local.custom_labels, {
      environment       = "production"
      application_name  = "org-logging"
      primary_contact   = local.primary_contact
      secondary_contact = local.secondary_contact
      organisation_id   = local.org_id
    }
  )
  budget_alert_pubsub_topic   = var.org_audit_logs_project_alert_pubsub_topic
  budget_alert_spent_percents = var.org_audit_logs_project_alert_spent_percents
  budget_amount               = var.org_audit_logs_project_budget_amount
}

module "org_billing_logs" {
  source                      = "../../../modules/base_network_hub"
  random_project_id           = "true"
  impersonate_service_account = data.terraform_remote_state.bootstrap.outputs.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${local.project_prefix}-${local.shared_environment_code}-billing-logs"
  org_id                      = local.org_id
  billing_account             = local.billing_account
  folder_id                   = google_folder.common.id
  activate_apis = [
    "logging.googleapis.com",
    "bigquery.googleapis.com",
    "billingbudgets.googleapis.com"
  ]

  labels = merge(
    local.custom_labels, {
      environment       = "production"
      application_name  = "org-billing-logs"
      primary_contact   = local.primary_contact
      secondary_contact = local.secondary_contact
      organisation_id   = local.org_id
    }
  )
  budget_alert_pubsub_topic   = var.org_billing_logs_project_alert_pubsub_topic
  budget_alert_spent_percents = var.org_billing_logs_project_alert_spent_percents
  budget_amount               = var.org_billing_logs_project_budget_amount
}

/******************************************
  Project for Org-wide Secrets
*****************************************/

module "org_secrets" {
  source                      = "../../../modules/base_network_hub"
  random_project_id           = "true"
  impersonate_service_account = local.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${local.project_prefix}-${local.shared_environment_code}-secrets"
  org_id                      = local.org_id
  billing_account             = local.billing_account
  folder_id                   = google_folder.common.id
  activate_apis = [
    "logging.googleapis.com",
    "secretmanager.googleapis.com",
    "billingbudgets.googleapis.com"
  ]

  labels = merge(
    local.custom_labels, {
      environment       = "production"
      application_name  = "org-secrets"
      primary_contact   = local.primary_contact
      secondary_contact = local.secondary_contact
      organisation_id   = local.org_id
    }
  )
  budget_alert_pubsub_topic   = var.org_secrets_project_alert_pubsub_topic
  budget_alert_spent_percents = var.org_secrets_project_alert_spent_percents
  budget_amount               = var.org_secrets_project_budget_amount
}

/******************************************
  Project for Interconnect
*****************************************/

module "trust_interconnect" {
  source                      = "../../../modules/base_network_hub"
  count                       = local.enable_interconnect_projects ? 1 : 0
  random_project_id           = "true"
  impersonate_service_account = local.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${local.project_prefix}-${local.shared_environment_code}-t-interconnect"
  org_id                      = local.org_id
  billing_account             = local.billing_account
  folder_id                   = google_folder.common.id
  activate_apis = [
    "billingbudgets.googleapis.com",
    "compute.googleapis.com"
  ]

  labels = merge(
    local.custom_labels, {
      environment       = "production"
      application_name  = "org-trust-interconnect"
      primary_contact   = local.primary_contact
      secondary_contact = local.secondary_contact
      organisation_id   = local.org_id
    }
  )
  budget_alert_pubsub_topic   = var.interconnect_project_alert_pubsub_topic
  budget_alert_spent_percents = var.interconnect_project_alert_spent_percents
  budget_amount               = var.interconnect_project_budget_amount

}

module "notrust_interconnect" {
  source                      = "../../../modules/base_network_hub"
  count                       = local.enable_interconnect_projects ? 1 : 0
  random_project_id           = "true"
  impersonate_service_account = local.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${local.project_prefix}-${local.shared_environment_code}-nt-interconnect"
  org_id                      = local.org_id
  billing_account             = local.billing_account
  folder_id                   = google_folder.common.id
  activate_apis = [
    "billingbudgets.googleapis.com",
    "compute.googleapis.com"
  ]

  labels = merge(
    local.custom_labels, {
      environment       = "production"
      application_name  = "org-notrust-interconnect"
      primary_contact   = local.primary_contact
      secondary_contact = local.secondary_contact
      organisation_id   = local.org_id
    }
  )
  budget_alert_pubsub_topic   = var.interconnect_project_alert_pubsub_topic
  budget_alert_spent_percents = var.interconnect_project_alert_spent_percents
  budget_amount               = var.interconnect_project_budget_amount

}

/******************************************
  Project for SCC Notifications
*****************************************/

module "scc_notifications" {
  source                      = "../../../modules/base_network_hub"
  random_project_id           = "true"
  impersonate_service_account = local.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${local.project_prefix}-${local.shared_environment_code}-scc"
  org_id                      = local.org_id
  billing_account             = local.billing_account
  folder_id                   = google_folder.common.id
  activate_apis = [
    "logging.googleapis.com",
    "pubsub.googleapis.com",
    "securitycenter.googleapis.com",
    "billingbudgets.googleapis.com"
  ]

  labels = merge(
    local.custom_labels, {
      environment       = "production"
      application_name  = "org-scc"
      primary_contact   = local.primary_contact
      secondary_contact = local.secondary_contact
      organisation_id   = local.org_id
    }
  )
  budget_alert_pubsub_topic   = var.scc_notifications_project_alert_pubsub_topic
  budget_alert_spent_percents = var.scc_notifications_project_alert_spent_percents
  budget_amount               = var.scc_notifications_project_budget_amount
}

/******************************************
  Project for DNS Hub
*****************************************/

module "dns_hub" {
  source                      = "../../../modules/base_network_hub"
  random_project_id           = "true"
  impersonate_service_account = local.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${local.project_prefix}-${local.shared_environment_code}-dns-hub"
  org_id                      = local.org_id
  billing_account             = local.billing_account
  folder_id                   = google_folder.common.id

  activate_apis = [
    "compute.googleapis.com",
    "dns.googleapis.com",
    "servicenetworking.googleapis.com",
    "logging.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "billingbudgets.googleapis.com"
  ]

  labels = merge(
    local.custom_labels, {
      environment       = "production"
      application_name  = "org-dns-hub"
      primary_contact   = local.primary_contact
      secondary_contact = local.secondary_contact
      organisation_id   = local.org_id
    }
  )
  budget_alert_pubsub_topic   = var.dns_hub_project_alert_pubsub_topic
  budget_alert_spent_percents = var.dns_hub_project_alert_spent_percents
  budget_amount               = var.dns_hub_project_budget_amount
}

/******************************************
  Project for Base Network Hub
*****************************************/

module "base_network_hub" {
  source                      = "../../../modules/base_network_hub"
  count                       = local.enable_hub_and_spoke ? 1 : 0
  random_project_id           = "true"
  impersonate_service_account = local.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${local.project_prefix}-${local.shared_environment_code}-base-net-hub"
  org_id                      = local.org_id
  billing_account             = local.billing_account
  folder_id                   = google_folder.common.id

  activate_apis = [
    "compute.googleapis.com",
    "dns.googleapis.com",
    "servicenetworking.googleapis.com",
    "logging.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "billingbudgets.googleapis.com"
  ]

  labels = merge(
    local.custom_labels, {
      environment       = "production"
      application_name  = "org-base-net-hub"
      primary_contact   = local.primary_contact
      secondary_contact = local.secondary_contact
      organisation_id   = local.org_id
    }
  )
  budget_alert_pubsub_topic   = var.base_net_hub_project_alert_pubsub_topic
  budget_alert_spent_percents = var.base_net_hub_project_alert_spent_percents
  budget_amount               = var.base_net_hub_project_budget_amount
}

/******************************************
  Project for Restricted Network Hub
*****************************************/

module "restricted_network_hub" {
  count                       = local.enable_restricted_network && local.enable_hub_and_spoke ? 1 : 0
  source                      = "../../../modules/base_network_hub"
  random_project_id           = "true"
  impersonate_service_account = local.terraform_service_account
  default_service_account     = "deprivilege"
  name                        = "${local.project_prefix}-${local.shared_environment_code}-restricted-net-hub"
  org_id                      = local.org_id
  billing_account             = local.billing_account
  folder_id                   = google_folder.common.id


  activate_apis = [
    "compute.googleapis.com",
    "dns.googleapis.com",
    "servicenetworking.googleapis.com",
    "logging.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "billingbudgets.googleapis.com"
  ]

  labels = merge(
    local.custom_labels, {
      environment       = "production"
      application_name  = "org-restricted-net-hub"
      primary_contact   = local.primary_contact
      secondary_contact = local.secondary_contact
      organisation_id   = local.org_id
    }
  )

  budget_alert_pubsub_topic   = var.restricted_net_hub_project_alert_pubsub_topic
  budget_alert_spent_percents = var.restricted_net_hub_project_alert_spent_percents
  budget_amount               = var.restricted_net_hub_project_budget_amount
}

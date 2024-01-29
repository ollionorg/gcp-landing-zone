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
  SCC Notification
*****************************************/

resource "google_pubsub_topic" "scc_notification_topic" {
  name         = "${local.project_name}-topic-scc-notification"
  project      = module.scc_notifications.project_id
  kms_key_name = google_kms_crypto_key.audit_logs_key.id
}

resource "google_pubsub_subscription" "scc_notification_subscription" {
  name    = "${local.project_name}-sub-scc-notification"
  topic   = google_pubsub_topic.scc_notification_topic.name
  project = module.scc_notifications.project_id
}

resource "google_scc_notification_config" "scc_notification_config" {
  config_id    = "${local.project_name}-scc-notify"
  organization = local.org_id
  description  = "SCC Notification for all active findings"
  pubsub_topic = google_pubsub_topic.scc_notification_topic.id

  streaming_config {
    filter = var.scc_notification_filter
  }
}

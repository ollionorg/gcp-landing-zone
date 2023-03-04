resource "google_logging_folder_sink" "env-sink" {
  count            = var.enable_env_log_sink ? 1 : 0
  name             = "sink-${var.env}"
  description      = "Logging Sink for Environment logs"
  folder           = google_folder.env.id
  include_children = true

  # Can export to pubsub, cloud storage, or bigquery
  destination = "logging.googleapis.com/projects/${module.logging_project[0].project_id}/locations/global/buckets/_Default"

}

resource "google_project_iam_binding" "log-writer" {
  count   = var.enable_env_log_sink ? 1 : 0
  project = module.logging_project[0].project_id
  role    = "roles/logging.bucketWriter"

  members = [
    google_logging_folder_sink.env-sink[0].writer_identity
  ]
  condition {
    title       = google_logging_folder_sink.env-sink[0].writer_identity
    description = "Environment logging sink iam role attachment"
    expression  = "resource.name.endsWith('locations/global/buckets/_Default')"
  }

}
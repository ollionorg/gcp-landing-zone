terraform {
  backend "gcs" {
    bucket = "UPDATE_BACKEND_BUCKET"
    prefix = "3-networks/development/"
  }
}
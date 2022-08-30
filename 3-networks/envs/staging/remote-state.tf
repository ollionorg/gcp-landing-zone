data "terraform_remote_state" "bootstrap" {
  backend = "gcs"
  config = {
    bucket = "UPDATE_BACKEND_BUCKET"
    prefix = "0-bootstrap/"
  }
}
data "terraform_remote_state" "org" {
  backend = "gcs"
  config = {
    bucket = "UPDATE_BACKEND_BUCKET"
    prefix = "1-org/"
  }
}
data "terraform_remote_state" "env" {
  backend = "gcs"
  config = {
    bucket = "UPDATE_BACKEND_BUCKET"
    prefix = "2-env/staging/"
  }
}
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
    prefix = "2-env/development/"
  }
}

data "terraform_remote_state" "networks" {
  backend = "gcs"
  config = {
    bucket = "UPDATE_BACKEND_BUCKET"
    prefix = "3-networks/development/"
  }
}

data "terraform_remote_state" "BU_NAME_shared" {
  backend = "gcs"
  config = {
    bucket = "UPDATE_BACKEND_BUCKET"
    prefix = "4-projects/BU_NAME/shared/"
  }
}
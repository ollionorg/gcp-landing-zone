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

terraform {
  backend "gcs" {
    bucket = "UPDATE_BACKEND_BUCKET"
    prefix = "5-app-infra/BU_NAME/production"
  }
}

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
    prefix = "2-env/production/"
  }
}

data "terraform_remote_state" "networks" {
  backend = "gcs"
  config = {
    bucket = "UPDATE_BACKEND_BUCKET"
    prefix = "3-networks/production/"
  }
}

data "terraform_remote_state" "BU_NAME_shared" {
  backend = "gcs"
  config = {
    bucket = "UPDATE_BACKEND_BUCKET"
    prefix = "4-projects/BU_NAME/shared/"
  }
}

data "terraform_remote_state" "BU_NAME_production" {
  backend = "gcs"
  config = {
    bucket = "UPDATE_BACKEND_BUCKET"
    prefix = "4-projects/BU_NAME/production/"
  }
}

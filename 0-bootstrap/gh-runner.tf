/**
 * Copyright 2019 Google LLC
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

module "runner-mig" {
  source              = "../modules/terraform-google-github-actions-runners/modules/gh-runner-mig-vm"
  create_network      = true
  project_id          = module.cloudbuild_bootstrap.cloudbuild_project_id
  repo_name           = var.runner_repo_name
  repo_owner          = var.runner_repo_owner
  gh_token            = var.gh_token
  region              = var.default_region
  machine_type        = var.runner_machine_type
  min_replicas        = var.num_instances
  max_replicas        = sum([var.num_instances, 1])
  gh_runner_label     = "${var.project_name}-runner"
  service_account     = module.cloudbuild_bootstrap.project_service_account
  source_image        = var.source_image_family
  source_image_family = var.source_image_project
  subnet_ip           = var.runner_subnet_ip

  depends_on = [google_project_iam_member.rnr_sa_prj_perms]
}

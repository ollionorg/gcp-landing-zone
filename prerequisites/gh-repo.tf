resource "null_resource" "secret_key_null_resource" {
  triggers = {
    key_comment   = var.gh_key_comment
    key_file_name = var.gh_key_file_name
  }

  provisioner "local-exec" {
    command = <<EOT
     ssh-keygen -t rsa -N '' -C ${var.gh_key_comment} -f ${var.gh_key_file_name}
    EOT
  }
}

data "local_sensitive_file" "key_file" {

  filename = null_resource.secret_key_null_resource.triggers.key_file_name
}

data "local_file" "key_file_pub" {

  filename = "${null_resource.secret_key_null_resource.triggers.key_file_name}.pub"
}

resource "google_secret_manager_secret" "git_gcplz_ssh_pvt" {

  project   = var.project_id
  secret_id = var.git_pvt_key_scrt_name
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "git_gcplz_ssh_pvt_data" {

  secret = google_secret_manager_secret.git_gcplz_ssh_pvt.id

  secret_data = data.local_sensitive_file.key_file.content
}

resource "random_id" "gh_deploy_key" {
  byte_length = 2
}

resource "github_repository_deploy_key" "runner_deploy_key" {

  key        = data.local_file.key_file_pub.content
  repository = var.runner_repo_name
  title      = format("%s_%s", "GITHUB_RUNNER_DEPLOY_KEY", upper(random_id.gh_deploy_key.hex))
  read_only  = false
}

resource "github_branch_protection" "bu_name_main_branch_protection" {
  pattern                         = "${var.project_name}-main"
  repository_id                   = var.runner_repo_name
  require_conversation_resolution = true
  require_signed_commits          = true
  allows_deletions                = false
  allows_force_pushes             = false
  enforce_admins                  = true

  required_status_checks {
    strict = true
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 2
  }
}
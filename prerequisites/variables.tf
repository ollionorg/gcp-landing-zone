variable "gh_key_comment" {
  type        = string
  description = "comment for the created key to be added to the github."
  default     = "runner@key"
}

variable "gh_token" {
  type        = string
  description = "Github token that is used for generating Self Hosted Runner Token"
  default     = "default-runner-token"
}

variable "gh_key_file_name" {
  type        = string
  description = "file names for the created private and public keys."
  default     = "secretkey"
}

variable "runner_repo_name" {
  type        = string
  description = "Name of the repo for the Github Action"
}

variable "project_id" {
  description = "Custom project ID to use for project created. If not supplied, the default id is {project_prefix}-seed-{random suffix}."
  type        = string
  default     = ""
}

variable "git_pvt_key_scrt_name" {
  description = "The name / secret id which holds the private key for the deploy keys added to the Github repo."
  type        = string
  default     = "git-gcplz-ssh-pvt"
}

variable "project_name" {
  description = "The prefix for name of the main branch."
  type        = string
}
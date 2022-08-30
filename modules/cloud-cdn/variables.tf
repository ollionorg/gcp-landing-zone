variable "create_bucket" {
  description = "Boolean to create bucket or not"
  type        = bool
}

variable "project" {
  description = "Project to create resources."
  type = string
}

variable "bucket_location" {
  description = "Location of the Storage Bucket"
  type = string
}

variable "bucket_users" {
  description = "Users that can access the bucket"
  type = string
}

variable "log_bucket" {
  description = "Bucket to store logs of the main storage bucket."
  type = string
}
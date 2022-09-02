variable "cc_name" {
  description = "The name of the managed config controller instance."
  type        = string
  default     = "lz-config-controller"
}

variable "cc_location" {
  description = "The location of the config controller instance from the following locations: us-central1,us-east1,northamerica-northeast1,northamerica-northeast2,europe-north1,europe-west1,europe-west3,australia-southeast1,australia-southeast2,asia-northeast1,asia-northeast2"
  type        = string
  default     = "us-east1"
}

variable "scc_name" {
  description = "Name of SCC service account"
  type        = string
}

variable "source_name" {
  description = "Name of SCC Source"
  type        = string
}

variable "scc_email_role" {
  description = "Constains the roles for scc dashboard"
  type        = string
  default     = "roles/securitycenter.sourcesAdmin"
}

variable "findings_sa_name" {
  description = ""
  type        = string
}

variable "findings_sa_description" {
  description = "Security Command Center Gatekeeper findings editor"
  type        = string
  default     = "Security Command Center Gatekeeper findings editor"
}

variable "findings_sa_role" {
  description = "Contains the roles for finding in the SCC dashboard"
  type        = string
  default     = "roles/serviceusage.serviceUsageConsumer"
}

variable "scc_desciption" {
  description = "Description of SCC"
  type        = string
  default     = "Security Command Center sources admin"
}

variable "cc_subnet_name" {
  description = "Subnetwork in the cc_location under the gh-runner-network."
  type        = string
  default     = "gh-runner-subnet-2"
}

variable "cc_subnet_cidr" {
  description = "Subnetwork's CIDR for the config controller cluster."
  type        = string
  default     = "192.168.1.0/24"
}

variable "sa_email_role" {
  description = "Role for the Service Account for Config Controller to manage resources organization wide."
  type        = string
  default     = "roles/editor"
}

variable "sync_repo" {
  description = "The URL of the Git repository to use as the source of truth."
  type        = string
}

variable "sync_branch" {
  description = "The branch of the repository to sync from. Default: master."
  type        = string
  default     = "master"
}

variable "policy_dir" {
  description = "The path within the Git repository that represents the top level of the repo to sync. Default: the root directory of the repository."
  type        = string
  default     = ""
}


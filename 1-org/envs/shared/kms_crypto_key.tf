resource "google_kms_key_ring" "audit_logs_keyring" {
  name     = "${module.org_audit_logs.project_id}-keyring-${random_string.suffix.result}"
  project  = module.org_audit_logs.project_id
  location = "us"
}

resource "google_kms_crypto_key" "audit_logs_key" {
  name            = "${module.org_audit_logs.project_id}-key-${random_string.suffix.result}"
  key_ring        = google_kms_key_ring.audit_logs_keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_kms_key_ring" "org_operations_logs_keyring" {
  name     = "${module.org_operations_logs.project_id}-keyring-${random_string.suffix.result}"
  project  = module.org_operations_logs.project_id
  location = "us"
}

resource "google_kms_crypto_key" "org_operations_logs_key" {
  name            = "${module.org_operations_logs.project_id}-key-${random_string.suffix.result}"
  key_ring        = google_kms_key_ring.org_operations_logs_keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_kms_key_ring" "storage_destination_security_keyring" {
  name     = "${module.org_security_logs.project_id}-keyring-${random_string.suffix.result}"
  project  = module.org_security_logs.project_id
  location = "us"
}

resource "google_kms_crypto_key" "storage_destination_security_key" {
  name            = "${module.org_security_logs.project_id}-key-${random_string.suffix.result}"
  key_ring        = google_kms_key_ring.storage_destination_security_keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_project_iam_member" "grant-google-audit-encrypt-decrypt" {
  role    = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member  = "serviceAccount:service-${module.org_audit_logs.project_number}@gs-project-accounts.iam.gserviceaccount.com"
  project = module.org_audit_logs.project_id
}

resource "google_project_iam_member" "grant-google-ops-encrypt-decrypt" {
  role    = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member  = "serviceAccount:service-${module.org_operations_logs.project_number}@gs-project-accounts.iam.gserviceaccount.com"
  project = module.org_operations_logs.project_id
}

resource "google_project_iam_member" "grant-google-sec-encrypt-decrypt" {
  role    = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member  = "serviceAccount:service-${module.org_security_logs.project_number}@gs-project-accounts.iam.gserviceaccount.com"
  project = module.org_security_logs.project_id
}
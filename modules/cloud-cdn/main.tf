resource "random_id" "random" {
  byte_length = 4
}

resource "google_storage_bucket" "cdn_storage_bucket" {
  count = var.create_bucket ? 1 : 0
  location = var.bucket_location
  name     = "cdn-bucket-pub-${random_id.random.hex}"
  storage_class = "MULTI_REGIONAL"
  project = var.project
  versioning {
    enabled = "true"
  }
  logging {
    log_bucket = var.log_bucket
  }
}

resource "google_compute_backend_bucket" "cdn_backend_bucket" {
  count = var.create_bucket ? 1 : 0
  bucket_name = google_storage_bucket.cdn_storage_bucket[0].name
  name        = "cdn-backend-bucket-${random_id.random.hex}"
  enable_cdn = true
  project = var.project
}

resource "google_compute_url_map" "cdn_bucket_url_map" {
  name = "cdn-bucket-url-map-${random_id.random.hex}"
  default_service = google_compute_backend_bucket.cdn_backend_bucket[0].self_link
  project = var.project

}

resource "google_compute_target_http_proxy" "cdn_target_http_proxy" {
  name    = "cdn-bucket-http-proxy-${random_id.random.hex}" #TODO add an option for https proxy with ssl cert
  url_map = google_compute_url_map.cdn_bucket_url_map.self_link
  project = var.project
}

resource "google_compute_global_address" "cdn_public_address" {
  name         = "cdn-public-address-${random_id.random.hex}"
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
  project      = var.project
}

resource "google_compute_global_forwarding_rule" "cdn_global_forwarding_rule" {
  count = var.create_bucket ? 1 : 0
  name       = "cdn-global-forwarding-https-rule-${random_id.random.hex}"
  target     = google_compute_target_http_proxy.cdn_target_http_proxy.self_link
  ip_address = google_compute_global_address.cdn_public_address.address
  port_range = "80" #TODO accept as variable
  project    = var.project
}

resource "google_storage_bucket_iam_member" "all_users_viewers" {
  count = var.create_bucket ? 1 : 0
  bucket = google_storage_bucket.cdn_storage_bucket[0].name
  role   = "roles/storage.legacyObjectReader"
  member = var.bucket_users
}

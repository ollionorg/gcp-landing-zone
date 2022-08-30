output "ip_address" {
  value = google_compute_global_address.cdn_public_address.address
}

output "bucket_name" {
  value = google_storage_bucket.cdn_storage_bucket[0].name
}

output "compute_url_default_redirect" {
  value = google_compute_url_map.cdn_bucket_url_map.default_url_redirect
}
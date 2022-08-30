module "cdn" {
  source = "../."
  create_bucket = true
  bucket_location = "ASIA"
  project       = "devops-sandbox-20200519"
}
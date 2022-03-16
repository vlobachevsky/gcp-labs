resource "google_storage_bucket" "code_bucket" {
  name     = "${var.project}-code"
  location = "US"
}

resource "google_storage_bucket_object" "code_archive" {
  name   = "index.zip"
  bucket = google_storage_bucket.code_bucket.name
  source = "./index.zip"
}

resource "google_cloudfunctions_function" "http_cloud_function" {
  name        = "hello_http_2"
  description = "My HTTP function for testing"
  runtime     = "python39"

  available_memory_mb   = 256
  source_archive_bucket = google_storage_bucket.code_bucket.name
  source_archive_object = google_storage_bucket_object.code_archive.name
  trigger_http          = true
  entry_point           = "hello_http"
}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.http_cloud_function.project
  region         = google_cloudfunctions_function.http_cloud_function.region
  cloud_function = google_cloudfunctions_function.http_cloud_function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
# # Grand Terraform SA access to code bucket
# resource "google_storage_bucket_iam_member" "terraform_sa_code_bucket_list" {
#   bucket = google_storage_bucket.code-bucket.name
#   role = "roles/storage.admin"
#   member = "terraform@${var.project}.iam.gserviceaccount.com"
# }

resource "google_storage_bucket" "code-bucket" {
  name     = "${var.project}-code"
  location = "US"
}

resource "google_storage_bucket_object" "code-archive" {
  name   = "index.zip"
  bucket = google_storage_bucket.code-bucket.name
  source = "."
}

resource "google_cloudfunctions_function" "http-cloud-function" {
  name = "hello_http_2"
  description = "My HTTP function for testing"
  runtime = "python39"

  available_memory_mb = 256
  source_archive_bucket = google_storage_bucket.code-bucket.name
  source_archive_object = google_storage_bucket_object.code-archive.name
  trigger_http = true
	entry_point = "hello_http"		
}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.http-cloud-function.project
  region         = google_cloudfunctions_function.http-cloud-function.region
  cloud_function = google_cloudfunctions_function.http-cloud-function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
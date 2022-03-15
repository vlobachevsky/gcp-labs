package main

deny[msg] {
  not input.resource.google_cloudfunctions_function.http_cloud_function
  msg = "Define Cloud Function resource"
}

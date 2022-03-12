terraform {
  backend "gcs" {
    bucket      = "playground-s-11-3c127cb4-tfstate"
    credentials = "/home/cloud_user/terraform-key.json"
  }
}

locals {
  project = "playground-s-11-3c127cb4"
}

provider "google" {
  version     = "3.5.0"
  credentials = file("/home/cloud_user/terraform-key.json")
  project     = locals.project
  region      = "us-central1"
  zone        = "us-central1-c"
}

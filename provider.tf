terraform {
  backend "gcs" {
    bucket = "maniac"
    prefix = "terraformstate"
    credentials = "${file("terraform.json")}"
  }
}


provider "google-beta" {
  credentials = "${file("terraform.json")}"
  project = var.project_id
  version = "~> 3.0.0-beta.1"
}
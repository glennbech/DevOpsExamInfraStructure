provider "google" {
  credentials = "${file("service-account.json")}"
  project     = "devopsexam-295512"
  region      = "us-central1"
  zone        = "us-central1-c"
}
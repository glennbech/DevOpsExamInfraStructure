provider "google" {
  credentials = "${file("terraform.json")}"
  project     = "devopsexam-295512"
  region      = "us-central1"
  zone        = "us-central1-c"
}
resource "google_storage_bucket" "static-site" {
  project = var.project_id
  name = "devops-exam-code"
  location = "EU"
}
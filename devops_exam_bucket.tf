resource "google_storage_bucket" "static-site-mania" {
  project = var.project_id
  name = "devops-exam-code-mania-v1"
  location = "EU"
}
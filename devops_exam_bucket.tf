resource "google_storage_bucket" "static-site-mania" {
  project = var.project_id
  name = "devops-exam-code-mania-v2"
  location = "EU"
}
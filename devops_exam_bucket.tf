resource "google_storage_bucket" "static-site-maniac123" {
  project = var.project_id
  name = "devops-exam-code-new"
  location = "EU"
}
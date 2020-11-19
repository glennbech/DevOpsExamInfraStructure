resource "google_cloud_run_service" "default" {
  name     = "cloudrun-srv-v3"
  location = "us-central1"
  project  = "devopsexam-295512"

  template {
    spec {
      containers {
        image = "gcr.io/devopsexam-295512/devops-exam-code-new:0ae22e6780a125511abb5fd4f83bd8468bc30868"
        env {
          name = "LOGZ_TOKEN"
          value = var.LOGZ_TOKEN
        }
        env {
          name = "LOGZ_URL"
          value = var.LOGZ_URL
        }
      }
    }
  }
  traffic {
    percent = 100
    latest_revision = true
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.default.location
  project     = google_cloud_run_service.default.project
  service     = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}
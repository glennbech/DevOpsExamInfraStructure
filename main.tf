resource "google_cloud_run_service" "default" {
  name     = "cloudrun-srv-v4"
  location = "us-central1"
  project  = "devopsexam-295512"

  template {
    spec {
      containers {
        image = "gcr.io/devopsexam-295512/devops-exam-code-new@sha256:2b9ffa655ebe78cf12003b7c6b8402d43e20c738f5ac64ebf11dd248fee80622"
        resources {
          limits = {
            memory: 512
          }
        }
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
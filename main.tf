resource "google_cloud_run_service" "default" {
  name     = "cloudrun-srv-v1"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/devopsexam-295512/devops-exam-code-new:6fd31c681843e88fbd997c26f48974312b15a7fa"
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
resource "google_cloud_run_service" "default" {
  name     = "cloudrun-srvv2"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/devopsexam-295512/devops-exam-code-new:2f9a6da179674ae1d3d9da39aff61d4967bf63e3"
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
provider "statuscake" {
  username = "jonrotnebo"
}

resource "statuscake_test" "googlecloudruntest" {
  website_name = "My Rest API"
  website_url  = google_cloud_run_service.default.status[0].url
  test_type    = "HTTP"
  check_rate   = 100
  contact_group= ["svr-exam-notification"]
}
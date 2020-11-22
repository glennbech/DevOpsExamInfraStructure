# Configure the Opsgenie Provider
provider "opsgenie" {
  api_url = "api.eu.opsgenie.com" #default is api.opsgenie.com
  version = "0.5.2"
}

resource "opsgenie_user" "first" {
  username  = "user@domain.com"
  full_name = "Alice "
  role      = "User"
}

resource "opsgenie_user" "second" {
  username  = "test@domain.com"
  full_name = "Johan"
  role      = "User"
}

resource "opsgenie_team" "team1" {
  name        = "self-service"
  description = "This team deals with all aspects of this project"

  member {
    id   = opsgenie_user.first.id
    role = "admin"
  }

  member {
    id   = opsgenie_user.second.id
    role = "user"
  }
}

resource "opsgenie_team" "self-service" {
  name           = "Self service team"
  description    = "Membership in this team is managed by OpsGenie web view only"
  ignore_members = true
  delete_default_resources = true
}
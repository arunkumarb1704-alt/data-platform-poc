# terraform { 
#   required_providers { 
#     postgresql = { source = "cyrilgdn/postgresql" } 
#   }
# }
# provider "postgresql" {
#   host = "localhost"
#   username = "postgres" 
#   password = "localdev" 
#   sslmode = "disable" 
# } 
# resource "postgresql_role" "data_readers" { 
#   name = "data_readers"
#    login = false 
# } 
# resource "postgresql_role" "data_engineers" {
#    name = "data_engineers" 
#    login = false 
# }

terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "~> 1.25"
    }
  }
}

provider "postgresql" {
  host     = "localhost"
  port     = 5432
  database = "postgres"
  username = "postgres"
  password = "localdev"
  sslmode  = "disable"
}

resource "postgresql_role" "data_readers" {
  name     = "data_readers"
  login    = false
  password = null
}

resource "postgresql_role" "data_engineers" {
  name     = "data_engineers"
  login    = false
  password = null
}

resource "postgresql_database" "analytics" {
  name  = "analytics"
  owner = "postgres"
}
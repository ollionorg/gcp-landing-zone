resource "random_id" "db_name" {
  byte_length = 2
}

resource "google_sql_database_instance" "boa_sql" {
  name             = "boa-sql-instance-1-${random_id.db_name.hex}"
  deletion_protection = false
  database_version = "POSTGRES_12"
  region           = local.gcp_region
  project = local.base_shared_vpc_project

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-custom-1-3840"
    ip_configuration {
      ipv4_enabled    = false
      private_network = local.base_shared_network_self_link
    }
  }
}

resource "google_sql_database" "boa_database_1" {
  name = local.boa_databases[0]
  instance = google_sql_database_instance.boa_sql.name
  project = local.base_shared_vpc_project
}

resource "google_sql_database" "boa_database_2" {
  name = local.boa_databases[1]
  instance = google_sql_database_instance.boa_sql.name
  project = local.base_shared_vpc_project
}

resource "google_sql_user" "boa_db_admin_user" {
  name     = "admin"
  instance = google_sql_database_instance.boa_sql.name
  project = local.base_shared_vpc_project
  password = var.dbps
}

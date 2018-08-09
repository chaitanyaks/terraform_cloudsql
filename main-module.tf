
terraform {
  backend "consul" {
    address = "35.231.85.164"
    path    = "remote-state-file/psql"
  }
}

// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("../../account.json")}"
  project     = "generated-wharf-205016"
  region      = "us-east1-b"
}


resource "google_sql_database_instance" "master" {
  name = "postgres-instance-4"
  database_version = "${var.database_version}"
  region = "${var.region}"
  settings {
    tier = "${var.tier}"
#    ip_configuration {
#       authorized_networks = {
#                name = "tf-node-1"
#                value = "35.227.23.136/32"
#	    }
#     }
  }
}

resource "google_sql_database" "default" {
	name = "${var.db_name}"
	instance  = "${google_sql_database_instance.master.name}"
}


resource "google_sql_user" "default" {
  name     = "${var.db_user}"
  instance = "${google_sql_database_instance.master.name}"
  password = "${var.db_password}"
  provisioner "local-exec" {
#        command = "PGPASSWORD=${var.db_password} psql -U ${var.db_user}  -h ${google_sql_database_instance.master1.ip_address.0.ip_address}  ${var.db_name} < test_backup.sql
         command = "PGPASSWORD=${var.db_password} gcloud sql import sql ${google_sql_database_instance.master.name} gs://sample_bucket_chaitanya/postgres/test_backup.sql --database=${var.db_name}"
  }

}

#resource "null_resource" "pg_dump" {
#	provisioner "local-exec" {
#        command = "psql -U ${var.db_user}  -h ${google_sql_database_instance.master1.ip_address.0.ip_address}  ${var.db_name} < test_backup.sql"
#  }
#}

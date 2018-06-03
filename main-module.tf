terraform {
  backend "consul" {
    address = "35.231.79.251"
    path    = "remote-state-file/psql"
  }
}

// Configure the Google Cloud provider
provider "google" {
<<<<<<< HEAD
  credentials = "${file("../../account.json")}"
=======
  credentials = "${file("/home/jenkins/account.json")}"
>>>>>>> d0dd8e9457779472652f0e102771d5763162194b
  project     = "generated-wharf-205016"
  region      = "us-east1-b"
}


resource "google_sql_database_instance" "master1" {
  name = "postgres-instance-1"
  database_version = "POSTGRES_9_6"
  region = "us-central1"

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"
	ip_configuration {
	authorized_networks = {
                name = "tf-node"
                value = "35.237.122.239/32"
		expiration_time = "2018-06-15T16:19:00.094Z"        
    }
	}
  }
}

resource "google_sql_database" "default" {
	name = "testdb"
	instance  = "${google_sql_database_instance.master1.name}"
}

resource "random_id" "user-password" {
  byte_length = 8
}

resource "google_sql_user" "default" {
  name     = "postgres"
  instance = "${google_sql_database_instance.master1.name}"
  host     = "%"
  password = "${random_id.user-password.hex}"

provisioner "local-exec" {
	command = "pwd && hostname"
}

}

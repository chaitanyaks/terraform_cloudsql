variable region {
  description = "Region for cloudsql postgresql instance"
  default     = "us-central1"
}

variable database_version {
  description = "The version of of the database"
  default     = "POSTGRES_9_6"
}

variable tier {
  description = "The machine tier type"
  default     = "db-f1-micro"
}

variable db_name {
  description = "Name of the database to create"
  default     = "testdb-1"
}

variable db_user {
	description = "name of the postgres user"
	default = "postgres"
}
variable db_password {
	description = "values of the postgres user password"
	default = "dbpassword"
}

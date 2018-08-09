output instance_name {
  description = "The name of the database instance"
  value       = "${google_sql_database_instance.master.name}"
}

output instance_address {
  description = "The IPv4 address of the master database instnace"
  value       = "${google_sql_database_instance.master.ip_address.0.ip_address}"
}


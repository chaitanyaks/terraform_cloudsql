output instance_name {
  description = "The name of the database instance"
  value       = "${google_sql_database_instance.master1.name}"
}

output instance_address {
  description = "The IPv4 address of the master database instnace"
  value       = "${google_sql_database_instance.master1.ip_address.0.ip_address}"
}

output generated_user_password {
  description = "The auto generated default user password if no input password was provided"
  value       = "${random_id.user-password.hex}"
  sensitive   = true
}
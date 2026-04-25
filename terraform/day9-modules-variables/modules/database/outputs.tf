output "db_endpoint" {
  description = "Database endpoint"
  value       = "db-endpoint-${var.db_engine}.example.com"
}

output "db_port" {
  description = "Database port"
  value       = var.db_engine == "postgres" ? 5432 : 3306
}

output "db_engine" {
  description = "Database engine"
  value       = var.db_engine
}

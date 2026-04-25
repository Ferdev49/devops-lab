output "network_id" {
  description = "Network identifier"
  value       = "network-${var.environment}-${var.region}"
}

output "vpc_cidr" {
  description = "VPC CIDR block"
  value       = var.vpc_cidr
}

output "environment" {
  description = "Network environment"
  value       = var.environment
}

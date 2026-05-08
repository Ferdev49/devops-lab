output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "vpc_cidr" {
  description = "VPC CIDR block"
  value       = module.networking.vpc_cidr
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.networking.private_subnet_ids
}

output "db_subnet_ids" {
  description = "Database subnet IDs"
  value       = module.networking.db_subnet_ids
}

output "alb_dns_name" {
  description = "Load balancer DNS name"
  value       = module.load_balancer.alb_dns_name
}

output "alb_arn" {
  description = "Load balancer ARN"
  value       = module.load_balancer.alb_arn
}

output "target_group_arn" {
  description = "Target group ARN"
  value       = module.load_balancer.target_group_arn
}

output "asg_name" {
  description = "Auto Scaling Group name"
  value       = module.app_tier.asg_name
}

output "asg_desired_capacity" {
  description = "ASG desired capacity"
  value       = module.app_tier.desired_capacity
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = module.database.db_endpoint
  sensitive   = true
}

output "rds_port" {
  description = "RDS port"
  value       = module.database.db_port
}

output "rds_database_name" {
  description = "RDS database name"
  value       = module.database.db_name
}

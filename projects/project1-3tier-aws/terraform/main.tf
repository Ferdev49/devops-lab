# Terraform Configuration - 3-Tier AWS Application
# Day 23: Load Balancer Module

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.tags
  }
}

# ============================================
# NETWORKING MODULE
# ============================================
module "networking" {
  source = "./modules/networking"

  app_name           = var.app_name
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  environment        = var.environment
}

# ============================================
# LOAD BALANCER MODULE (NEW - Day 23)
# ============================================
module "load_balancer" {
  source = "./modules/load_balancer"

  app_name              = var.app_name
  environment           = var.environment
  vpc_id                = module.networking.vpc_id
  public_subnets        = module.networking.public_subnet_ids
  alb_security_group_id = module.networking.alb_security_group_id

  target_port                      = 80
  health_check_path                = "/"
  health_check_interval            = 30
  health_check_timeout             = 5
  health_check_healthy_threshold   = 2
  health_check_unhealthy_threshold = 2
  health_check_matcher             = "200"
}

# Application Tier Module (TBD - Day 24)
# module "app_tier" {
#   source = "./modules/app_tier"
#   ...
# }

# Database Module (TBD - Day 25)
# module "database" {
#   source = "./modules/database"
#   ...
# }

# ============================================
# ROOT OUTPUTS
# ============================================

output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "vpc_cidr" {
  description = "VPC CIDR block"
  value       = module.networking.vpc_cidr
}

output "public_subnet_ids" {
  description = "Public subnet IDs (for ALB)"
  value       = module.networking.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs (for App Tier)"
  value       = module.networking.private_subnet_ids
}

output "db_subnet_ids" {
  description = "Database subnet IDs (for RDS)"
  value       = module.networking.db_subnet_ids
}

output "alb_dns_name" {
  description = "Load balancer DNS name"
  value       = module.load_balancer.alb_dns_name
}

output "alb_url" {
  description = "Load balancer URL"
  value       = module.load_balancer.alb_url
}

output "target_group_arn" {
  description = "Target group ARN (for ASG)"
  value       = module.load_balancer.target_group_arn
}

output "alb_security_group_id" {
  description = "ALB Security Group ID"
  value       = module.networking.alb_security_group_id
}

output "app_security_group_id" {
  description = "Application Security Group ID"
  value       = module.networking.app_security_group_id
}

output "db_security_group_id" {
  description = "Database Security Group ID"
  value       = module.networking.db_security_group_id
}
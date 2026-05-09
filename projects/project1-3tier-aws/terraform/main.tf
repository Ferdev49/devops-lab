# Terraform Configuration - 3-Tier AWS Application
# Day 24: Application Tier Module

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
# LOAD BALANCER MODULE
# ============================================

module "load_balancer" {
  source = "./modules/load_balancer"

  app_name                = var.app_name
  environment             = var.environment
  vpc_id                  = module.networking.vpc_id
  public_subnets          = module.networking.public_subnet_ids
  alb_security_group_id   = module.networking.alb_security_group_id
  
  target_port            = 80
  health_check_path      = "/"
  health_check_interval  = 30
  health_check_timeout   = 5
  health_check_healthy_threshold   = 2
  health_check_unhealthy_threshold = 2
  health_check_matcher   = "200"
}

# ============================================
# APPLICATION TIER MODULE
# ============================================

module "app_tier" {
  source = "./modules/app_tier"

  app_name                = var.app_name
  environment             = var.environment
  vpc_id                  = module.networking.vpc_id
  private_subnets        = module.networking.private_subnet_ids
  alb_security_group_id   = module.networking.alb_security_group_id
  target_group_arn        = module.load_balancer.target_group_arn
  
  instance_type      = var.instance_type
  min_size           = var.min_size
  max_size           = var.max_size
  desired_capacity   = var.desired_capacity
}

# ============================================
# ROOT OUTPUTS
# ============================================

output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "alb_url" {
  description = "Load balancer URL"
  value       = module.load_balancer.alb_url
}

output "asg_name" {
  description = "Auto Scaling Group name"
  value       = module.app_tier.asg_name
}

output "target_group_arn" {
  description = "Target group ARN"
  value       = module.load_balancer.target_group_arn
}

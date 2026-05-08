terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Uncomment for remote backend (after initial setup)
  # backend "s3" {
  #   bucket         = "your-terraform-state-bucket"
  #   key            = "3-tier-app/terraform.tfstate"
  #   region         = "us-east-1"
  #   encrypt        = true
  #   dynamodb_table = "terraform-locks"
  # }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = var.tags
  }
}

# Networking Module
module "networking" {
  source = "./modules/networking"

  app_name           = var.app_name
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  environment        = var.environment
}

# Load Balancer Module
module "load_balancer" {
  source = "./modules/load_balancer"

  app_name    = var.app_name
  environment = var.environment
  vpc_id      = module.networking.vpc_id
  
  public_subnets = module.networking.public_subnet_ids
  
  # Will be connected to ASG in app_tier module
}

# Application Tier Module
module "app_tier" {
  source = "./modules/app_tier"

  app_name           = var.app_name
  environment        = var.environment
  vpc_id             = module.networking.vpc_id
  private_subnets   = module.networking.private_subnet_ids
  
  instance_type      = var.instance_type
  min_size           = var.min_size
  max_size           = var.max_size
  desired_capacity   = var.desired_capacity
  
  # ALB target group
  target_group_arn = module.load_balancer.target_group_arn
  
  # Database connection (from database module)
  db_endpoint = module.database.db_endpoint
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}

# Database Module
module "database" {
  source = "./modules/database"

  app_name              = var.app_name
  environment           = var.environment
  vpc_id                = module.networking.vpc_id
  db_subnets            = module.networking.db_subnet_ids
  app_tier_sg_id        = module.app_tier.security_group_id
  
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  instance_type         = var.db_instance_type
  allocated_storage     = 20
  max_allocated_storage = 100
  
  multi_az = var.environment == "prod" ? true : false
}

# Outputs
output "load_balancer_dns" {
  description = "Load balancer DNS name"
  value       = module.load_balancer.alb_dns_name
}

output "load_balancer_url" {
  description = "Load balancer URL"
  value       = "http://${module.load_balancer.alb_dns_name}"
}

output "database_endpoint" {
  description = "RDS database endpoint"
  value       = module.database.db_endpoint
  sensitive   = true
}

output "rds_port" {
  description = "RDS port"
  value       = module.database.db_port
}
terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Configuración de Backend (Opcional - Descomentar tras crear el bucket S3)
  # backend "s3" {
  #   bucket         = "tu-terraform-state-bucket"
  #   key            = "3-tier-app/terraform.tfstate"
  #   region         = "us-east-1"
  #   encrypt        = true
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
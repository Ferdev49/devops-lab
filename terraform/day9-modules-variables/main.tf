# Day 9: Terraform Modules & Variables
# Root module that uses networking, app, and database modules

terraform {
  required_version = ">= 1.0"
}

# Call networking module
module "networking" {
  source = "./modules/networking"
  
  environment = var.environment
  region      = var.region
  vpc_cidr    = var.vpc_cidr
}

# Call app module
module "app" {
  source = "./modules/app"
  
  app_name      = var.app_name
  app_version   = var.app_version
  environment   = var.environment
  instance_count = var.app_instance_count
}

# Call database module
module "database" {
  source = "./modules/database"
  
  db_engine        = var.db_engine
  db_size          = var.db_size
  backup_retention = var.backup_retention
}

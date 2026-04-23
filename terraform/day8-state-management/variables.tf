# Variable Definitions

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "DevOps Project"
}

variable "environment" {
  description = "Environment name (learning, dev, staging, prod)"
  type        = string
  default     = "learning"
  
  validation {
    condition     = contains(["learning", "dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: learning, dev, staging, prod"
  }
}

variable "day" {
  description = "Learning day number"
  type        = number
  default     = 8
}

variable "tech_stack" {
  description = "Technology being learned"
  type        = string
  default     = "Terraform"
}

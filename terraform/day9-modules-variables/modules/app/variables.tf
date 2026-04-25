variable "app_name" {
  description = "Name of the application"
  type        = string
  validation {
    condition     = length(var.app_name) > 0 && length(var.app_name) <= 50
    error_message = "App name must be between 1 and 50 characters"
  }
}

variable "app_version" {
  description = "Version of the application"
  type        = string
  default     = "1.0.0"
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "instance_count" {
  description = "Number of instances"
  type        = number
  default     = 1
  
  validation {
    condition     = var.instance_count >= 1 && var.instance_count <= 10
    error_message = "Instance count must be between 1 and 10"
  }
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    "Managed-By" = "Terraform"
    "Day"        = "9"
  }
}

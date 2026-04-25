# Day 10 Variables

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "learning"
}

variable "backend_type" {
  description = "Type of backend (local, s3, terraform-cloud)"
  type        = string
  default     = "local"
}

variable "state_locking_enabled" {
  description = "Enable state locking"
  type        = bool
  default     = false  # local backend doesn't support locking
}

variable "team_collaboration_enabled" {
  description = "Enable team collaboration features"
  type        = bool
  default     = false  # requires remote backend
}

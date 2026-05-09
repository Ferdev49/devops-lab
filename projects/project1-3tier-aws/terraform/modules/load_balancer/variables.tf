# ============================================
# CONFIGURACIÓN BÁSICA
# ============================================

variable "app_name" {
  description = "Nombre de la aplicación para el etiquetado"
  type        = string
}

variable "environment" {
  description = "Entorno (dev, staging, prod)"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se desplegará el ALB"
  type        = string
}

variable "public_subnets" {
  description = "Lista de IDs de subredes públicas para el ALB"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "ID del Security Group asignado al ALB"
  type        = string
}

variable "target_port" {
  description = "Puerto al que el ALB enviará el tráfico (destino)"
  type        = number
  default     = 80
}

# ============================================
# HEALTH CHECK CONFIGURATION
# ============================================

variable "health_check_path" {
  description = "Ruta para el chequeo de salud"
  type        = string
  default     = "/"
}

variable "health_check_interval" {
  description = "Intervalo entre chequeos de salud (segundos)"
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "Tiempo de espera para la respuesta del chequeo (segundos)"
  type        = number
  default     = 5
}

variable "health_check_healthy_threshold" {
  description = "Chequeos exitosos consecutivos para considerar la instancia sana"
  type        = number
  default     = 2
}

variable "health_check_unhealthy_threshold" {
  description = "Chequeos fallidos consecutivos para considerar la instancia insana"
  type        = number
  default     = 2
}

variable "health_check_matcher" {
  description = "Códigos de estado HTTP que indican éxito (ej: 200, 200-299)"
  type        = string
  default     = "200"
}

# ============================================
# OPTIONAL: SSL/TLS
# ============================================

variable "ssl_certificate_arn" {
  description = "ARN del certificado SSL en AWS Certificate Manager (ACM)"
  type        = string
  default     = null
}

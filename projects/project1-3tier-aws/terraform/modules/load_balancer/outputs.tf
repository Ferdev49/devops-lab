output "alb_id" {
  description = "ID del Load Balancer"
  value       = aws_lb.main.id
}

output "alb_arn" {
  description = "ARN del Load Balancer"
  value       = aws_lb.main.arn
}

output "alb_dns_name" {
  description = "Nombre DNS del Load Balancer"
  value       = aws_lb.main.dns_name
}

output "alb_zone_id" {
  description = "ID de la zona del Load Balancer (útil para registros de Route 53)"
  value       = aws_lb.main.zone_id
}

output "target_group_arn" {
  description = "ARN del Target Group"
  value       = aws_lb_target_group.main.arn
}

output "target_group_name" {
  description = "Nombre del Target Group"
  value       = aws_lb_target_group.main.name
}

output "alb_url" {
  description = "URL completa del ALB"
  value       = "http://${aws_lb.main.dns_name}"
}

output "listener_arn" {
  description = "ARN del Listener"
  value       = aws_lb_listener.main.arn
}
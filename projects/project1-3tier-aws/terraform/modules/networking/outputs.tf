output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "Bloque CIDR de la VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas (Capa Web/ALB)"
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas (Capa de Aplicación)"
  value       = [for subnet in aws_subnet.private : subnet.id]
}

output "db_subnet_ids" {
  description = "IDs de las subredes de base de datos"
  value       = [for subnet in aws_subnet.db : subnet.id]
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "nat_gateway_ids" {
  description = "IDs de los NAT Gateways"
  value       = [for nat in aws_nat_gateway.main : nat.id]
}

output "nat_gateway_ips" {
  description = "IPs elásticas públicas asignadas a los NAT Gateways"
  value       = [for eip in aws_eip.nat : eip.public_ip]
}

output "alb_security_group_id" {
  description = "ID del Security Group para el Application Load Balancer"
  value       = aws_security_group.alb.id
}

output "app_security_group_id" {
  description = "ID del Security Group para las instancias de aplicación"
  value       = aws_security_group.app.id
}

output "db_security_group_id" {
  description = "ID del Security Group para la base de datos RDS"
  value       = aws_security_group.db.id
}
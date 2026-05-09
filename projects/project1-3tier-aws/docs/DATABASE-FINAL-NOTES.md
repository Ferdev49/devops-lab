# RDS Database Module & Project 1 Complete - Day 25

## Architecture Complete!
INTERNET
|
Route 53 (optional DNS)
|
PUBLIC SUBNETS (ALB)
|
Application Load Balancer
|
PRIVATE SUBNETS (EC2 ASG)
|
EC2 Instances (2-6)
|
DATABASE SUBNETS (RDS)
|
PostgreSQL Multi-AZ

## What We Built - Day 25

### RDS Database
- Engine: PostgreSQL 15.3
- Instance Type: db.t3.micro (dev), db.t3.small (prod)
- Storage: 20GB allocated, up to 100GB max
- Multi-AZ: Yes for production, No for development
- Backup: 7-day retention
- Encryption: At rest with AWS managed keys

### Security
- Database subnet group (private subnets only)
- Security group allows port 5432 from app tier only
- No public access
- CloudWatch logs enabled
- Parameter group with logging

### High Availability
- Multi-AZ deployment (for production)
- Automatic failover
- Synchronous replication
- Read replicas ready (can be added)

### Backup & Recovery
- Automated daily backups (retention: 7 days)
- Backup window: 03:00-04:00 UTC
- Maintenance window: Sunday 04:00-05:00 UTC
- Final snapshot on deletion

## 3-Tier Complete!

### Tier 1: Presentation (Load Balancer)
✅ Application Load Balancer
✅ Health checks (HTTP /)
✅ Sticky sessions
✅ Public subnets

### Tier 2: Application (Compute)
✅ Auto Scaling Group (2-6 instances)
✅ Launch Template with Apache
✅ Private subnets
✅ ALB target group integration

### Tier 3: Data (Database)
✅ PostgreSQL RDS
✅ Multi-AZ for HA
✅ Private database subnets
✅ Automated backups

## Outputs - How to Access
ALB URL: http://alb-xxxxx.amazonaws.com
Database: myapp-db.xxxxx.us-east-1.rds.amazonaws.com:5432
Database: appdb
Username: admin
Password: ChangeMe123! (from terraform.tfvars)

## Cost Summary

### Daily Development Environment
- ALB: ~$0.83/day
- 2 EC2 t3.medium: ~$2.08/day
- RDS db.t3.micro: ~$1.33/day
- Data transfer: ~$0.50/day
**Total: ~$4.74/day (~$142/month)**

### Production (if deployed)
- ALB: ~$0.83/day
- 4 EC2 t3.large (avg): ~$4.16/day
- RDS Multi-AZ db.t3.small: ~$2.66/day
- Data transfer: ~$1.50/day
**Total: ~$9.15/day (~$275/month)**

## Next Steps (Week 6)

1. Add CloudWatch alarms
2. Setup RDS read replicas
3. Add application code to EC2
4. Load testing (ApacheBench, JMeter)
5. Fine-tune Auto Scaling policies

## Testing the Architecture

```bash
# 1. Get ALB URL
terraform output alb_url

# 2. Test ALB (should work immediately)
curl http://alb-xxxxx.amazonaws.com

# 3. Get DB endpoint
terraform output database_endpoint

# 4. Connect to DB from EC2 instance
psql -h myapp-db.xxxxx.rds.amazonaws.com -U admin -d appdb
```

## Complete Architecture IaC

All 3 tiers defined in Terraform:
- networking module (VPC, subnets, security groups)
- load_balancer module (ALB, target groups, listeners)
- app_tier module (ASG, launch template, IAM)
- database module (RDS, parameter groups, backups)

Everything reproducible. Everything version controlled.
Everything automated.

This is production-grade Infrastructure as Code! 🚀

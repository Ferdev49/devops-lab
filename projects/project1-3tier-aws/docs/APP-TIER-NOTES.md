# Application Tier Module Implementation - Day 24

## What We Built

### Launch Template
- Name: ${app_name}-lt
- AMI: Amazon Linux 2 (ami-0c55b159cbfafe1f0)
- Instance Type: t3.medium (dev), t3.large (prod)
- User Data: Install Apache httpd, start service
- IAM Instance Profile: Attached for AWS API access
- Monitoring: CloudWatch enabled
- Network: No public IP (private subnets only)

### Auto Scaling Group (ASG)
- Name: ${app_name}-asg
- Availability Zones: 3 (us-east-1a, us-east-1b, us-east-1c)
- Min Size: 2 instances (always running)
- Max Size: 6 instances (scale up to 6 when needed)
- Desired Capacity: 2 instances (target state)
- Health Check: ELB (from ALB)
- Grace Period: 300 seconds (5 minutes)

### Auto Scaling Policies
- Scale Up: +1 instance
- Scale Down: -1 instance
- Cooldown: 300 seconds between actions

### IAM Role
- Allows EC2 instances to call AWS APIs
- Ready for future permissions (S3, RDS, etc)

## How It Works

1. ASG launches 2 t3.medium instances in private subnets
2. User data script installs Apache httpd
3. Instances report to ALB target group
4. ALB health checks verify instances are healthy
5. Traffic flows: Internet -> ALB -> Instances

## Instance Registration Flow

1. ASG launches instance
2. User data script runs (install httpd)
3. Instance contacts target group
4. ALB sends health check (GET /)
5. Instance responds HTTP 200
6. ALB marks instance healthy
7. Traffic sent to instance

## Scaling Behavior

Auto Scaling triggers:
- Scale Up: CPU > 70% or custom metric
- Scale Down: CPU < 30% or custom metric
- Cooldown: Wait 300s before next action

Example:
- Morning: 2 instances
- Traffic spike -> CPU 80% -> Scale to 3
- Traffic reduces -> CPU 20% -> Scale to 2

## Security

- Instances in private subnets
- No direct internet access
- Security group allows ALB traffic only
- IAM role for AWS API calls
- No SSH keys needed (use Systems Manager Session Manager)

## Cost Implications

Per instance (t3.medium):
- Compute: ~$30/month
- Storage (8GB): ~$1/month
- Total per instance: ~$31/month

For 2 instances: ~$62/month
For 6 instances (max): ~$186/month

## Monitoring

CloudWatch metrics available:
- CPU utilization
- Network in/out
- Disk operations
- Status checks

Custom metrics can be added via CloudWatch agent.

## Next Steps (Day 25)

1. Add RDS database module
2. Pass DB connection to instances
3. Update user data script to use database
4. Test full 3-tier application
5. Load testing and monitoring

## Current Architecture
Internet
|
Route 53 (optional)
|
ALB (Public Subnets)
|
Target Group
|
ASG with 2-6 instances (Private Subnets)
|
[TODO] RDS Database

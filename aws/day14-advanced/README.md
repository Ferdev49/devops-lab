# Day 14: AWS Advanced Services

## Topics
- Load Balancing: ALB, NLB, routing policies
- Auto Scaling: Automatic capacity management
- CloudWatch: Monitoring and alerting
- Route 53: DNS and routing
- Lambda: Serverless computing

## Project Files

- **load-balancing.md**: ELB, ALB, NLB details
- **auto-scaling.md**: ASG, scaling policies, health checks
- **cloudwatch-monitoring.md**: Metrics, alarms, logs, dashboards
- **route53-dns.md**: DNS, routing policies, health checks
- **lambda-serverless.md**: Serverless functions, event sources, pricing

## Key AWS Advanced Services

| Service | Purpose |
|---------|---------|
| **ALB** | Application-level load balancing |
| **NLB** | High-performance load balancing |
| **ASG** | Auto-scale EC2 instances |
| **CloudWatch** | Monitoring and alerting |
| **Route 53** | DNS service and routing |
| **Lambda** | Serverless compute |

## Architecture with Advanced Services

User -> Route 53 DNS
     -> ALB (multiple AZs)
     -> Auto Scaling Group (EC2 instances)
     -> RDS (database)
     -> Lambda (serverless functions)

## Day 14 vs Day 13

Day 13: Individual services (EC2, S3, RDS, IAM)
Day 14: Service integration and patterns

## Next Steps

- Day 15-20: Solutions Architect exam prep


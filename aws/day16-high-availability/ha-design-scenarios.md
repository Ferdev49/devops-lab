## Scenario 1: E-Commerce Website

Requirements:
- 99.99% uptime
- Handle Black Friday traffic spikes
- Secure payment processing
- Global customers

Solution Architecture:
- Route 53: Geolocation routing
- CloudFront: CDN for global users
- ALB: Load balance across AZs
- Auto Scaling Group: Handle traffic spikes
- RDS Multi-AZ: Database HA
- ElastiCache: Performance caching

Components:
- 2+ AZs for redundancy
- Min 2, Max 50 instances
- Target tracking: CPU 70%
- RDS Multi-AZ with read replicas
- Health checks every 30 seconds

Benefits:
- No single point of failure
- Automatic failover
- Global low latency
- Scales for traffic spikes

## Scenario 2: Microservices API

Requirements:
- Multiple independent services
- High availability
- Independent scaling per service
- Monitoring and alerting

Solution Architecture:
- ALB/NLB per service
- Auto Scaling Group per service
- Multi-AZ deployment
- CloudWatch monitoring
- SNS for notifications

Services:
- User Service: Handles user management
- Product Service: Product catalog
- Order Service: Order processing
- Payment Service: Payment handling

Each service:
- Independent ASG
- Own RDS database
- ALB for load balancing
- Auto Scaling based on service metrics

Benefits:
- Services fail independently
- Scale services independently
- Easier to deploy and test
- Monitoring per service

## Scenario 3: Media Streaming

Requirements:
- Low latency globally
- Handle sudden popularity spike
- Cost-effective
- Reliable delivery

Solution Architecture:
- CloudFront: CDN for global delivery
- S3: Video storage
- Auto Scaling compute (optional)
- CloudWatch: Monitor metrics

Components:
- Videos in S3
- CloudFront distribution
- Edge caching (reduce bandwidth)
- S3 Transfer Acceleration (optional)

Cost Optimization:
- S3 Standard: Frequently accessed
- S3 Infrequent: Archive older videos
- CloudFront: Reduce S3 data transfer
- Cache headers: Optimize caching

Benefits:
- Global low latency
- Handles traffic spikes (CloudFront)
- Cost-effective (S3 + CloudFront)
- No compute servers needed

## Scenario 4: Real-Time Analytics

Requirements:
- Process streaming data
- Real-time dashboards
- HA for analysis pipeline
- Retain historical data

Solution Architecture:
- Kinesis: Streaming ingestion
- Lambda: Process events
- DynamoDB: Real-time data
- S3: Historical data (Glacier)
- QuickSight: Dashboards

Pipeline:
- Data -> Kinesis -> Lambda
- Lambda writes to DynamoDB
- Daily export to S3/Glacier
- QuickSight reads from DynamoDB

Benefits:
- Automatic scaling (Kinesis, Lambda, DynamoDB)
- HA by default (AWS managed)
- Real-time and historical analysis
- Cost-effective (pay per request)

## Scenario 5: High-Traffic SaaS Application

Requirements:
- 99.99%+ uptime
- Multi-tenant
- Highly performant
- Secure

Solution Architecture:
- Route 53: DNS
- ALB: Multi-AZ
- Auto Scaling Group: Compute
- RDS Multi-AZ: Shared database
- ElastiCache: Performance cache
- VPC: Network isolation
- CloudTrail: Audit logging

Multi-Tenant Design:
- Shared database with tenant ID
- Separate VPCs per tenant (optional)
- Shared compute infrastructure
- Separate caches per tenant

Scaling:
- Horizontal: Add more instances
- Vertical: Larger instances
- Database: Read replicas

Security:
- IAM for service accounts
- VPC security groups
- Encryption in transit and at rest
- Regular backups

## Design Decision Matrix

| Scenario | HA Pattern | Min Instances | Max Instances |
|----------|-----------|---------------|---------------|
| E-Commerce | Multi-AZ + ASG | 2 | 50 |
| Microservices | Service-specific | 2 per service | 20 per service |
| Streaming | CDN (CloudFront) | N/A | N/A |
| Analytics | Managed services | Auto | Auto |
| SaaS | Multi-AZ + ASG | 3 | 100 |

## Exam Tips

1. Always consider multi-AZ
2. Eliminate single points of failure
3. Use load balancers and auto scaling
4. Database redundancy (Multi-AZ or replicas)
5. Monitor and alert on metrics
6. Test failure scenarios
7. Document recovery procedures
8. Consider cost implications
## Pattern 1: High Availability Web Application

Requirements:
- 99.99% uptime
- Handle traffic spikes
- Secure database
- Content delivery

Architecture:
- Route 53 (DNS with failover)
- CloudFront (CDN)
- ALB (load balancer) in 2+ AZs
- Auto Scaling Group (EC2)
- RDS Multi-AZ
- ElastiCache (optional, for caching)
- CloudWatch (monitoring)

Services Used:
- Route 53, CloudFront, ALB, EC2, ASG, RDS, ElastiCache, CloudWatch

Cost: Medium to High
Complexity: High
Availability: 99.99%+

## Pattern 2: Serverless Application

Requirements:
- Auto-scaling
- Minimal operations
- REST API
- Flexible billing

Architecture:
- API Gateway
- Lambda functions
- DynamoDB
- S3 (static content)
- CloudFront (CDN)

Services Used:
- API Gateway, Lambda, DynamoDB, S3, CloudFront

Cost: Low (pay per request)
Complexity: Low
Availability: 99.99%+ (AWS managed)

## Pattern 3: Microservices Architecture

Requirements:
- Scalable services
- Independent deployment
- Service discovery
- Load distribution

Architecture:
- ALB/NLB (service entry)
- EC2 or ECS (services)
- RDS (databases)
- ElastiCache (caching)
- CloudWatch (monitoring)
- SNS/SQS (async messaging)

Services Used:
- ALB/NLB, EC2, ECS, RDS, ElastiCache, SNS, SQS, CloudWatch

Cost: Medium
Complexity: High
Availability: 99.9%+

## Pattern 4: Data Lake

Requirements:
- Store massive data
- Query on demand
- Cost-effective
- Scalable processing

Architecture:
- S3 (data storage, Glacier for archive)
- Athena (query)
- Glue (ETL)
- QuickSight (visualization)

Services Used:
- S3, Athena, Glue, QuickSight

Cost: Low (storage + query)
Complexity: Medium
Use Case: Analytics, big data

## Pattern 5: High-Security Private Application

Requirements:
- Maximum security
- Private network
- Audit everything
- Minimal internet exposure

Architecture:
- VPC with private subnets only
- Systems Manager Session Manager (no SSH)
- VPC endpoints (private access to AWS services)
- RDS (encrypted, no public access)
- KMS (encryption)
- CloudTrail (auditing)

Services Used:
- VPC, Security Groups, Systems Manager, KMS, CloudTrail, RDS

Cost: Medium
Complexity: High
Security: Maximum

## Pattern 6: Global Application

Requirements:
- Low latency worldwide
- Regional failover
- Data residency
- Global scale

Architecture:
- Route 53 (geo-routing)
- CloudFront (content delivery)
- Multi-region deployment
- RDS Read Replicas (different regions)
- DynamoDB Global Tables

Services Used:
- Route 53, CloudFront, EC2 (multi-region), RDS, DynamoDB, S3

Cost: High (multi-region)
Complexity: Very High
Availability: 99.99%+ (global)

## Pattern Selection Based on Requirements

| Need | Pattern |
|------|---------|
| **Simple web app** | Single AZ |
| **High availability web app** | Pattern 1 |
| **Microservices** | Pattern 3 |
| **Serverless API** | Pattern 2 |
| **Big data analytics** | Pattern 4 |
| **Ultra-secure** | Pattern 5 |
| **Global reach** | Pattern 6 |

## Exam Tips for Patterns

1. Identify requirements first
2. Select appropriate pattern
3. Explain trade-offs
4. Know service alternatives
5. Understand cost implications
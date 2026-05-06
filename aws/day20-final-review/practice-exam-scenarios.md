## Scenario 1: Healthcare Application

Requirements:
- HIPAA compliance required
- 99.99% uptime
- Fast patient record access
- Cost-effective for growth

Question: Which architecture best meets these requirements?

A) Single EC2 instance, unencrypted storage, local backup
B) Multi-AZ RDS, KMS encryption, VPC isolation, CloudTrail logging
C) Serverless with DynamoDB, partial encryption
D) Single region with Reserved Instances

Answer: B
Reasoning:
- HIPAA requires encryption and audit trails (CloudTrail)
- 99.99% needs Multi-AZ
- VPC isolation for security
- Cost: RDS Reserved Instances help control costs

## Scenario 2: High-Traffic Video Platform

Requirements:
- Global users (low latency worldwide)
- Variable traffic (spikes during events)
- 99.99% uptime
- Cost optimization

Question: Best data delivery strategy?

A) Single region, large instances
B) CloudFront for content, regional auto-scaling, Spot for variable
C) Route 53 weighted routing, EC2 only
D) DynamoDB global tables, no caching

Answer: B
Reasoning:
- CloudFront: Global low latency (performance)
- Auto Scaling: Handle variable traffic (availability)
- Spot: Cost optimization for variable workload
- Multiple regions: Better latency worldwide

## Scenario 3: Internal Analytics Platform

Requirements:
- Data from 50 source systems
- Queries on 10TB+ data
- Low monthly cost
- Occasional queries, not real-time

Question: Most cost-effective architecture?

A) RDS with read replicas, continuous running
B) Athena + S3 Glacier, pay per query
C) DynamoDB on-demand
D) Custom EC2 instances for processing

Answer: B
Reasoning:
- S3 Glacier: 80% cheaper storage
- Athena: Pay per query (no always-on compute)
- Occasional use = on-demand model better
- Total cost: \$100-200/month vs \$10K/month RDS

## Scenario 4: Real-Time Stock Trading Platform

Requirements:
- Ultra-low latency (<100ms)
- 99.999% uptime
- Handle traffic spikes
- High cost acceptable

Question: Which service optimizes for latency?

A) Fargate with RDS
B) EC2 with ElastiCache + NLB + DynamoDB
C) Lambda with API Gateway
D) CloudFront for all content

Answer: B
Reasoning:
- NLB: Ultra-low latency load balancing
- ElastiCache: In-memory caching for speed
- DynamoDB: Sub-ms latency database
- EC2: Deterministic performance
- Lambda: Cold starts too slow for ultra-low latency

## Scenario 5: Cost-Constrained Startup

Requirements:
- MVP with minimal cost
- Can tolerate some downtime
- Database with single point of failure acceptable
- Simple application

Question: Most cost-effective startup setup?

A) Multi-AZ RDS, load-balanced EC2
B) Single t3.micro instance, RDS Single-AZ, Spot for burst
C) Lambda + API Gateway + DynamoDB on-demand
D) Self-managed Kubernetes cluster

Answer: C
Reasoning:
- Lambda: No servers, pay per use
- DynamoDB on-demand: Pay per request
- API Gateway: Cheap entry point
- Total: \$10-50/month vs \$500+/month for traditional

## Scenario 6: Secure Government Application

Requirements:
- Maximum security
- Air-gapped network
- Compliance auditing
- Performance secondary

Question: Security-first architecture?

A) Public ALB, standard security groups
B) Private subnets only, VPC endpoints, KMS encryption, CloudTrail
C) Internet-exposed for convenience
D) Single AZ for simplicity

Answer: B
Reasoning:
- Private subnets: No internet exposure
- VPC endpoints: Private AWS service access
- KMS + CloudTrail: Encryption and audit
- Compliance: Everything traceable

## Quick Decision Guide

When you see...
- \"99.99% uptime\" -> Think: Multi-AZ, RDS Multi-AZ, health checks
- \"Reduce costs\" -> Think: RI, Spot, Lifecycle, right-sizing
- \"Fast access\" -> Think: ElastiCache, CloudFront
- \"Secure\" -> Think: VPC, IAM, KMS, CloudTrail
- \"Global\" -> Think: CloudFront, Route 53, multi-region
- \"Real-time\" -> Think: DynamoDB, Kinesis, NLB
- \"Archive data\" -> Think: Glacier, Deep Archive
- \"Compliance\" -> Think: CloudTrail, encryption, VPC

## Exam Question Patterns

Pattern 1: Given requirements, pick architecture
- Read requirements carefully
- Match to domains
- Eliminate wrong answers
- Choose best fit

Pattern 2: Identify problem with current design
- Find single points of failure
- Missing security
- Inefficient cost
- Performance bottlenecks

Pattern 3: Optimize existing architecture
- Add redundancy (HA)
- Improve security
- Enhance performance
- Reduce cost

Pattern 4: Trade-off scenarios
- Cost vs performance
- Security vs simplicity
- HA vs cost
- Choose based on requirements
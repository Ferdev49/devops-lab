## Exam Details

**Exam Code:** SAA-C03
**Duration:** 130 minutes
**Questions:** 65 multiple choice and multiple response
**Passing Score:** 720 out of 1000
**Cost:** ~\$150 USD

## Exam Content Domains

### Domain 1: Design High-Availability, Fault-Tolerant, and Scalable Systems (34%)

Key Topics:
- Multi-AZ deployments
- Auto Scaling
- Load balancing
- Redundancy and failover
- Database replication
- Queue-based architectures

Services:
- EC2, ELB, ALB, NLB
- RDS Multi-AZ, Read replicas
- Auto Scaling Groups
- SNS, SQS
- Route 53 failover

### Domain 2: Design Secure Applications and Architectures (30%)

Key Topics:
- IAM policies and roles
- Encryption (at rest, in transit)
- VPC security (Security Groups, NACLs)
- Data protection
- Secrets management
- Compliance and auditing

Services:
- IAM
- VPC, Security Groups, NACLs
- KMS (Key Management Service)
- Secrets Manager
- CloudTrail
- CloudWatch

### Domain 3: Design Cost-Optimized Architectures (18%)

Key Topics:
- Right-sizing instances
- Reserved Instances vs On-Demand vs Spot
- Storage optimization
- Data transfer optimization
- Managed services vs self-managed

Services:
- EC2 pricing models
- S3 storage classes
- RDS Reserved Instances
- CloudFront
- Data transfer strategies

### Domain 4: Design Performant Architectures (18%)

Key Topics:
- Database optimization
- Caching strategies
- Content delivery
- Compute optimization
- Monitoring and scaling

Services:
- ElastiCache
- CloudFront
- RDS optimization
- Lambda
- CloudWatch

## AWS Well-Architected Framework

Five pillars:

1. **Operational Excellence**
   - Preparation
   - Operation
   - Evolution

2. **Security**
   - Identity and access management
   - Detective controls
   - Infrastructure protection
   - Data protection
   - Incident response

3. **Reliability**
   - Foundations
   - Workload architecture
   - Change management
   - Failure management

4. **Performance Efficiency**
   - Selection
   - Review
   - Monitoring
   - Trade-offs

5. **Cost Optimization**
   - Expenditure awareness
   - Resource optimization
   - Matching supply with demand
   - Optimizing over time

## Exam Question Types

### Multiple Choice
- One correct answer
- Three incorrect answers

### Multiple Response
- One or more correct answers
- State the number of correct answers

## Common Exam Scenarios

### Scenario Type 1: Scalability
"A company needs to handle traffic spikes. Which solution?"
Answer: Auto Scaling Group + Load Balancer

### Scenario Type 2: High Availability
"Database needs 99.99% uptime. Which solution?"
Answer: RDS Multi-AZ deployment

### Scenario Type 3: Security
"Need to encrypt data at rest. Which service?"
Answer: AWS KMS

### Scenario Type 4: Cost Optimization
"Reduce database costs for stable workload. Which option?"
Answer: Reserved Instances

## Exam Strategy

1. Read question carefully (twice)
2. Identify keywords
3. Eliminate obviously wrong answers
4. Consider trade-offs
5. Understand service differences
6. Know limitations and constraints

## Key Exam Topics (Deep Dive)

### High Availability Architecture

Pattern: Multi-AZ with Auto Scaling
- Route 53 health checks
- ALB across AZs
- Auto Scaling Group
- RDS Multi-AZ database
- CloudWatch monitoring

### Secure Architecture

Components:
- VPC with private/public subnets
- Security Groups + NACLs
- IAM roles and policies
- KMS encryption
- CloudTrail auditing

### Cost-Optimized Architecture

Strategies:
- Right-size EC2 instances
- Use Reserved Instances for steady workload
- Use Spot Instances for batch jobs
- Use S3 Glacier for archive
- Use CloudFront for content delivery

### High-Performance Architecture

Techniques:
- ElastiCache for database caching
- CloudFront for content delivery
- Read replicas for read scaling
- Lambda for serverless
- Optimize database queries

## Study Tips

✅ Understand concepts, not just memorize
✅ Know service limitations and constraints
✅ Practice explaining trade-offs
✅ Do practice exams
✅ Focus on weak areas
✅ Understand real-world use cases
✅ Know service differences
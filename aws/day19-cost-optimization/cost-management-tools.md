## AWS Cost Explorer

Visualize spending over time.

Features:
- Historical costs (by service, region, instance type)
- Forecasting (predict next month)
- Filtering (by tag, account, etc.)
- Anomaly detection

How to use:
1. Open Cost Explorer
2. Filter by service
3. Analyze trends
4. Create custom dashboards

## AWS Budgets

Set spending limits and alerts.

Types:
- Cost Budgets: Monitor costs
- Usage Budgets: Monitor usage
- Reservation Budgets: Monitor RI coverage

Actions:
- Email alerts when approaching limit
- SNS notifications
- Auto-scaling triggers (reduce)

Example:
- Monthly budget: \$5,000
- Alert at 80%: \$4,000
- Alert at 100%: \$5,000

## AWS Trusted Advisor

Automated recommendations.

Checks:
- Cost Optimization: Remove unused resources
- Performance: Underutilized resources
- Security: Security group rules
- Fault Tolerance: Single points of failure
- Service Limits: Approaching limits

Free tier: Limited checks
Premium: All checks + API access

## AWS Cost & Usage Report

Detailed billing data.

Contains:
- All AWS usage
- Hourly granularity
- Cost breakdown
- Amortized costs

Use for:
- Detailed analysis
- Data science/ML
- Custom dashboards
- Compliance

## Tagging Strategy

Tag resources for cost allocation.

Common tags:
- Cost Center
- Environment (prod, staging, dev)
- Application
- Owner
- Project

Activate cost allocation tags:
- Costs can be filtered by tags
- Chargeback to teams
- Budget control

Example:
Tag all production database instances with:
- Environment: prod
- Cost Center: engineering
- Application: backend

## Cost Optimization Initiatives

### Quick Wins (1-2 weeks)
- Remove unused resources
- Stop idle instances
- Delete old snapshots
- Unattach unused volumes

Typical savings: 5-15%

### Medium-term (1-3 months)
- Right-size instances
- Switch to Reserved Instances
- Move to S3 Glacier
- Consolidate resources

Typical savings: 15-40%

### Long-term (3+ months)
- Architecture redesign
- Serverless migration
- Multi-region optimization
- Cost culture change

Typical savings: 30-60%

## Cost Optimization by Service

### EC2 Optimization
- Reserved Instances: 30-70% savings
- Spot Instances: 50-90% savings
- Right-sizing: 20-40% savings

### S3 Optimization
- Lifecycle policies: 50-80% savings
- Intelligent-Tiering: 20-50% savings
- Compression: 20-80% savings

### RDS Optimization
- Aurora: 40% cheaper, 10x faster
- Reserved Instances: 30-70% savings
- Smaller instance: 20-40% savings

### Lambda Optimization
- Optimization: Reduce memory (faster = cheaper)
- Provisioned Concurrency: Reserved capacity

## Financial Planning

### Capacity Planning
- Forecast growth (2x in 6 months?)
- Plan purchases (Reserve now)
- Budget for growth

### Chargeback Model
- Allocate costs to teams/projects
- Drive cost awareness
- Encourage optimization

### Savings Goals
- Set targets (20% reduction)
- Track progress
- Celebrate wins

## Cost Culture

Organizations with strong cost culture save 20-40% more.

Practices:
- Cost awareness training
- Budget ownership by teams
- Regular reviews
- Cost optimization challenges
- Recognition for savings

## Exam Perspective

Common cost questions:
- \"Reduce costs without losing performance\": Right-size, use Spot
- \"Cost-effective database\": Aurora or DynamoDB
- \"Cost-efficient storage\": S3 Lifecycle + Glacier
- \"Manage costs as scale grows\": Reserved Instances + Auto-scaling
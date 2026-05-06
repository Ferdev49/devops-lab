# EC2 Purchasing Options & Cost - Day 19

## EC2 Pricing Models

### On-Demand
Pay per hour used.

Characteristics:
- No commitment
- Full price per hour
- Most expensive
- Best for: Unpredictable workloads

Example: \.10/hour = \/month

### Reserved Instances (RI)
Commit to 1 or 3 years for discount.

Discount:
- 1-year: 30-40% savings
- 3-year: 60-70% savings

Example:
- On-Demand: \.10/hour = \/year
- 1-year RI: \/month = \/year (18% savings)
- 3-year RI: \/month = \/year (42% savings)

Types:
- Standard RI: No flexibility
- Convertible RI: Change instance type (lower discount)

Best for: Steady-state workloads, production databases

### Spot Instances
Bid for unused capacity.

Discount: Up to 90% off On-Demand

Characteristics:
- Can be interrupted (2-minute warning)
- Cheaper than On-Demand and RI

Example:
- On-Demand: \.10/hour
- Spot: \.02-\.05/hour (50-80% savings)

Best for: Non-critical workloads, batch jobs, testing

### Savings Plans
Hourly commitment for 1 or 3 years.

Benefits:
- More flexible than RI (works across instance families)
- Similar discounts to RI (30-70%)
- Works with EC2, Fargate, Lambda

Best for: Flexible workloads across regions/instance types

## Purchasing Strategy

### Predictable Workload
Use: Reserved Instances or Savings Plans
Savings: 60-70%

Example:
- 10 instances running 24/7
- Cost: \.10 x 10 = \/hour = \,760/year
- With 3-year RI: ~\,600/year (70% savings)

### Variable Workload
Use: On-Demand + Spot Instances
Example:
- Baseline: 2 On-Demand
- Peak: 8 Spot (when available)

### Development/Testing
Use: Spot Instances
Savings: 80%+

## Instance Right-Sizing

Choose appropriate instance type for workload.

Process:
1. Monitor actual CPU, memory, network
2. Identify underutilized instances
3. Downsize to smaller instance
4. Repeat quarterly

Savings: 20-40% per instance

### Example:
- Current: m5.xlarge (\.192/hour) - 10% CPU
- Right-sized: t3.medium (\.0416/hour) - 50% CPU
- Savings: 78% (\,344/year per instance)

## Reserved Instance vs Savings Plan

| Feature | RI | Savings Plan |
|---------|-----|-------------|
| Commitment | 1 or 3 years | 1 or 3 years |
| Instance Type | Fixed | Flexible |
| Region | Fixed | Flexible (some) |
| Discount | 30-70% | 30-70% |
| Change Instance | Convertible (lower discount) | Yes (free) |

Savings Plans: Better for flexibility
Reserved Instances: Better if you know exact config

## Cost Monitoring

AWS Cost Explorer:
- Visualize spending
- Filter by service, region, instance type
- Forecasting

Budgets:
- Set spending limits
- Alerts when approaching limit
- Auto-scaling triggers

Trusted Advisor:
- Cost optimization recommendations
- Identifies unused resources
- Suggests Reserved Instances

## Cost Reduction Opportunities

✅ Reserved Instances: 30-70% savings
✅ Spot Instances: 50-90% savings
✅ Right-sizing: 20-40% savings
✅ Remove unused resources: 10-20% savings
✅ Storage optimization: 10-30% savings
✅ Data transfer optimization: 10-20% savings

Total Potential: 40-80% cost reduction


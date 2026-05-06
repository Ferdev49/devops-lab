# Day 19: Design for Cost Optimization

## Topics
- EC2 purchasing options (On-Demand, Reserved, Spot, Savings Plans)
- Right-sizing EC2 instances
- Storage cost optimization (S3, EBS, RDS)
- Cost management tools (Cost Explorer, Budgets)
- Data transfer optimization
- Cost optimization scenarios

## Project Files

- **ec2-purchasing-cost.md**: Pricing models and purchasing strategies
- **right-sizing-storage-cost.md**: Right-sizing and storage optimization
- **cost-management-tools.md**: Cost management and optimization tools
- **cost-optimization-scenarios.md**: Real-world cost optimization examples

## Key Cost Services

| Service | Cost Reduction |
|---------|----------------|
| **Reserved Instances** | 30-70% savings |
| **Spot Instances** | 50-90% savings |
| **Right-sizing** | 20-40% savings |
| **S3 Lifecycle** | 50-80% savings |
| **Aurora vs RDS** | 40-60% cheaper |

## Cost Optimization Levels

1. **Quick Wins**: Remove unused (5-15% savings)
2. **Short-term**: Right-size, purchase RI (15-40% savings)
3. **Medium-term**: Lifecycle, Spot, Aurora (30-50% savings)
4. **Long-term**: Architecture redesign (50-70% savings)

## Purchasing Strategy

- **Predictable:** Reserved Instances or Savings Plans
- **Variable:** On-Demand + Spot Instances
- **Dev/Test:** Spot Instances only

## Cost Tools

- **Cost Explorer:** Visualize spending
- **Budgets:** Set limits and alerts
- **Trusted Advisor:** Recommendations
- **Tags:** Cost allocation and tracking

## Cost Optimization Formula

Total Savings = RI Savings + Right-sizing + Storage + Data Transfer

Typical: 40-80% reduction possible

## Next Steps

- Day 20: Practice Exams & Final Review
- Week 5-6: Portfolio Projects


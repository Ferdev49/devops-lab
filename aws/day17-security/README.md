## Topics
- IAM (Identity & Access Management)
- VPC Security (Security Groups, NACLs)
- Encryption (At rest, in transit)
- Secrets Management
- CloudTrail Auditing
- Compliance Standards

## Project Files

- **iam-security.md**: IAM users, groups, roles, policies, PoLP
- **vpc-security.md**: VPC, Security Groups, NACLs, architecture
- **encryption-security.md**: KMS, S3/RDS/EBS encryption, TLS
- **compliance-auditing.md**: CloudTrail, Config, GuardDuty, CloudWatch

## Key Security Services

| Service | Purpose |
|---------|---------|
| **IAM** | Access control |
| **VPC** | Network isolation |
| **Security Groups** | Instance firewall |
| **NACLs** | Subnet firewall |
| **KMS** | Key management |
| **CloudTrail** | Audit logs |
| **Secrets Manager** | Secret storage |

## Security Pillars

1. **Identity**: IAM, MFA, authentication
2. **Network**: VPC, Security Groups, NACLs
3. **Application**: Encryption, secrets, validation
4. **Data**: Encryption, backup, access control
5. **Monitoring**: CloudTrail, CloudWatch, GuardDuty

## Principle of Least Privilege (PoLP)

Grant minimum permissions needed to perform job.

## Security Best Practices

✅ Enable MFA
✅ Use roles instead of access keys
✅ Encrypt data at rest and in transit
✅ Use Security Groups and NACLs
✅ Enable CloudTrail
✅ Regular access reviews
✅ Secrets Manager for sensitive data
✅ VPC for network isolation

## Next Steps

- Day 18: Design for Performance
- Day 19: Design for Cost Optimization
- Day 20: Practice Exams
## CloudTrail

Audit logs for all AWS API calls.

Captures:
- Who made the call (principal)
- What action (API call)
- When (timestamp)
- Where (source IP)
- What was the result (success/failure)

Use Cases:
- Compliance auditing
- Security analysis
- Troubleshooting
- Detecting unauthorized access

Data:
- Stored in S3 (choose bucket)
- Searchable via Athena
- Alertable via CloudWatch

Best Practice: Enable in all accounts and regions

## CloudWatch Logs

Application and system logs.

Sources:
- EC2 instances
- Lambda functions
- CloudTrail events
- Application logs
- AWS services

Features:
- Log retention
- Log filtering
- Metric filters: Extract metrics from logs
- Insights: SQL-like log queries

Use Case: Real-time monitoring and alerting

## AWS Config

Track resource configuration changes.

Monitors:
- EC2 configurations
- Security group rules
- IAM policies
- S3 bucket settings
- RDS configurations

Features:
- Configuration timeline
- Compliance rules
- Alerts on changes
- Remediation actions

Use Case: Compliance and configuration management

## VPC Flow Logs

Monitor network traffic.

Data:
- Source/destination IP
- Ports
- Protocol
- Accept/reject status

Stored in:
- CloudWatch Logs
- S3

Use Case: Network troubleshooting, security analysis

## GuardDuty

Threat detection service.

Detects:
- Unauthorized access attempts
- Unusual API calls
- Malware activity
- Cryptocurrency mining

Data Sources:
- CloudTrail logs
- VPC Flow Logs
- DNS logs

Use Case: Continuous threat monitoring

## Security Hub

Centralized security monitoring.

Aggregates:
- GuardDuty findings
- CloudTrail logs
- Config compliance
- Third-party security tools

Use Case: Enterprise security management

## Compliance Standards

Common certifications:
- ISO 27001: Information security
- SOC 2: Service organization controls
- PCI DSS: Payment card security
- HIPAA: Healthcare data
- FedRAMP: Government

AWS Compliance:
- Shared responsibility model
- AWS responsible for infrastructure
- Customer responsible for data/application security

## Compliance Checklist

✅ Enable CloudTrail
✅ Enable CloudWatch Logs
✅ Configure AWS Config
✅ Enable VPC Flow Logs
✅ Enable GuardDuty
✅ Use Security Hub
✅ Regular security reviews
✅ Incident response plan
✅ Data retention policies
✅ Regular backups

## Shared Responsibility Model

AWS Responsible:
- Physical security
- Network security
- Hypervisor security
- Service management

Customer Responsible:
- IAM
- Application security
- Data encryption
- Network configuration
- Access control
- Patch management (OS level)
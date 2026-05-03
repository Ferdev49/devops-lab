## Encryption Concepts

### At Rest
Data stored (not moving).

Examples:
- S3 objects
- RDS databases
- EBS volumes
- DynamoDB tables

### In Transit
Data moving between systems.

Examples:
- API calls (HTTPS)
- Database connections
- Replication between regions

## KMS (Key Management Service)

AWS encryption key management.

Features:
- Create and manage encryption keys
- Automatic key rotation
- Audit key usage with CloudTrail
- Control access via IAM policies
- FIPS 140-2 compliant

Key Types:
- AWS Managed Keys: Created and managed by AWS (free)
- Customer Managed Keys: You create and manage (cost)

Use Case: Sensitive data encryption

## Encryption in S3

Options:
- No encryption
- SSE-S3: S3 managed keys (default, no cost)
- SSE-KMS: KMS managed keys (cost, more control)
- SSE-C: Customer provided keys (you manage)
- Client-side encryption: Encrypt before upload

Default: SSE-S3 (AES-256)

For compliance/audit requirements: Use SSE-KMS

## Encryption in RDS

Options:
- Encryption disabled (not recommended)
- KMS encryption at rest
- SSL/TLS in transit (must enable)

Process:
- Enable encryption on creation
- Cannot add encryption to existing unencrypted DB
- Performance impact: Minimal

## Encryption in EBS

Options:
- Unencrypted (default)
- Encryption enabled

Process:
- Enable on volume creation
- Minor performance impact
- Snapshots of encrypted volumes are encrypted
- Cannot remove encryption

## Encryption in Transit

HTTPS/TLS for all communications.

Implementation:
- API calls: HTTPS only
- Database: SSL/TLS certificates
- RDS: Enable SSL
- ALB: HTTPS listener
- CloudFront: HTTPS

Certificate Options:
- AWS Certificate Manager (ACM): Free public certificates
- Self-signed: For testing only
- Third-party: Other CAs

## AWS Certificate Manager (ACM)

Free SSL/TLS certificates.

Features:
- Public certificates for CloudFront, ALB, API Gateway
- Automatic renewal
- No cost (private certificates have cost)
- Validated via DNS or email

Use Case: HTTPS for web applications

## Secrets Manager

Store and rotate secrets.

Secrets:
- Database passwords
- API keys
- OAuth tokens
- SSH keys

Features:
- Automatic rotation
- Access via API
- Audit with CloudTrail
- Integration with services

Alternative: Parameter Store (simpler, free for standard parameters)

## Encryption Best Practices

✅ Encrypt data at rest
✅ Use HTTPS/TLS for data in transit
✅ Use AWS KMS for key management
✅ Rotate encryption keys
✅ Use Secrets Manager for sensitive data
✅ Audit encryption key usage
✅ Use ACM for SSL/TLS certificates
✅ Encrypt database connections
✅ Encrypt backups
✅ Separate encryption keys per environment

## Exam Perspective

Common exam questions:
- \"Encrypt RDS database\": Use KMS or enable encryption
- \"Secure API communication\": Use HTTPS/TLS
- \"Store passwords securely\": Use Secrets Manager
- \"Manage encryption keys\": Use KMS
- \"Automatic key rotation\": KMS customer managed keys
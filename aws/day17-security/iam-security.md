## What is IAM?

Service that controls access to AWS resources.

Core Concept: WHO can access WHAT resources and HOW.

## IAM Components

### 1. Users
Individual person or service.

Characteristics:
- Unique username
- Access credentials (password or access keys)
- Permissions via policies
- MFA can be enabled

Best Practice: Don't use root account for daily work

### 2. Groups
Collection of users.

Benefits:
- Manage permissions for multiple users at once
- Easier to maintain
- Users inherit group permissions

Example: 'developers' group with EC2 access

### 3. Roles
Temporary credentials for services or cross-account access.

Use Cases:
- EC2 instance role: Access S3, DynamoDB
- Lambda role: Write logs to CloudWatch
- Cross-account access: Account A assumes role in Account B
- Federation: External users assume role

Key Difference from Users:
- Users have permanent credentials
- Roles have temporary credentials (STS tokens)
- Roles don't have passwords or access keys

### 4. Policies
Permissions document in JSON format.

Types:
- Identity-based: Attached to user, group, or role
- Resource-based: Attached to resource (S3 bucket, SQS queue)
- Permission boundaries: Maximum permissions
- Session policies: Additional restrictions on temporary credentials

Policy Structure:
{
  'Version': '2012-10-17',
  'Statement': [
    {
      'Effect': 'Allow' or 'Deny',
      'Action': ['s3:GetObject', 's3:ListBucket'],
      'Resource': 'arn:aws:s3:::my-bucket/*'
    }
  ]
}

## Principle of Least Privilege (PoLP)

Grant minimum permissions needed to perform job.

Benefits:
- Reduces blast radius if credentials compromised
- Prevents accidental misuse
- Easier to audit
- Complies with security standards

Implementation:
- Start with no permissions
- Add only required permissions
- Use resource-specific policies
- Regular access reviews

## IAM Best Practices

✅ Enable MFA for all users
✅ Use roles instead of access keys when possible
✅ Rotate access keys regularly
✅ Delete unused credentials
✅ Use groups for permission management
✅ Monitor IAM activity with CloudTrail
✅ Use temporary credentials (STS)
✅ Never share credentials
✅ Use IAM policy simulator to test
✅ Regular access reviews

## IAM Authentication Methods

### Passwords
- User login to AWS console
- Standard username/password

### Access Keys
- Programmatic access (AWS CLI, SDK)
- Access Key ID + Secret Access Key
- Must be rotated

### Temporary Security Credentials
- From STS (Security Token Service)
- Have expiration time
- More secure than long-term credentials

### MFA (Multi-Factor Authentication)
- Virtual MFA device (Google Authenticator)
- Hardware MFA key
- SMS (less secure)
- Adds second factor of authentication

## IAM Policies in Exam

Common scenarios:
- Allow EC2 access to S3 bucket
- Restrict actions by IP address
- Allow cross-account access
- Deny specific actions (explicit deny)
- Conditional policies (time-based, IP-based)

Exam Tips:
- Understand policy evaluation logic
- Know ARN format
- Recognize policy conditions
- Identify missing permissions
- Spot security issues

## Service Roles

Pre-built roles for services:

Examples:
- EC2InstanceProfileRole: EC2 to access services
- LambdaExecutionRole: Lambda to write logs
- RDSEnhancedMonitoringRole: RDS to send metrics

Use these instead of creating custom roles.

## Cross-Account Access

Allow users in Account A to access resources in Account B.

Process:
1. Create role in Account B
2. Trust policy allows Account A principal
3. User in Account A assumes role
4. Temporary credentials issued
5. Access Account B resources

Use Case: Multi-account architecture for isolation
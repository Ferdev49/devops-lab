# IAM Policies - Day 13

## Example: EC2 Read-Only Policy

{
  'Version': '2012-10-17',
  'Statement': [
    {
      'Effect': 'Allow',
      'Action': [
        'ec2:Describe*',
        'ec2:Get*'
      ],
      'Resource': '*'
    }
  ]
}

This policy allows describing and getting information about EC2 resources.

## Example: S3 Bucket Access

{
  'Version': '2012-10-17',
  'Statement': [
    {
      'Effect': 'Allow',
      'Action': [
        's3:GetObject',
        's3:ListBucket'
      ],
      'Resource': [
        'arn:aws:s3:::my-bucket/*',
        'arn:aws:s3:::my-bucket'
      ]
    }
  ]
}

This policy allows listing and reading objects in a specific S3 bucket.

## IAM Best Practices

1. Use IAM users instead of root account
2. Enable MFA for all users
3. Use strong passwords
4. Rotate access keys regularly
5. Delete unused credentials
6. Use groups for permissions
7. Use roles for services
8. Use policy conditions for additional security
9. Regular access reviews
10. Use CloudTrail for auditing

## ARN (Amazon Resource Name) Format

arn:partition:service:region:account-id:resource-type/resource-id

Examples:
- arn:aws:ec2:us-east-1:123456789012:instance/i-1234567890abcdef0
- arn:aws:s3:::my-bucket
- arn:aws:rds:us-east-1:123456789012:db:mydb


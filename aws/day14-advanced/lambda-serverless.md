# AWS Lambda - Serverless Computing - Day 14

## What is Lambda?

Serverless compute service. Upload code, Lambda runs it.

No servers to manage:
- No EC2 instances to provision
- No patching
- Auto-scaling built-in
- Pay only for execution time

## Lambda Function Structure

Handler: Entry point, receives event and context
Event: Input data (API request, S3 event, etc.)
Context: Runtime information
Response: What function returns

## Supported Languages

- Python
- Node.js
- Java
- Go
- .NET
- Ruby
- Custom runtime

## Lambda Pricing

- Free tier: 1 million requests, 400,000 GB-seconds per month
- After: Pay per million requests + GB-seconds

GB-seconds = memory (GB) * execution time (seconds)

Example: 512MB function running 1 second = 0.5 GB-seconds

## Event Sources

Trigger Lambda from:
- API Gateway (REST APIs)
- S3 (file uploads)
- DynamoDB (stream changes)
- Kinesis (real-time data)
- SNS (notifications)
- SQS (queues)
- CloudWatch (schedules)
- ALB (HTTP)

## Lambda Best Practices

✅ Keep functions small and focused
✅ Use environment variables for config
✅ Set appropriate timeout (default 3 seconds)
✅ Set appropriate memory (128MB-10GB)
✅ Use IAM roles for permissions
✅ Monitor with CloudWatch
✅ Version and alias functions
✅ Use VPC only if needed (adds startup time)

## Cold Start vs Warm Start

Cold Start: First invocation, creates container (100-300ms overhead)
Warm Start: Reusing existing container (minimal overhead)

Minimize cold starts:
- Provisioned Concurrency
- Keep dependencies small
- Optimize initialization code

## Lambda with API Gateway

Create REST API without managing servers.

Flow:
1. Client calls API Gateway
2. API Gateway invokes Lambda
3. Lambda processes request
4. Lambda returns response
5. API Gateway sends to client

## Use Cases

✅ REST APIs
✅ Data processing
✅ Real-time file processing
✅ Scheduled tasks
✅ IoT applications
✅ Chatbots
✅ Machine learning inference


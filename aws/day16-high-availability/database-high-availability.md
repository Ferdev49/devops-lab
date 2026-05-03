## RDS Multi-AZ Overview

Synchronous replication to standby instance in different AZ.

Setup:
- Primary instance: Active, accepts reads/writes
- Standby instance: Passive, receives synchronous replicas
- Both in different Availability Zones

Failover Process:
1. Primary fails
2. Route 53 detects failure (health check)
3. DNS updated to point to standby
4. Standby promoted to primary
5. New standby created in another AZ
6. Total failover time: ~1-2 minutes

Database Options with Multi-AZ:
- PostgreSQL
- MySQL
- MariaDB
- Oracle
- SQL Server

## RDS Read Replicas

Asynchronous replication for scaling reads.

Characteristics:
- Read-only replicas
- Can be in same region or different region
- Slight replication lag (usually milliseconds)
- Can have cascading replicas
- Can be promoted to standalone database

Use Cases:
- Read-heavy applications
- Analytics on production data
- Disaster recovery (different region)

Difference from Multi-AZ:
- Multi-AZ: HA for primary instance
- Read Replica: Scale read capacity

## DynamoDB High Availability

NoSQL database with built-in HA.

Features:
- Multi-AZ by default
- Automatic data replication
- No manual failover needed
- Global Tables: Multi-region replication

Global Tables:
- Active-active replication
- Read/write in any region
- Automatic conflict resolution

## ElastiCache (Redis/Memcached) HA

In-memory caching with high availability.

Redis:
- Multi-AZ automatic failover
- Cluster mode: Partitioned data
- Primary and replica nodes

Memcached:
- No automatic failover
- Use multiple nodes across AZs

Use Case: Cache database queries for performance

## Database Backup Strategy

For Disaster Recovery:

Backup Types:
1. Automated Backups (RDS)
   - Daily snapshots
   - Point-in-time recovery (up to 35 days)
   - Retention configurable

2. Manual Snapshots
   - User-initiated
   - Retained indefinitely

3. Backups to S3
   - Export data to S3
   - Long-term archival
   - Cross-region capability

Recovery Objectives:
- RTO (Recovery Time Objective): How fast to recover
- RPO (Recovery Point Objective): How much data loss acceptable

## Data Replication Across Regions

For disaster recovery and compliance:

Options:
1. RDS Read Replicas (different region)
2. DynamoDB Global Tables
3. S3 cross-region replication
4. Database-native replication

Cost: Additional charges for data transfer

## HA Database Architecture

Pattern: Multi-AZ with Read Replicas

Primary:
- Multi-AZ (synchronous standby)
- Accepts all writes
- Also handles reads

Read Replicas:
- In same or different region
- Handle read-heavy queries
- Asynchronous replication

Analytics Database:
- Separate RDS instance
- Replica from production
- Analytics queries don't impact production

Result:
- HA for writes (Multi-AZ)
- Scale reads (Read Replicas)
- Analytics isolation
- Disaster recovery (cross-region replicas)
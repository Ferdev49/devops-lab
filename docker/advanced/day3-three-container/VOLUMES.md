# Docker Volumes Deep Dive

## What are Volumes?
Volumes provide persistent storage that survives container shutdown/restart.

## Types of Storage in Docker

### 1. Volumes (Named Volumes)
- Managed by Docker
- Location: /var/lib/docker/volumes/ (Linux)
- Can be shared between containers
- Survives container deletion
- **BEST for production**

### 2. Bind Mounts
- Mounts directory from host machine
- Full control over location
- Can be modified from host
- Good for development

### 3. tmpfs Mounts
- Stored in memory
- Fast but temporary
- Lost when container stops
- Good for sensitive data

## My Three-Container Setup

### Redis Volume
- Volume name: redis-data
- Mount point in container: /data
- Purpose: Persist Redis data (cache)
- Without volume: Data lost on restart
- With volume: Data persists

### PostgreSQL Volume
- Volume name: postgres-data
- Mount point in container: /var/lib/postgresql/data
- Purpose: Persist database files
- Without volume: Database lost on restart
- With volume: Database survives

## How Volumes Work

\\\
┌──────────────────────────────────────┐
│         Host Machine                 │
│  /var/lib/docker/volumes/            │
│    ├─ redis-data/                    │
│    │   └─ [Redis AOF files]          │
│    └─ postgres-data/                 │
│        └─ [PostgreSQL data files]    │
│                                      │
│  ┌─────────────────────────────────┐ │
│  │  Container: redis               │ │
│  │  Mount: /data → redis-data ◀──┼─┼─ Mapping
│  │  (can read/write data)          │ │
│  └─────────────────────────────────┘ │
│                                      │
│  ┌─────────────────────────────────┐ │
│  │  Container: db                  │ │
│  │  Mount: /var/lib/postgresql     │ │
│  │         → postgres-data ◀────┼─┼─ Mapping
│  │  (can read/write data)          │ │
│  └─────────────────────────────────┘ │
└──────────────────────────────────────┘
\\\

## Docker-Compose Volume Definition

\\\yaml
volumes:
  redis-data:      # Creates named volume
  postgres-data:   # Creates named volume

services:
  redis:
    volumes:
      - redis-data:/data              # Mount redis-data to /data
  
  db:
    volumes:
      - postgres-data:/var/lib/postgresql/data
\\\

## Key Concepts

### 1. Data Persistence
- Without volumes: Container data → deleted on \docker-compose down\
- With volumes: Data persists on host machine

### 2. Volume Lifecycle
- Created: When docker-compose up runs
- Data written: While container running
- Preserved: After \docker-compose down\ (volume still exists)
- Reused: Next \docker-compose up\ uses same volume with old data

### 3. Multiple Containers Sharing Volumes
- Multiple containers can mount same volume
- Good for: Log aggregation, shared configuration
- Risk: Data conflicts (careful with concurrent writes)

## Useful Volume Commands

\\\ash
# List volumes
docker volume ls

# Inspect volume details
docker volume inspect redis-data
docker volume inspect postgres-data

# View volume mount point in container
docker inspect three-tier-redis

# Delete volume (⚠️ Deletes data!)
docker volume rm redis-data
docker volume prune  # Delete unused volumes

# Backup volume
docker run --rm -v redis-data:/data -v C:\Users\ADMIN\devops-lab\docker\advanced\day3-three-container:/backup \
  alpine tar czf /backup/redis-backup.tar.gz /data

# Restore volume
docker run --rm -v redis-data:/data -v C:\Users\ADMIN\devops-lab\docker\advanced\day3-three-container:/backup \
  alpine tar xzf /backup/redis-backup.tar.gz
\\\

## Volume Management in docker-compose

### Create volumes automatically
\\\yaml
services:
  redis:
    volumes:
      - redis-data:/data
  
volumes:
  redis-data:    # Creates volume, auto-managed
\\\

### Remove volumes on cleanup
\\\ash
docker-compose down        # Keeps volumes
docker-compose down -v     # Deletes volumes (⚠️)
\\\

## Lessons Learned
1. Volumes = persistent data across container restarts
2. Different volumes for different services (redis-data ≠ postgres-data)
3. docker-compose manages volumes automatically
4. Data in volumes survives \docker-compose down\
5. Use \docker-compose down -v\ ONLY when you want to delete data

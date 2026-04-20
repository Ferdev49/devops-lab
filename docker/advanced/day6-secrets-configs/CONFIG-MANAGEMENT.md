# Docker Configuration Management

## What is Configuration Management?

Safely managing application settings, secrets, and environment-specific configurations.

## Configuration Levels

### 1. Hardcoded (BAD)
`javascript
const API_KEY = 'hardcoded-secret-123';  // ❌ NEVER DO THIS
const DB_URL = 'postgres://localhost';
`

### 2. Environment Variables (OK for non-secrets)
`javascript
const API_KEY = process.env.API_KEY;      // ❌ Not for secrets
const PORT = process.env.PORT || 3000;    // ✅ OK for non-secrets
`

### 3. Docker Secrets (BEST for secrets)
`javascript
const apiKey = fs.readFileSync('/run/secrets/api_key', 'utf8');  // ✅ BEST
`

### 4. External Services (Production)
`javascript
// AWS Secrets Manager
// HashiCorp Vault
// Azure Key Vault
// Google Secret Manager
`

## Configuration Strategy

### Development
- Use .env file (not in git!)
- Environment variables
- Hardcoded defaults OK (only for dev)

### Testing
- Use test fixtures
- Mock external services
- Temporary test secrets

### Production
- Docker Secrets (Swarm)
- Kubernetes Secrets (K8s)
- Cloud provider solutions:
  - AWS Secrets Manager
  - Azure Key Vault
  - Google Secret Manager
  - HashiCorp Vault

## My Day 6 Configuration

### In Docker

Reads from /run/secrets/ (if available)
Falls back to defaults (if not in Swarm)
Never exposes actual values
Shows configuration status on web page


### Files Read
- /run/secrets/api_key
- /run/secrets/db_url

### Status Display
- Shows if secrets were loaded
- Shows current environment
- Shows request count
- Demonstrates secure handling

## Best Practices Summary

1. **Environment-specific configs:**
   - Development: .env file
   - Testing: fixtures
   - Production: Secrets Manager

2. **Never commit to git:**
   - Passwords
   - API keys
   - Private keys
   - .env files with real secrets

3. **Use .gitignore:**
.env
secrets/
.env.local
*.key
*.pem

4. **Rotation strategy:**
   - Regularly rotate passwords
   - Use temporary credentials
   - Audit access logs

5. **Least privilege:**
   - Only give services needed secrets
   - Don't expose all secrets everywhere
   - Different secrets per environment

## Key Takeaways
1. Secrets and Configs are different things
2. Secrets for sensitive data (passwords, keys)
3. Configs for non-sensitive settings
4. Never hardcode credentials
5. Production: use managed services

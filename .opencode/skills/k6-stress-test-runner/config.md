# k6 Stress Test Runner - Configuration

## Test Profiles

### Smoke Test
```bash
TARGET_RPS=100 RAMP_DURATION=10s HOLD_DURATION=30s
```

### Baseline Test
```bash
TARGET_RPS=1000 RAMP_DURATION=30s HOLD_DURATION=2m
```

### Load Test
```bash
TARGET_RPS=5000 RAMP_DURATION=60s HOLD_DURATION=5m
```

### Stress Test
```bash
TARGET_RPS=20000 RAMP_DURATION=120s HOLD_DURATION=10m
```

### Spike Test
```bash
# Run baseline first, then spike
TARGET_RPS=50000 RAMP_DURATION=10s HOLD_DURATION=1m
```

## Database-Specific Notes

### MySQL
- Default port: 3306
- TLS configurable via DB_TLS env var
- Replication lag checked via SHOW SLAVE STATUS

### PostgreSQL
- Default port: 5432
- Supports connection pooling via PgBouncer
- Replication lag checked via pg_stat_replication

### MongoDB
- Default port: 27017
- Uses native Go driver via xk6-sql
- Replica set monitoring available

### Redis
- Default port: 6379
- In-memory, expect higher RPS
- Replication lag checked via INFO REPLICATION

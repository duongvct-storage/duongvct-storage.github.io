# Multi-DB Test Orchestrator

## Purpose
Orchestrate and coordinate stress tests across multiple database systems (MySQL, PostgreSQL, MongoDB, Redis) with different topologies (single, replica, cluster, cluster+LB).

## When to Use
- Running comprehensive benchmark suites across all databases
- Comparing performance across database engines under identical load
- Testing multiple topologies in sequence
- Automated CI/CD benchmark pipelines

## Test Matrix

### Databases
- MySQL
- PostgreSQL
- MongoDB
- Redis

### Topologies per Database
- Single instance
- Primary-Replica
- Cluster
- Cluster + Load Balancer (where applicable)

### Total Test Combinations
- 4 databases × 4 topologies = 16 test scenarios
- Not all databases support all topologies (MongoDB: single, replica; Redis: single, replica)

## Orchestration Script

### Run All Single Instance Tests
```bash
#!/bin/bash
# run_single_tests.sh

TARGET_RPS=${1:-10000}
HOLD_DURATION=${2:-5m}

for db in mysql postgres mongodb redis; do
  echo "=== Running ${db} single instance test ==="
  TARGET_RPS=$TARGET_RPS HOLD_DURATION=$HOLD_DURATION ./k6 run k6_${db}_rps.js
  sleep 10  # Cool down between tests
done
```

### Run All Replica Tests
```bash
#!/bin/bash
# run_replica_tests.sh

TARGET_RPS=${1:-10000}
HOLD_DURATION=${2:-5m}

for db in mysql postgres mongodb redis; do
  echo "=== Running ${db} replica test ==="
  TARGET_RPS=$TARGET_RPS HOLD_DURATION=$HOLD_DURATION ./k6 run k6_${db}_rps_rep.js
  sleep 10
done
```

### Run All Cluster Tests
```bash
#!/bin/bash
# run_cluster_tests.sh

TARGET_RPS=${1:-10000}
HOLD_DURATION=${2:-5m}

for db in mysql postgres; do
  echo "=== Running ${db} cluster test ==="
  TARGET_RPS=$TARGET_RPS HOLD_DURATION=$HOLD_DURATION ./k6 run k6_${db}_rps_cluster.js
  sleep 10
done

for db in mysql postgres; do
  echo "=== Running ${db} cluster+LB test ==="
  TARGET_RPS=$TARGET_RPS HOLD_DURATION=$HOLD_DURATION ./k6 run k6_${db}_rps_cluster_lb.js
  sleep 10
done
```

## Full Benchmark Suite

```bash
#!/bin/bash
# run_full_benchmark.sh

TARGET_RPS=${1:-10000}
RAMP_DURATION=${2:-60s}
HOLD_DURATION=${3:-5m}
WRITE_RATIO=${4:-0.5}

echo "========================================="
echo "FULL DATABASE BENCHMARK SUITE"
echo "========================================="
echo "Target RPS: $TARGET_RPS"
echo "Ramp Duration: $RAMP_DURATION"
echo "Hold Duration: $HOLD_DURATION"
echo "Write Ratio: $WRITE_RATIO"
echo "========================================="

# Phase 1: Single Instance Tests
echo -e "\n[Phase 1] Single Instance Tests"
for db in mysql postgres mongodb redis; do
  echo -e "\n>>> Testing ${db} single instance..."
  TARGET_RPS=$TARGET_RPS RAMP_DURATION=$RAMP_DURATION HOLD_DURATION=$HOLD_DURATION WRITE_RATIO=$WRITE_RATIO \
    ./k6 run k6_${db}_rps.js
  sleep 10
done

# Phase 2: Replica Tests
echo -e "\n[Phase 2] Primary-Replica Tests"
for db in mysql postgres mongodb redis; do
  echo -e "\n>>> Testing ${db} replica..."
  TARGET_RPS=$TARGET_RPS RAMP_DURATION=$RAMP_DURATION HOLD_DURATION=$HOLD_DURATION WRITE_RATIO=$WRITE_RATIO \
    ./k6 run k6_${db}_rps_rep.js
  sleep 10
done

# Phase 3: Cluster Tests
echo -e "\n[Phase 3] Cluster Tests"
for db in mysql postgres; do
  echo -e "\n>>> Testing ${db} cluster..."
  TARGET_RPS=$TARGET_RPS RAMP_DURATION=$RAMP_DURATION HOLD_DURATION=$HOLD_DURATION WRITE_RATIO=$WRITE_RATIO \
    ./k6 run k6_${db}_rps_cluster.js
  sleep 10
  
  echo -e "\n>>> Testing ${db} cluster + LB..."
  TARGET_RPS=$TARGET_RPS RAMP_DURATION=$RAMP_DURATION HOLD_DURATION=$HOLD_DURATION WRITE_RATIO=$WRITE_RATIO \
    ./k6 run k6_${db}_rps_cluster_lb.js
  sleep 10
done

echo -e "\n========================================="
echo "BENCHMARK SUITE COMPLETE"
echo "========================================="
echo "Results saved to summary_*.json files"
echo "Run analysis: python3 analyze_benchmarks.py summary_*.json"
```

## Quick Start Commands

### Run Quick Smoke Test (All DBs)
```bash
TARGET_RPS=500 HOLD_DURATION=1m ./k6 run k6_mysql_rps.js && \
TARGET_RPS=500 HOLD_DURATION=1m ./k6 run k6_postgres_rps.js && \
TARGET_RPS=500 HOLD_DURATION=1m ./k6 run k6_mongodb_rps.js && \
TARGET_RPS=500 HOLD_DURATION=1m ./k6 run k6_redis_rps.js
```

### Run Standard Benchmark (All DBs)
```bash
./run_full_benchmark.sh 10000 60s 5m 0.5
```

### Run High-Load Comparison
```bash
./run_full_benchmark.sh 50000 120s 10m 0.3
```

## Output Organization

After running the full suite, results will be:
```
summary_mysql_rps.json          # MySQL single
summary_mysql_rps_rep.json      # MySQL replica
summary_mysql_rps_cluster.json  # MySQL cluster
summary_mysql_rps_cluster_lb.json  # MySQL cluster+LB
summary_postgres_rps.json       # PostgreSQL single
summary_postgres_rps_rep.json   # PostgreSQL replica
summary_postgres_rps_cluster.json  # PostgreSQL cluster
summary_postgres_rps_cluster_lb.json  # PostgreSQL cluster+LB
summary_mongodb_rps.json        # MongoDB single
summary_mongodb_rps_rep.json    # MongoDB replica
summary_redis_rps.json          # Redis single
summary_redis_rps_rep.json      # Redis replica
```

## Analysis After Suite

```bash
# Compare all results
python3 analyze_benchmarks.py summary_*.json

# Compare specific databases
python3 analyze_benchmarks.py summary_mysql_rps.json summary_postgres_rps.json

# Compare topologies for one database
python3 analyze_benchmarks.py summary_mysql_rps*.json
```

## Environment Setup Checklist

Before running the full suite:
- [ ] All database instances are running and accessible
- [ ] Network connectivity verified (ping, telnet to ports)
- [ ] Schema loaded on all databases (products table)
- [ ] Sufficient resources on k6 runner machine
- [ ] Database connection strings configured
- [ ] Adequate disk space for result files

## Troubleshooting

### Test Fails Mid-Suite
- Check database logs for errors
- Verify database hasn't crashed under load
- Check k6 runner machine resources
- Resume from failed test manually

### Inconsistent Results
- Ensure no other workloads running on database servers
- Run tests multiple times and average results
- Check for network issues between k6 runner and databases
- Verify database configurations are consistent

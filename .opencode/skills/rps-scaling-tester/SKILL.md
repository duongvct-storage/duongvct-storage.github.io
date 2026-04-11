# RPS Scaling Tester

## Purpose
Progressively increase RPS to find database breaking points, maximum sustainable throughput, and performance degradation curves.

## When to Use
- Finding maximum RPS before failure
- Understanding performance degradation patterns
- Capacity planning and sizing
- Identifying the "knee" of the performance curve

## Scaling Strategies

### 1. Linear Ramp
Gradually increase RPS from low to high over extended duration.

```bash
# Ramp from 0 to 50000 over 10 minutes, hold for 5 minutes
TARGET_RPS=50000 RAMP_DURATION=10m HOLD_DURATION=5m ./k6 run k6_mysql_rps.js
```

### 2. Step Scaling
Run multiple tests with increasing RPS targets.

```bash
# Step through RPS levels: 1k, 5k, 10k, 20k, 30k, 40k, 50k
for rps in 1000 5000 10000 20000 30000 40000 50000; do
  echo "=== Testing ${rps} RPS ==="
  TARGET_RPS=$rps RAMP_DURATION=30s HOLD_DURATION=3m ./k6 run k6_mysql_rps.js
  sleep 15
done
```

### 3. Spike Testing
Test sudden load increases to measure recovery.

```bash
# Baseline then spike
TARGET_RPS=5000 HOLD_DURATION=2m ./k6 run k6_mysql_rps.js
sleep 10
TARGET_RPS=50000 RAMP_DURATION=5s HOLD_DURATION=1m ./k6 run k6_mysql_rps.js
```

## Step Scaling Script

```bash
#!/bin/bash
# rps_scaling_test.sh - Progressive RPS scaling test
# Usage: ./rps_scaling_test.sh [database] [start_rps] [max_rps] [step]

DB=${1:-mysql}
START_RPS=${2:-1000}
MAX_RPS=${3:-50000}
STEP=${4:-5000}
HOLD_DURATION=${5:-3m}
RAMP_DURATION=${6:-30s}

echo "========================================="
echo "RPS SCALING TEST"
echo "========================================="
echo "Database: $DB"
echo "Start RPS: $START_RPS"
echo "Max RPS: $MAX_RPS"
echo "Step: $STEP"
echo "Hold Duration: $HOLD_DURATION"
echo "========================================="

RESULTS_FILE="scaling_results_${DB}.csv"
echo "rps,tps,avg_latency,p95_latency,fail_rate,vus_max" > $RESULTS_FILE

CURRENT_RPS=$START_RPS

while [ $CURRENT_RPS -le $MAX_RPS ]; do
  echo -e "\n>>> Testing ${CURRENT_RPS} RPS..."
  
  # Run k6 and capture output
  OUTPUT=$(TARGET_RPS=$CURRENT_RPS RAMP_DURATION=$RAMP_DURATION HOLD_DURATION=$HOLD_DURATION \
    ./k6 run k6_${DB}_rps.js 2>&1)
  
  # Extract metrics from output (customize based on k6 output format)
  TPS=$(echo "$OUTPUT" | grep -oP 'TPS \(success/s\):\s*\K[\d.]+')
  AVG_LAT=$(echo "$OUTPUT" | grep -oP 'Latency avg:\s*\K[\d.]+')
  P95_LAT=$(echo "$OUTPUT" | grep -oP 'Latency p95:\s*\K[\d.]+')
  FAIL_RATE=$(echo "$OUTPUT" | grep -oP 'Fail rate:\s*\K[\d.]+')
  VUS_MAX=$(echo "$OUTPUT" | grep -oP 'VUs max:\s*\K[\d.]+')
  
  echo "${CURRENT_RPS},${TPS},${AVG_LAT},${P95_LAT},${FAIL_RATE},${VUS_MAX}" >> $RESULTS_FILE
  
  # Check for threshold breach
  if echo "$OUTPUT" | grep -q "thresholds.*fail"; then
    echo "!!! Threshold breached at ${CURRENT_RPS} RPS - stopping"
    break
  fi
  
  CURRENT_RPS=$((CURRENT_RPS + STEP))
  sleep 15
done

echo -e "\n========================================="
echo "SCALING TEST COMPLETE"
echo "Results saved to: $RESULTS_FILE"
echo "========================================="
```

## Finding Maximum RPS

### Binary Search Approach
```bash
# Start with range 10k-50k
# Test midpoint (30k)
# If passes, test 40k; if fails, test 20k
# Continue narrowing until within 1k precision

low=10000
high=50000

while [ $((high - low)) -gt 1000 ]; do
  mid=$(( (low + high) / 2 ))
  echo "Testing ${mid} RPS (range: ${low}-${high})"
  
  OUTPUT=$(TARGET_RPS=$mid RAMP_DURATION=60s HOLD_DURATION=3m ./k6 run k6_mysql_rps.js 2>&1)
  
  if echo "$OUTPUT" | grep -q "thresholds.*fail"; then
    high=$mid
  else
    low=$mid
  fi
done

echo "Maximum sustainable RPS: ~${low}"
```

## Performance Curve Analysis

After running scaling tests, analyze the curve:

```python
import csv
import matplotlib.pyplot as plt

# Read results
rps_values = []
tps_values = []
latency_values = []
fail_rates = []

with open('scaling_results_mysql.csv', 'r') as f:
    reader = csv.DictReader(f)
    for row in reader:
        rps_values.append(int(row['rps']))
        tps_values.append(float(row['tps']))
        latency_values.append(float(row['p95_latency']))
        fail_rates.append(float(row['fail_rate']))

# Plot TPS vs Target RPS
plt.figure(figsize=(12, 4))

plt.subplot(1, 3, 1)
plt.plot(rps_values, tps_values, 'b-o')
plt.xlabel('Target RPS')
plt.ylabel('Actual TPS')
plt.title('Throughput Curve')
plt.grid(True)

# Plot Latency vs Target RPS
plt.subplot(1, 3, 2)
plt.plot(rps_values, latency_values, 'r-o')
plt.xlabel('Target RPS')
plt.ylabel('P95 Latency (ms)')
plt.title('Latency Curve')
plt.grid(True)

# Plot Fail Rate vs Target RPS
plt.subplot(1, 3, 3)
plt.plot(rps_values, fail_rates, 'g-o')
plt.xlabel('Target RPS')
plt.ylabel('Fail Rate')
plt.title('Failure Curve')
plt.grid(True)

plt.tight_layout()
plt.savefig('scaling_curve_mysql.png')
plt.show()
```

## Key Metrics to Track

| Metric | What It Tells You |
|--------|-------------------|
| TPS vs Target RPS | When actual TPS stops increasing, you've hit capacity |
| P95 Latency Curve | When latency starts climbing exponentially, you're near capacity |
| Fail Rate | When failures start, you've exceeded capacity |
| VUs Used | If VUs hit max, you need more VUs to test higher RPS |

## Capacity Planning Guidelines

| Scenario | Recommendation |
|----------|----------------|
| TPS plateaus | Database has reached max throughput |
| P95 latency doubles | Approaching capacity, add resources |
| Fail rate > 1% | Exceeded capacity, reduce load |
| VUs at max | k6 limitation, not database - increase VUs |

## Quick Start

### Find MySQL Max RPS
```bash
./rps_scaling_test.sh mysql 1000 50000 5000 3m
```

### Compare Max RPS Across Databases
```bash
for db in mysql postgres mongodb redis; do
  ./rps_scaling_test.sh $db 1000 50000 5000 2m
done
```

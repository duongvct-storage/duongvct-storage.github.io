#!/bin/bash
# rps_scaling_test.sh - Progressive RPS scaling test
# Usage: ./rps_scaling_test.sh [database] [start_rps] [max_rps] [step] [hold_duration] [ramp_duration]

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
  
  OUTPUT=$(TARGET_RPS=$CURRENT_RPS RAMP_DURATION=$RAMP_DURATION HOLD_DURATION=$HOLD_DURATION \
    ./k6 run k6_${DB}_rps.js 2>&1)
  
  TPS=$(echo "$OUTPUT" | grep -oP 'TPS \(success/s\):\s*\K[\d.]+')
  AVG_LAT=$(echo "$OUTPUT" | grep -oP 'Duration avg:\s*\K[\d.]+')
  P95_LAT=$(echo "$OUTPUT" | grep -oP 'Latency p95:\s*\K[\d.]+')
  FAIL_RATE=$(echo "$OUTPUT" | grep -oP 'Fail rate:\s*\K[\d.]+')
  VUS_MAX=$(echo "$OUTPUT" | grep -oP 'VUs max:\s*\K[\d.]+')
  
  echo "${CURRENT_RPS},${TPS},${AVG_LAT},${P95_LAT},${FAIL_RATE},${VUS_MAX}" >> $RESULTS_FILE
  
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

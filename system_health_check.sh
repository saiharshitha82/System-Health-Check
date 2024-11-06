#!/bin/bash

# Define the output file
REPORT_FILE="system_health_report.txt"

# Get current date and time
echo "System Health Check Report - $(date)" > $REPORT_FILE

# Check for free disk space (> 20%)
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
if [ "$DISK_USAGE" -gt 80 ]; then
    echo "Disk Space Check: FAIL - ${DISK_USAGE}% used" >> $REPORT_FILE
else
    echo "Disk Space Check: PASS - ${DISK_USAGE}% used" >> $REPORT_FILE
fi

# Check CPU load (below 70%)
CPU_LOAD=$(ps -A -o %cpu | awk '{s+=$1} END {print s}')
if (( $(echo "$CPU_LOAD > 70" | bc -l) )); then
    echo "CPU Load Check: FAIL - ${CPU_LOAD}% usage" >> $REPORT_FILE
else
    echo "CPU Load Check: PASS - ${CPU_LOAD}% usage" >> $REPORT_FILE
fi

# Check if PostgreSQL service is running
if launchctl list | grep -q "org.postgresql.postgres"; then
    echo "PostgreSQL Service Check: PASS - Service is running" >> $REPORT_FILE
else
    echo "PostgreSQL Service Check: FAIL - Service is not running" >> $REPORT_FILE
fi

# Output the report
cat $REPORT_FILE

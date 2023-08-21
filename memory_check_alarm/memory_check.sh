#!/usr/bin/env bash

# Get free memory and check if it is less than 1GB

low_threshold="0.7"
sleep_time="60s"

while true; do
    free_mem=$(free -m | awk 'NR==2{printf "%.2f\t\t", $4*100/$2 }')
    if (( $(echo "$free_mem < $low_threshold" | bc -l) )); then
        spd-say -t female2 "Running out of memory ($free_mem% G left)."
        exit
    fi
    sleep $sleep_time
done
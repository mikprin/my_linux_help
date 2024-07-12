#!/bin/bash

# Define the file path
file="capacity.csv"

# Get the output of `sudo tlp-stat -b`
output=$(sudo tlp-stat -b)

# Check if the file does not exist
if [[ ! -f $file ]]; then
    # If the file does not exist, create it and write the headers
    echo "date, capacity, cycle_count" > $file
fi

# Extract the capacity value
capacity=$(echo "$output" | grep -oP 'Capacity\s+=\s+\K[0-9.]+')

# Extract the cycle count value
cycle_count=$(echo "$output" | grep -oP '/sys/class/power_supply/BAT0/cycle_count\s+=\s+\K[0-9]+')

# Get the current date
date=$(date '+%s')

# Append the date and capacity value to the file
echo "$date, $capacity, $cycle_count" >> $file


# Check execution with 
# sudo grep CRON /var/log/syslog
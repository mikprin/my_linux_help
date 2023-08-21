#!/usr/bin/env bash

# Get free memory and check if it is less than 1GB

low_threshold="500"
sleep_time="30s"


while true; do
    # Get the output of the free command
    free_mem=$(free -m | awk 'NR==2{print $7}')
    if (( $(echo "$free_mem < $low_threshold" | bc -l) )); then
        mpv  ~/Music/pullup.mp3
        # spd-say -t female2 "Running out of memory ($free_mem% M left)."
        # exit
    fi
    sleep $sleep_time
done
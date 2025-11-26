#!/bin/bash

# Check if a file was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <video_file>"
    exit 1
fi

input_file="$1"

# Check if file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found"
    exit 1
fi

# Extract filename without extension
filename="${input_file%.*}"
# Extract extension
extension="${input_file##*.}"

# Create output filename
output_file="${filename}_speedup.${extension}"

echo "Speeding up: $input_file -> $output_file"

# Run ffmpeg
ffmpeg -i "$input_file" -filter:v "setpts=PTS/1.2" -filter:a "atempo=1.2" "$output_file"

if [ $? -eq 0 ]; then
    echo "Done! Output: $output_file"
else
    echo "Error during processing"
    exit 1
fi
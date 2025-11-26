#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

USE_ENV=1
KEEP_AUDIO=false

# Activate venv if USE_ENV is set
if [ "$USE_ENV" -eq 1 ]; then
    source "$SCRIPT_DIR/venv/bin/activate"
fi

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --keep-audio|-k)
            KEEP_AUDIO=true
            shift
            ;;
        *)
            input_file="$1"
            shift
            ;;
    esac
done

if [ -z "$input_file" ]; then
    echo "Usage: $0 [--keep-audio|-k] <video_or_audio_file>"
    exit 1
fi

if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found"
    exit 1
fi

# Get file extension
extension="${input_file##*.}"
extension="${extension,,}"  # Convert to lowercase

# Define audio extensions
audio_extensions=("mp3" "wav" "m4a" "aac" "flac" "ogg" "opus")

# Check if it's an audio file
is_audio=false
for ext in "${audio_extensions[@]}"; do
    if [ "$extension" = "$ext" ]; then
        is_audio=true
        break
    fi
done

filename="${input_file%.*}"

# If it's a video, extract audio
if [ "$is_audio" = false ]; then
    echo "Detected video file, extracting audio..."
    audio_file="${filename}_audio.mp3"
    
    ffmpeg -i "$input_file" -q:a 0 -map a "$audio_file" -y
    
    if [ $? -ne 0 ]; then
        echo "Error extracting audio"
        exit 1
    fi
    
    cleanup=true
else
    echo "Using audio file directly..."
    audio_file="$input_file"
    cleanup=false
fi

echo "Converting audio to text with Whisper..."

# Run whisper - outputs to filename.txt by default
whisper "$audio_file" --output_format txt

if [ $? -eq 0 ]; then
    # Rename to match your naming pattern
    transcript_file="${audio_file%.*}.txt"
    final_output="${filename}_transcript.txt"
    mv "$transcript_file" "$final_output"
    echo "Done! Transcript saved to: $final_output"
else
    echo "Error during Whisper transcription"
    exit 1
fi

# Clean up extracted audio if we created it (unless --keep-audio is set)
if [ "$cleanup" = true ] && [ "$KEEP_AUDIO" = false ]; then
    echo "Cleaning up temporary audio file..."
    rm "$audio_file"
elif [ "$cleanup" = true ] && [ "$KEEP_AUDIO" = true ]; then
    echo "Keeping temporary audio file: $audio_file"
fi
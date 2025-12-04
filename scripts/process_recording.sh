#!/bin/bash

# Process recording: convert to text, generate summary, organize files

set -e  # Exit on error

# Set recording variable from command-line argument
RECORDING="${1:?Error: Recording name required as first argument}"

echo "Processing recording: $RECORDING"

# Step 1: Convert audio to text
echo "Step 1: Converting audio to text..."
~/bin/audio2text.sh "${RECORDING}.mp3"

if [ ! -f "${RECORDING}_transcript.txt" ]; then
    echo "Error: Transcript file not created"
    exit 1
fi

echo "✓ Transcript created: ${RECORDING}_transcript.txt"

# Step 2: Generate summary
echo "Step 2: Generating summary..."
python3 ~/bin/short_summary.py "${RECORDING}_transcript.txt" -r

if [ ! -f "${RECORDING}_transcript_summary.txt" ]; then
    echo "Error: Summary file not created"
    exit 1
fi

echo "✓ Summary created: ${RECORDING}_transcript_summary.txt"

# Step 3: Create folder and move all files
echo "Step 3: Organizing files..."
mkdir -p "./$RECORDING"

mv "${RECORDING}.mp3" "./$RECORDING/"
mv "${RECORDING}_transcript.txt" "./$RECORDING/"
mv "${RECORDING}_transcript_summary.txt" "./$RECORDING/"

echo "✓ Files moved to ./$RECORDING/"

# Step 4: Confirm
echo ""
echo "Processing complete!"
echo "Files saved in: ./$RECORDING/"
ls -lh "./$RECORDING/"

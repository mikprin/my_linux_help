#!/usr/bin/env python3
"""
Audio Transcription Script using OpenAI Whisper
Transcribes audio files to text and saves the output.
"""

import argparse
import os
import sys
import whisper
from pathlib import Path


def transcribe_audio(input_file, output_file=None, model_name="base"):
    """
    Transcribe an audio file using Whisper and save the result to a text file.
    
    Args:
        input_file (str): Path to the input audio file
        output_file (str, optional): Path to the output text file. If None, uses input filename with .txt extension
        model_name (str): Whisper model to use (tiny, base, small, medium, large)
    
    Returns:
        bool: True if successful, False otherwise
    """
    try:
        # Check if input file exists
        if not os.path.exists(input_file):
            print(f"Error: Input file '{input_file}' not found.")
            return False
        
        # Generate output filename if not provided
        if output_file is None:
            input_path = Path(input_file)
            output_file = input_path.with_suffix('.txt')
        
        print(f"Loading Whisper model: {model_name}")
        model = whisper.load_model(model_name)
        
        print(f"Transcribing audio file: {input_file}")
        result = model.transcribe(input_file)
        
        # Write transcription to file
        with open(output_file, "w", encoding="utf-8") as f:
            f.write(result["text"])
        
        print(f"Transcription completed successfully!")
        print(f"Output saved to: {output_file}")
        
        # Optional: Print transcription preview
        preview = result["text"][:200] + "..." if len(result["text"]) > 200 else result["text"]
        print(f"\nTranscription preview:\n{preview}")
        
        return True
        
    except Exception as e:
        print(f"Error during transcription: {str(e)}")
        return False


def main():
    """Main function to handle command line arguments and run transcription."""
    parser = argparse.ArgumentParser(
        description="Transcribe audio files using OpenAI Whisper",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s audio.mp3
  %(prog)s audio.wav -o transcript.txt
  %(prog)s audio.ogg -m large
        """
    )
    
    parser.add_argument(
        "input_file",
        help="Path to the input audio file (supports mp3, wav, ogg, etc.)"
    )
    
    parser.add_argument(
        "-o", "--output",
        help="Output text file path (default: input filename with .txt extension)"
    )
    
    parser.add_argument(
        "-m", "--model",
        choices=["tiny", "base", "small", "medium", "large"],
        default="base",
        help="Whisper model to use (default: base)"
    )
    
    args = parser.parse_args()
    
    # Run transcription
    success = transcribe_audio(args.input_file, args.output, args.model)
    
    # Exit with appropriate code
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
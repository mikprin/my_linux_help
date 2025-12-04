#!/usr/bin/env python3

import sys
import os
import google.generativeai as genai

def list_models():
    """List available Gemini models"""
    print("Available models:")
    models = genai.list_models()
    gemini_models = [m for m in models if 'gemini' in m.name.lower()]
    for i, model in enumerate(gemini_models, 1):
        print(f"{i}. {model.name}")
    return gemini_models

def get_model_choice(models):
    """Let user choose a model"""
    while True:
        try:
            choice = int(input(f"\nSelect model (1-{len(models)}): "))
            if 1 <= choice <= len(models):
                return models[choice - 1].name
            else:
                print(f"Please enter a number between 1 and {len(models)}")
        except ValueError:
            print("Invalid input. Please enter a number.")

def process_transcription(file_path, model_name, use_russian=False, pre_prompt=None):
    """Process transcription and generate summary"""
    
    # Read the transcription file
    if not os.path.exists(file_path):
        print(f"Error: File '{file_path}' not found")
        sys.exit(1)
    
    with open(file_path, 'r') as f:
        transcription = f.read()
    
    if not transcription.strip():
        print("Error: Transcription file is empty")
        sys.exit(1)
    
    # Initialize Gemini
    api_key = os.getenv('GEMINI_API_KEY')
    if not api_key:
        print("Error: GEMINI_API_KEY environment variable not set")
        sys.exit(1)
    
    genai.configure(api_key=api_key)
    model = genai.GenerativeModel(model_name)
    
    # Build prompt with optional pre-prompt
    prompt = ""
    if pre_prompt:
        prompt += pre_prompt + "\n\n"
    
    # Hardcoded prompt
    prompt += """This is a meeting transcription. Please analyze it and provide:

1. **Summary**: A brief 2-3 sentence summary of the meeting's main topic and discussion.
2. **Action Points**: A numbered list of specific action items discussed, including who is responsible (if mentioned) and deadlines (if mentioned).

Format the response clearly with these two sections."""
    
    if use_russian:
        prompt += "\n\nUse russian."
    
    prompt += """

---

Meeting Transcription:
"""
    
    full_prompt = prompt + transcription
    
    print(f"\nUsing model: {model_name}")
    print("Processing transcription...")
    
    try:
        response = model.generate_content(full_prompt)
        return response.text
    except Exception as e:
        print(f"Error generating content: {e}")
        sys.exit(1)

def save_output(transcription_path, output_text):
    """Save output to file"""
    base_name = transcription_path.rsplit('.', 1)[0]
    output_file = f"{base_name}_summary.txt"
    
    with open(output_file, 'w') as f:
        f.write(output_text)
    
    return output_file

def main():
    if len(sys.argv) < 2:
        print("Usage: python script.py [-r] [-p <pre-prompt>] <transcription_file>")
        sys.exit(1)
    
    use_russian = False
    pre_prompt = None
    transcription_file = None
    
    # Parse arguments
    i = 1
    while i < len(sys.argv):
        arg = sys.argv[i]
        if arg == '-r':
            use_russian = True
            i += 1
        elif arg == '-p':
            if i + 1 < len(sys.argv):
                pre_prompt = sys.argv[i + 1]
                i += 2
            else:
                print("Error: -p flag requires an argument")
                sys.exit(1)
        else:
            transcription_file = arg
            i += 1
    
    if not transcription_file:
        print("Usage: python script.py [-r] [-p <pre-prompt>] <transcription_file>")
        sys.exit(1)
    
    # List and choose model
    models = list_models()
    if not models:
        print("Error: No Gemini models available")
        sys.exit(1)
    
    model_name = get_model_choice(models)
    
    # Process transcription
    output = process_transcription(transcription_file, model_name, use_russian, pre_prompt)
    
    # Save output
    output_file = save_output(transcription_file, output)
    
    # Print output
    print("\n" + "="*50)
    print(output)
    print("="*50)
    print(f"\nOutput saved to: {output_file}")

if __name__ == "__main__":
    main()
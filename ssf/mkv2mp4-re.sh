#!/bin/zsh

# Check if FFmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "FFmpeg is not installed. Please install FFmpeg before running this script."
    exit 1
fi

# Check if an input parameter is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <input_mkv>"
    exit 1
fi

input_mkv="$1"
output_mp4="${input_mkv%.mkv}.mp4"

# Convert MKV to MP4 with re-encoding
ffmpeg -i "$input_mkv" -c:v libx264 -crf 23 -c:a aac -strict experimental "$output_mp4"

echo "Conversion complete. Output saved as $output_mp4"


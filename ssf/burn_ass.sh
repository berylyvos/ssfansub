#!/bin/zsh

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <video_path> <video_ass_path>"
    exit 1
fi

# Assign input parameters to variables
video_path=$1
video_ass_path=$2

# Check if FFmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "Error: FFmpeg is not installed. Please install FFmpeg and try again."
    exit 1
fi

# Check if the input video file exists
if [ ! -f "$video_path" ]; then
    echo "Error: Video file not found at '$video_path'."
    exit 1
fi

# Check if the input subtitle file exists
if [ ! -f "$video_ass_path" ]; then
    echo "Error: Subtitle file not found at '$video_ass_path'."
    exit 1
fi

# Output file path (you can customize the output file name if needed)
output_path="output.mp4"

# FFmpeg command to convert the video and overlay subtitles
ffmpeg -i "$video_path" -vf "ass=$video_ass_path" "$output_path"

echo "Conversion complete. Output file: $output_path"


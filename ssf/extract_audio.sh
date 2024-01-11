#!/bin/zsh

# Check if the correct number of arguments is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <video_path> [-r | --reencode]"
    exit 1
fi

# Assign input parameters to variables
video_path=$1
reencode=false

# Parse options
while [[ $# -gt 1 ]]; do
    case "$2" in
        -r|--reencode)
            reencode=true
            ;;
        *)
            echo "Unknown option: $2"
            exit 1
            ;;
    esac
    shift
done

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

# Output file path (you can customize the output file name if needed)
output_path="output_audio"

# FFmpeg command to extract audio
if [ "$reencode" = true ]; then
    ffmpeg -i "$video_path" -map 0:a -acodec mp3 "$output_path".mp3
else
    ffmpeg -i "$video_path" -map 0:a -acodec copy "$output_path".aac
fi

echo "Audio extraction complete. Output file: $output_path"

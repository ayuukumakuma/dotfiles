#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title 2webp
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🏙️
# @raycast.argument1 { "type": "text", "placeholder": "image_path" }

# Documentation:
# @raycast.description Convert the image to webp format and reduce the size
# @raycast.author ayuu
# @raycast.authorURL https://raycast.com/ayuu

input="$1"
output="${input%.*}.webp"

if cwebp -q 80 "$input" -o "$output" 2>/dev/null; then
  echo "Converted: $(basename "$output")"
else
  echo "Failed to convert: $(basename "$input")"
  exit 1
fi

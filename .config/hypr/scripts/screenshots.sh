#!/bin/bash

# Check if 'grim' is running
if pgrep -x "grim" >/dev/null; then
  # Kill slurp and grim gracefully
  killall slurp
  killall grim

  # Run OCR script
  ~/.config/hypr/scripts/ocr.sh
else
  # Start grim and capture a region using slurp
  # grim -g "$(slurp)" "/home/irwtn/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png" | wl-copy --type image/png
  IMG=~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%m-%s).png && grim -g "$(slurp)" $IMG && wl-copy --type image/png <$IMG
fi

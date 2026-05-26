#!/usr/bin/env bash
# Query current brightness percentage
percent=$(brightnessctl -m | cut -d, -f4 | tr -d '%')
if [ -z "$percent" ]; then
    percent=0
fi

# Choose an icon based on percentage
if [ "$percent" -ge 75 ]; then
    icon="󰃠" # High brightness
elif [ "$percent" -ge 35 ]; then
    icon="󰃟" # Medium brightness
else
    icon="󰃞" # Low brightness
fi

echo "${icon} ${percent}%"

#!/usr/bin/env bash
percent=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)
status=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null)

if [ -z "$percent" ]; then
    echo "󰂎 N/A"
    exit 0
fi

# Choose an icon based on status and percentage
if [ "$status" = "Charging" ]; then
    if [ "$percent" -ge 90 ]; then icon="󰂋";
    elif [ "$percent" -ge 80 ]; then icon="󰂊";
    elif [ "$percent" -ge 70 ]; then icon="󰢞";
    elif [ "$percent" -ge 60 ]; then icon="󰂉";
    elif [ "$percent" -ge 50 ]; then icon="󰢝";
    elif [ "$percent" -ge 40 ]; then icon="󰂈";
    elif [ "$percent" -ge 30 ]; then icon="󰂇";
    elif [ "$percent" -ge 20 ]; then icon="󰂆";
    else icon="󰢜"; fi
else
    if [ "$percent" -ge 95 ]; then icon="󰁹";
    elif [ "$percent" -ge 90 ]; then icon="󰁹";
    elif [ "$percent" -ge 80 ]; then icon="󰁿";
    elif [ "$percent" -ge 70 ]; then icon="󰁾";
    elif [ "$percent" -ge 60 ]; then icon="󰁽";
    elif [ "$percent" -ge 50 ]; then icon="󰁼";
    elif [ "$percent" -ge 40 ]; then icon="󰁻";
    elif [ "$percent" -ge 30 ]; then icon="󰁺";
    elif [ "$percent" -ge 20 ]; then icon="󰁹";
    else icon="󰂎"; fi
fi

echo "${icon} ${percent}%"

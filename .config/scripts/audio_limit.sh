#!/bin/bash

current_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\+%' | head -n 1 | tr -d '%')

increment=10

new_volume=$((current_volume + increment))

if [ $new_volume -gt 100 ]; then
    new_volume=100
fi

# Establece el nuevo volumen
pactl set-sink-volume @DEFAULT_SINK@ ${new_volume}%

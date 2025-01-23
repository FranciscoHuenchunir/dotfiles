#!/bin/bash

get_volume() {
    # Obtén solo el volumen actual del primer canal
    pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\+%' | head -n 1
}

# Mostrar el volumen inicial
get_volume

# Escuchar eventos de PulseAudio
pactl subscribe | while read -r event; do
    # Filtrar eventos relacionados con 'destino' (sink)
    if echo "$event" | grep -q "destino"; then
        get_volume
    fi
done

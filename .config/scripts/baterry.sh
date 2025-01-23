#!/bin/bash

# Obtiene el estado y porcentaje de la batería
state=$(upower -i $(upower -e | grep battery) | grep state | awk '{print $2}')
percentage=$(upower -i $(upower -e | grep battery) | grep percentage | awk '{print $2}' | tr -d '%')
percentage=$((percentage))  # Convierte 'percentage' en un entero

icon_discharging() {
    if [[ $percentage -gt 5 && $percentage -lt 10 ]]; then
        echo "󰁺 $percentage%"
    elif [[ $percentage -gt 10 && $percentage -lt 20 ]]; then
        echo "󰁻 $percentage%"
    elif [[ $percentage -gt 20 && $percentage -lt 30 ]]; then
        echo "󰁼 $percentage%"
    elif [[ $percentage -gt 30 && $percentage -lt 50 ]]; then
        echo "󰁽 $percentage%"
    elif [[ $percentage -gt 50 && $percentage -lt 60 ]]; then
        echo "󰁿 $percentage%"
    elif [[ $percentage -gt 60 && $percentage -lt 80 ]]; then
        echo "󰂀 $percentage%"
    elif [[ $percentage -gt 80 && $percentage -lt 90 ]]; then
        echo "󰂁 $percentage%"
    elif [[ $percentage -gt 80 && $percentage -lt 90 ]]; then
        echo "󰂂 $percentage%"
    fi
}
icon_charging() {
    if [[ $percentage -gt 5 && $percentage -lt 10 ]]; then
        echo "󰢜 $percentage%"
    elif [[ $percentage -gt 10 && $percentage -lt 20 ]]; then
        echo "󰂆 $percentage%"
    elif [[ $percentage -gt 20 && $percentage -lt 30 ]]; then
        echo "󰂇 $percentage%"
    elif [[ $percentage -gt 30 && $percentage -lt 50 ]]; then
        echo "󰂈 $percentage%"
    elif [[ $percentage -gt 50 && $percentage -lt 60 ]]; then
        echo "󰂉 $percentage%"
    elif [[ $percentage -gt 70 && $percentage -lt 80 ]]; then
        echo "󰢞 $percentage%"
    elif [[ $percentage -gt 80 && $percentage -lt 90 ]]; then
        echo "󰂊 $percentage%"
    elif [[ $percentage -gt 80 && $percentage -lt 90 ]]; then
        echo "󰂋 $percentage%"
    fi
}

# Verifica el estado de la batería y llama a la función de selección de íconos
if [[ $state == 'charging' ]]; then
    icon_charging
elif [[ $state == 'discharging' ]]; then
    icon_discharging
fi

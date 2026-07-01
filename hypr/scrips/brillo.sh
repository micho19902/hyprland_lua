#!/bin/bash

# Obtiene el nombre del dispositivo de retroiluminación (normalmente es el primero)
DEVICE=$(brightnessctl -l | grep -oP 'Device \K.*' | head -n1)

# Ajusta el brillo. $1 es el primer argumento del script (ej: '5%+' o '5%-')
brightnessctl -d "$DEVICE" s "$1" >/dev/null

# Obtiene el brillo actual en formato numérico (sin el símbolo de porcentaje)
CURRENT_BRIGHTNESS=$(brightnessctl -d "$DEVICE" -m | cut -d, -f4 | tr -d '%')

# Envía la notificación
notify-send -e \
  -h string:x-canonical-private-synchronous:brightness_notif \
  -h int:value:"$CURRENT_BRIGHTNESS" \
  "Brillo: ${CURRENT_BRIGHTNESS}%"

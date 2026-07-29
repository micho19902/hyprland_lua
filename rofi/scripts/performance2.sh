#!/bin/bash

CURRENT=$(powerprofilesctl get 2>/dev/null)
if [ -z "$CURRENT" ]; then
  notify-send -u critical "Error" "No se pudo obtener el perfil actual"
  exit 1
fi

echo $CURRENT

performance=''
balanced=''
powersaver=''

# Determinar el índice del perfil actual en el orden del menú
case $CURRENT in
performance) index=0 ;;
power-saver) index=1 ;; # Ojo: el comando devuelve "power-saver"
balanced) index=2 ;;
*) index=0 ;; # fallback
esac

perfil=$(
  echo -e "$performance\n$powersaver\n$balanced" | rofi -theme-str 'window {location: north; fullscreen: false; width: 750px;}' \
    -theme-str 'mainbox {orientation: horizontal; children: [ "message", "listview" ];}' \
    -theme-str 'listview {columns: 3; lines: 1;}' \
    -theme-str 'element-text {horizontal-align: 0.5;}' \
    -theme-str 'textbox {horizontal-align: 0.5;}' \
    -theme ./performance.rasi \
    -dmenu \
    -selected-row $index # <-- aquí se marca el perfil activo
)

case ${perfil} in
$performance)
  powerprofilesctl set performance
  brightnessctl set 96000
  notify-send -u normal "Perfil de energía" "Cambiado a PERFORMANCE" -t 3000 -i /home/mich/.config/rofi/scripts/performance-svgrepo-com.svg
  ;;
$powersaver)
  powerprofilesctl set power-saver
  brightnessctl set 10
  notify-send -u normal "Perfil de energía" "Cambiado a POWER-SAVER" -t 3000 -i /home/mich/.config/rofi/scripts/performance-svgrepo-com.svg
  ;;
$balanced)
  powerprofilesctl set balanced
  brightnessctl set 45000
  notify-send -u normal "Perfil de energía" "Cambiado a BALANCED" -t 3000 -i /home/mich/.config/rofi/scripts/performance-svgrepo-com.svg
  ;;
esac

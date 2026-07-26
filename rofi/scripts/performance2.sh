#! /bin/bash

performance=''
balanced=''
powersaver=''

perfil=$(
  echo -e "$performance\n$powersaver\n$balanced" | rofi -theme-str 'window {location: north; fullscreen: false; width: 750px;}' \
    -theme-str 'mainbox {orientation: horizontal; children: [ "message", "listview" ];}' \
    -theme-str 'listview {columns: 3; lines: 1;}' \
    -theme-str 'element-text {horizontal-align: 0.5;}' \
    -theme-str 'textbox {horizontal-align: 0.5;}' \
    -theme ./performance.rasi \
    -dmenu
)

case ${perfil} in
$performance)
  powerprofilesctl set performance
  brightnessctl set 96000
  echo $perfil
  notify-send -u normal "Perfil de energía" "Cambiado a PERFORMANCE" -t 3000 -i /home/mich/.config/rofi/scripts/performance-svgrepo-com.svg
  ;;
$powersaver)
  powerprofilesctl set power-saver
  brightnessctl set 10
  echo $perfil
  notify-send -u normal "Perfil de energía" "Cambiado a POWER-SAVER" -t 3000 -i /home/mich/.config/rofi/scripts/performance-svgrepo-com.svg
  ;;
$balanced)
  powerprofilesctl set balanced
  brightnessctl set 45000
  echo $perfil
  notify-send -u normal "Perfil de energía" "Cambiado a BALANCED" -t 3000 -i /home/mich/.config/rofi/scripts/performance-svgrepo-com.svg
  ;;

esac

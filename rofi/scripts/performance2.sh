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
  brightnessctl set 90000
  echo $perfil
  ;;
$powersaver)
  powerprofilesctl set power-saver
  brightnessctl set 10
  echo $perfil
  ;;
$balanced)
  powerprofilesctl set balanced
  brightnessctl set 45000
  echo $perfil
  ;;

esac

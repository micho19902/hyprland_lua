#! /bin/bash

cd ~
cp .config/hypr .config/yazi .config/waybar .config/rofi .config/dunst .config/swaync .config/wall-engine .config/fish Documents/hyprland/ -rfv
cd Documents/hyprland
git add .
git commit -m '$1'
git push origin main

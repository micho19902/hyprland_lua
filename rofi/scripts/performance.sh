#!/usr/bin/env bash

# =========================================================
# Script para cambiar perfiles de energía con Rofi
# =========================================================

# --- Configuración ---
# THEME_DIR="$HOME/.config/rofi/themes"
# THEME_FILE="power-profile.rasi"
# THEME_PATH="$THEME_DIR/$THEME_FILE"

# Verificar que power-profiles-daemon esté instalado
if ! command -v powerprofilesctl &>/dev/null; then
  notify-send -u critical "Error" "power-profiles-daemon no está instalado"
  exit 1
fi

# Obtener el perfil actual
CURRENT=$(powerprofilesctl get 2>/dev/null)
if [ -z "$CURRENT" ]; then
  notify-send -u critical "Error" "No se pudo obtener el perfil actual"
  exit 1
fi

# Definir perfiles, iconos y descripciones
declare -A PROFILES=(
  ["performance"]=" | Rendimiento máximo"
  ["balanced"]=" | Equilibrado"
  ["power-saver"]=" | Ahorro de energía"
)

# Construir la lista para Rofi
MENU_ITEMS=""
for profile in "${!PROFILES[@]}"; do
  IFS='|' read -r icon desc <<<"${PROFILES[$profile]}"
  if [ "$profile" == "$CURRENT" ]; then
    MENU_ITEMS+=" $icon $desc|$profile\n" # Marcar el activo
  else
    MENU_ITEMS+="  $icon $desc|$profile\n"
  fi
done

MENU_ITEMS="${MENU_ITEMS%\\n}"
# Mostrar Rofi y capturar selección
# -dmenu: modo de selección
# -p: prompt
# -theme: ruta al tema
SELECTED=$(echo -e "$MENU_ITEMS" | rofi -dmenu -i -p "Perfil de energía: " -theme ./performance.rasi | awk -F'|' '{print $2}')

# Si se seleccionó un perfil y es diferente al actual, cambiarlo
if [ -n "$SELECTED" ] && [ "$SELECTED" != "$CURRENT" ]; then
  powerprofilesctl set "$SELECTED"
  if [ "$SELECTED" == "power-saver" ]; then
    brightnessctl set 100
  elif
    [ "$SELECTED" == "balanced" ]
  then
    brightnessctl set 45000
  else
    brightnessctl set 96000
  fi
  notify-send -u normal "Perfil de energía" "Cambiado a $SELECTED" -t 3000
fi

#!/usr/bin/env bash
# Script para instalar paquetes desde listas generadas con pacman -Qqe

set -e # Detiene el script si ocurre algún error

echo "Actualizando el sistema..."
sudo pacman -Syu --needed --noconfirm

echo "Instalando paquetes desde los repositorios oficiales..."
# Lee la lista de paquetes y los instala
sudo pacman -S --needed --noconfirm - <~/pkglist-repo.txt

echo "Instalando paquetes desde el AUR..."
# Lee la lista de paquetes del AUR y los instala con yay
# Asegúrate de que yay esté instalado antes de ejecutar esta parte
yay -S --needed --noconfirm - <~/pkglist-aur.txt

echo "¡Instalación completada!"

#!/bin/bash

echo -e "# Yay installation, configuration and packages install"
sudo pacman -S --needed --noconfirm base-devel
git clone $YAY_URL $YAY_DIR
cd $YAY_DIR
makepkg -si --noconfirm
cd $AKIRA_DIR_PATH
rm -rf $YAY_DIR

yay -Y --gendb
yay -S --noconfirm \
  minecraft-launcher \
  onlyoffice-bin \
  tokyonight-gtk-theme-git \
  wofi-emoji \
  calcure \
  eilmeldung \
  hplip-plugin

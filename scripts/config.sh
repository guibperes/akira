#!/bin/bash

source "$AKIRA_DIR_PATH/scripts/link.sh"

echo -e "# Copying root files with sudo"
sudo cp -r $AKIRA_CONFIG_PATH/sleep.conf.d /etc/systemd
sudo cp $AKIRA_CONFIG_PATH/ly.ini /etc/ly/config.ini

echo -e "# Applying configurations"
sudo usermod -aG docker $USER
sudo chsh -s /bin/fish $USER
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
swww img $AKIRA_DIR_PATH/assets/akira_wallpaper.jpg
xdg-user-dirs-update
xdg-user-dirs-gtk-update
fc-cache

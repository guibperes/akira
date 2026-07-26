#!/bin/bash

echo -e "# Copying root files with sudo"
sudo cp -r $AKIRA_CONFIG_PATH/sleep.conf.d /etc/systemd
sudo cp $AKIRA_CONFIG_PATH/ly.ini /etc/ly/config.ini

echo -e "# LazyVim install"
git clone git@github.com:guibperes/akira-lazyvim.git $AKIRA_CONFIG_PATH/nvim

echo -e "# Applying configurations"
sudo usermod -aG docker $USER
sudo chsh -s /bin/fish $USER

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
gsettings set org.gnome.desktop.interface font-name 'JetBrains Mono 11'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
sudo flatpak override --filesystem=xdg-config/gtk-4.0

swww img $AKIRA_DIR_PATH/assets/akira_wallpaper.jpg
xdg-user-dirs-update
xdg-user-dirs-gtk-update
fc-cache

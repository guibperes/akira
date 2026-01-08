#!/bin/bash

echo -e "# Copying configuration files"
mkdir -p $HOME/Pictures/wallpapers $HOME_CONFIG_PATH/systemd

cp -r \
  $AKIRA_CONFIG_PATH/calcure \
  $AKIRA_CONFIG_PATH/dunst \
  $AKIRA_CONFIG_PATH/fastfetch \
  $AKIRA_CONFIG_PATH/fish \
  $AKIRA_CONFIG_PATH/hypr \
  $AKIRA_CONFIG_PATH/kanshi \
  $AKIRA_CONFIG_PATH/kitty \
  $AKIRA_CONFIG_PATH/mpv \
  $AKIRA_CONFIG_PATH/spotify-player \
  $AKIRA_CONFIG_PATH/waybar \
  $AKIRA_CONFIG_PATH/wofi \
  $AKIRA_CONFIG_PATH/xdg-desktop-portal \
  $AKIRA_CONFIG_PATH/starship.toml \
  $HOME_CONFIG_PATH

cp -r $AKIRA_CONFIG_PATH/ssh $HOME/.ssh
cp -r $AKIRA_CONFIG_PATH/systemd/user $HOME_CONFIG_PATH/systemd

cp $AKIRA_CONFIG_PATH/.XCompose $HOME/.XCompose
cp $AKIRA_DIR_PATH/assets/akira_wallpaper.jpg $HOME/Pictures/wallpapers

echo -e "# Copying root files with sudo"
sudo cp -r $AKIRA_CONFIG_PATH/systemd/sleep.conf.d /etc/systemd

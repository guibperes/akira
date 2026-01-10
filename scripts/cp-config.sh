#!/bin/bash

echo -e "# Copying configuration files"
mkdir -p $HOME/Pictures/wallpapers

cp -r $AKIRA_CONFIG_PATH/home_config $HOME_CONFIG_PATH
cp -r $AKIRA_CONFIG_PATH/ssh $HOME/.ssh

cp $AKIRA_CONFIG_PATH/.XCompose $HOME/.XCompose
cp $AKIRA_DIR_PATH/assets/akira_wallpaper.jpg $HOME/Pictures/wallpapers

echo -e "# Copying root files with sudo"
sudo cp -r $AKIRA_CONFIG_PATH/sleep.conf.d /etc/systemd

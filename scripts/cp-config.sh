#!/bin/bash

echo -e "# Copying configuration files"
mkdir -p $HOME/Pictures/wallpapers $HOME_CONFIG_PATH/systemd

cp -r $AKIRA_CONFIG_PATH/home_config $HOME_CONFIG_PATH

cp -r $AKIRA_CONFIG_PATH/ssh $HOME/.ssh
cp -r $AKIRA_CONFIG_PATH/systemd/user $HOME_CONFIG_PATH/systemd
cp $AKIRA_CONFIG_PATH/.XCompose $HOME/.XCompose
cp $AKIRA_DIR_PATH/assets/akira_wallpaper.jpg $HOME/Pictures/wallpapers

echo -e "# Copying root files with sudo"
sudo cp -r $AKIRA_CONFIG_PATH/systemd/sleep.conf.d /etc/systemd

#!/bin/bash

echo -e "# Copying configuration files"
mkdir -p $HOME/Pictures/wallpapers

cp -r $AKIRA_CONFIG_PATH/home_config/. $HOME_CONFIG_PATH
cp -r $AKIRA_CONFIG_PATH/ssh $HOME/.ssh

cp $AKIRA_CONFIG_PATH/.XCompose $AKIRA_CONFIG_PATH/.gitconfig $HOME
cp $AKIRA_DIR_PATH/assets/akira_wallpaper.jpg $HOME/Pictures/wallpapers

echo -e "# Copying root files with sudo"
sudo cp -r $AKIRA_CONFIG_PATH/sleep.conf.d /etc/systemd

echo -e "# Applying configurations"
sudo usermod -aG docker $USER
sudo chsh -s /bin/fish $USER
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
kitten themes --reload-in all Akira
xdg-user-dirs-update
xdg-user-dirs-gtk-update
fc-cache

#!/bin/bash

echo -e "# Copying configuration files"
cp -r $AKIRA_CONFIG_PATH/home_config/. $HOME_CONFIG_PATH
cp -r \
  $AKIRA_CONFIG_PATH/.gnupg \
  $AKIRA_CONFIG_PATH/.XCompose \
  $HOME

sed -i \
  "1i @import url(\"$HOME_CONFIG_PATH/akira_style/style.css\");" \
  $HOME_CONFIG_PATH/wofi/style.css

echo -e "# Copying root files with sudo"
sudo cp -r $AKIRA_CONFIG_PATH/sleep.conf.d /etc/systemd
sudo cp $AKIRA_CONFIG_PATH/ly.ini /etc/ly/config.ini

echo -e "# Applying configurations"
sudo usermod -aG docker $USER
sudo chsh -s /bin/fish $USER
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
kitten themes --reload-in all Akira
swww img $AKIRA_DIR_PATH/assets/akira_wallpaper.jpg
xdg-user-dirs-update
xdg-user-dirs-gtk-update
fc-cache

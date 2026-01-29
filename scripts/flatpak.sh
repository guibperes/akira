#!/bin/bash

echo -e "# Flatpak installation"
flatpak install --noninteractive -y flathub \
  org.gtk.Gtk3theme.Adwaita-dark \
  io.github.flattool.Warehouse \
  com.valvesoftware.Steam \
  com.github.Matoking.protontricks \
  com.discordapp.Discord \
  org.gimp.GIMP \
  md.obsidian.Obsidian \
  org.localsend.localsend_app

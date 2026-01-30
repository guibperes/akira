#!/bin/bash

echo -e "# Systemctl enable and starting services"
sudo systemctl enable --now \
  docker \
  iwd \
  avahi-daemon \
  avahi-dnsconfd

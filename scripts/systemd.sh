#!/bin/bash

echo -e "# Systemctl enable and starting services"
sudo systemctl enable --now \
  bluetooth \
  docker \
  cups \
  iwd \
  avahi-daemon \
  avahi-dnsconfd \
  NetworkManager

systemctl --user enable --now ssh-agent.service

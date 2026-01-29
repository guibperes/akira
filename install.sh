#!/bin/bash
# Akira distro installation script

echo -e "# Starting Akira installation script"
source ~/.akira/scripts/env.sh
source $AKIRA_DIR_PATH/scripts/pacman-remove.sh
source $AKIRA_DIR_PATH/scripts/pacman-install.sh
source $AKIRA_DIR_PATH/scripts/yay.sh
source $AKIRA_DIR_PATH/scripts/flatpak.sh
source $AKIRA_DIR_PATH/scripts/config.sh
source $AKIRA_DIR_PATH/scripts/systemd.sh
echo -e "# Finished Post installation script"

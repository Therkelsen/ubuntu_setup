#!/bin/bash

# fully update system and remove unused packages, before installing new ones
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt autoclean
sudo deborphan | xargs sudo apt -y remove --purge
sudo snap refresh

# firewall
sudo ufw enable
# ftp
sudo ufw allow 21
# ssh
sudo ufw allow 22
# jellyfin
sudo ufw allow 8096

sudo apt install curl -y
# jellyfin
curl https://repo.jellyfin.org/install-debuntu.sh | sudo bash

# ftp
sudo apt install vsftp -y

# power management
sudo apt install tlp -y
# start power management and enable it on startup
sudo tlp-start

# nvidia drivers ppa
sudo add-apt-repository ppa:graphics-drivers/ppa
# update drivers
sudo ubuntu-drivers autoinstall

sudo apt install htop -y
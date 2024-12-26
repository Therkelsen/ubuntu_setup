#!/bin/bash

# Update and upgrade the system
sudo apt-fast update
sudo apt-fast full-upgrade -y
sudo apt-fast autoremove -y
sudo apt-fast autoclean
sudo deborphan | xargs sudo apt-fast -y remove --purge

# Refresh snaps
sudo snap refresh

# Remove unused flatpaks
flatpak uninstall --unused -y

# Check if the -ven parameter is passed
if [[ "$1" == "-ven" ]]; then
    echo "Installing Vencord..."
    sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
else
    echo "Skipping Vencord installation. Pass -ven to install it."
fi

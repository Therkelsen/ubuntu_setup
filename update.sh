#!/bin/bash

if ! command -v apt-fast &> /dev/null; then
    echo "apt-fast is not installed. Installing it now..."
    # Add the apt-fast repository
    sudo add-apt-repository -y ppa:apt-fast/stable
    # Update the package list
    sudo apt-get update
    # Install apt-fast
    sudo apt-get -y install apt-fast
    echo "apt-fast has been installed successfully."
else
    echo "apt-fast is already installed."
fi

if ! command -v curl &> /dev/null; then
     echo "curl is not installed. Installing it now..."
     sudo apt install curl
     echo "curl has been installed successfully."
else
     echo "curl is already installed."
fi

if dpkg-query -l jellyfin &> /dev/null; then
    # Hold Jellyfin package to prevent it from being updated
    sudo apt-mark hold jellyfin
fi

# Update and upgrade the system
sudo apt-fast update
sudo apt-fast full-upgrade -y
sudo apt-fast autoremove -y
sudo apt-fast autoclean
sudo deborphan | xargs sudo apt-fast -y remove --purge

# Refresh snaps
sudo snap refresh

# Remove unused flatpaks
sudo flatpak uninstall --unused -y

# Check if the -ven parameter is passed
if [[ "$1" == "-ven" ]]; then
    echo "Installing Vencord..."
    sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
else
    echo "Skipping Vencord installation. Pass -ven to install it."
fi

if dpkg-query -l jellyfin &> /dev/null; then
    # Unhold Jellyfin package to allow updates again
    sudo apt-mark unhold jellyfin
fi

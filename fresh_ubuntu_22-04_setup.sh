#!/bin/bash

# Update the apt package
sudo apt-get update
# Install apt requirements
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
# Add docker key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Add Docker repo
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# Update package index and install Docker CE
sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io
# Add user to docker group
sudo usermod -aG docker $USER
# Restart docker to apply the changes
sudo systemctl restart docker

sudo apt install git

while true; do
    read -p "Input your git email: " em
    if [ -n "$em" ]; then
        git config --global user.email "$em"
        break
    else
        echo "Email cannot be empty. Please try again."
    fi
done

while true; do
    read -p "Input your git username: " un
    if [ -n "$un" ]; then
        git config --global user.name "$un"
        break
    else
        echo "Username cannot be empty. Please try again."
    fi
done

#Generate a private and public ssh rsa key pair, and enter passphrase when prompted
ssh-keygen -t ed25519
# Press enter to save at default location
# Add the key to ssh-agent if you don't want to type your password each time you use the key
eval 'ssh-agent'
# Add key to agent
ssh-add ~/.ssh/id_ed25519
# Print out public key
echo "Copy the following output, go to your Github settings > SSH/GPG Keys > add a new SSH key > paste key into Content. Key name will automatically be generated."
cat ~/.ssh/id_ed25519.pub

#!/bin/bash
echo "Press any key to continue"
while [ true ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
exit ;
else
echo "Waiting for the keypress"
fi
done

# Installing python3 and pip
sudo apt install python3
sudo apt-get install -y python3-pip

# Install gnome-tweaks
sudo apt install gnome-tweaks -y
# Install dconf-editor
sudo apt install dconf-editor -y
# Install solarr
sudo apt install solaar -y
# Install grub-customizer
sudo apt install grub-customizer -y
# Install google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt install qtcreator build-essential qt5-default qt5-doc qt5-doc-html qtbase5-doc-html qtbase5-examples
# Install prospect mail / outlook client
sudo snap install prospect-mail
# Install vscode insiders edition
sudo snap install code --insiders

# Git aliases to speed up workflow
echo 'alias gfr="git fetch && git rebase origin/develop --autostash"' >> ~/.bashrc
echo 'alias gr="git rebase"' >> ~/.bashrc
echo 'alias gl="git log --oneline -n"' >> ~/.bashrc
echo 'alias gb="git branch"' >> ~/.bashrc
echo 'alias gcn="git checkout -b "' >> ~/.bashrc
echo 'alias gce="git checkout "' >> ~/.bashrc
echo 'alias grh="git reset --hard"' >> ~/.bashrc
echo 'alias gcp="git cherry-pick "' >> ~/.bashrc

# Re-source bashrc
. ~/.bashrc

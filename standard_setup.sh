#!/bin/bash

# Add multiverse repository
sudo add-apt-repository multiverse

# Add Docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# apt fast
sudo add-apt-repository ppa:apt-fast/stable
sudo apt update
sudo apt -y install apt-fast

# prerequisites
sudo apt install -y apt-transport-https ca-certificates containerd.io curl curl docker-ce docker-ce-cli duf flatpak git gnome-software-plugin-flatpak gnupg-agent gpg python3 python3-dev python3-pip python3-setuptools software-properties-common

# flatpak things
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.discordapp.Discord -y
# Vencord
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"

# Brave
curl -fsS https://dl.brave.com/install.sh | sh

# VS Code Insiders
sudo snap install code-insiders --classic -y

# fzf
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install
wget https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.bash & wget https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.bash & wget https://github.com/junegunn/fzf/releases/download/v0.65.2/fzf-0.65.2-linux_amd64.tar.gz
tar -xzf fzf-0.65.2-linux_amd64.tar.gz & sudo mv fzf /usr/local/bin/
source ~/key-bindings.bash 
source ~/completion.bash

# The Fuck
# pip3 install thefuck --user
# echo 'eval $(thefuck --alias)' >> ~/.bashrc

# eza
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
echo 'alias ls="eza -F --hyperlink"' >> ~/.bashrc
# eza theme
git clone https://github.com/eza-community/eza-themes.git
mkdir -p ~/.config/eza
ln -sf "$(pwd)/eza-themes/themes/one_dark.yml" ~/.config/eza/theme.ym

# duf
echo 'alias df="duf --sort size --hide special"' >> ~/.bashrc

# Gnome stuff
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'

# Docker stuff
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo usermod -aG docker $USER
sudo systemctl restart docker

# Git setup
git config --global credential.helper store
git config --global user.name "Therkelsen"
git config --global user.email "thomastherkelsen191200@gmail.com"
ssh-keygen -t ed25519
eval 'ssh-agent'
ssh-add ~/.ssh/id_ed25519
echo -e 'Here is your SSH public key (Copy it and paste into GitHub under SSH and GPG keys):\n'
cat ~/.ssh/id_ed25519.pub

# Python stuff
sudo apt-get install -y python3-pip

# Git aliases to speed up workflow
echo 'alias gfr="git fetch && git rebase origin/develop --autostash"' >> ~/.bashrc
echo 'alias gr="git rebase"' >> ~/.bashrc
echo 'alias gl="git log --oneline -n"' >> ~/.bashrc
echo 'alias gb="git branch"' >> ~/.bashrc
echo 'alias gcn="git checkout -b "' >> ~/.bashrc
echo 'alias gce="git checkout "' >> ~/.bashrc
echo 'alias grh="git reset --hard"' >> ~/.bashrc
echo 'alias gcp="git cherry-pick "' >> ~/.bashrc
echo 'alias gp="git push "' >> ~/.bashrc
echo 'alias gpf="git push -f "' >> ~/.bashrc

echo -e 'Go ahead and run:\n$ . ~/.bashrc'

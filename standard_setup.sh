#!/bin/bash

# apt fast
sudo add-apt-repository ppa:apt-fast/stable
sudo apt-get update
sudo apt-get -y install apt-fast

# prerequisites
sudo apt install -y gpg python3-dev python3-pip python3-setuptools curl

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# The Fuck
pip3 install thefuck --user
echo 'eval $(thefuck --alias)' >> ~/.bashrc

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
sudo apt install -y duf
echo 'alias df="duf --sort size --hide special"' >> ~/.bashrc

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

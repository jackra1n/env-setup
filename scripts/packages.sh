#!/bin/bash

sudo dnf install zsh
sudo dnf install zsh-autosuggestions
sudo dnf install zsh-syntax-highlighting

sh -c "$(curl -fsSL https://starship.rs/install.sh)"

curl -LsSf https://astral.sh/uv/install.sh | sh
curl https://pyenv.run | bash
sudo dnf install btop
sudo dnf install fastfetch
sudo dnf install rsync

sudo wget "https://github.com/Mikescher/better-docker-ps/releases/latest/download/dops_linux-amd64-static" -O "/usr/local/bin/dops" && sudo chmod +x "/usr/local/bin/dops"

# Install docker
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#!/bin/bash

sudo dnf install zsh -y
sudo dnf install zsh-autosuggestions -y
sudo dnf install zsh-syntax-highlighting -y

sh -c "$(curl -fsSL https://starship.rs/install.sh)"

curl -LsSf https://astral.sh/uv/install.sh | sh
curl https://pyenv.run | bash
sudo dnf install fastfetch -y
sudo dnf install rsync -y
sudo dnf install flameshot -y
# On Gnome + Wayland requires a shortcut like:
# $ script --command "QT_QPA_PLATFORM=wayland flameshot gui" /dev/null

sudo wget "https://github.com/Mikescher/better-docker-ps/releases/latest/download/dops_linux-amd64-static" -O "/usr/local/bin/dops" && sudo chmod +x "/usr/local/bin/dops"
sudo wget "https://github.com/aristocratos/btop/releases/latest/download/btop-x86_64-linux-musl.tbz" -O "/tmp/btop.tbz"
sudo tar -xjvf /tmp/btop.tbz -C /tmp
sudo mv /tmp/btop/bin/btop /usr/local/bin

# Install docker
sudo dnf install dnf-plugins-core -y
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

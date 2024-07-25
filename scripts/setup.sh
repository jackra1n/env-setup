#!/bin/bash
#
# This script is meant for Fedora
#

sudo dnf install zsh

# Get gnome-terminal to use zsh
DEFAULT_PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default)
DEFAULT_PROFILE=${DEFAULT_PROFILE:1:-1}
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$DEFAULT_PROFILE/" use-custom-command true
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$DEFAULT_PROFILE/" custom-command '/bin/zsh'

# Copy the .zshrc file
cp ../.zshrc ~/.zshrc

# Copy .zsh folder
cp -r ../.zsh ~/

# Install starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# Copy files from .config
cp -r ../.config ~/

# Install zsh plugins
sudo dnf install zsh-autosuggestions zsh-syntax-highlighting

# Download and install Miracode font
curl -L https://github.com/IdreesInc/Miracode/releases/latest/download/Miracode.ttf -o /tmp/Miracode.ttf
sudo mv /tmp/Miracode.ttf /usr/share/fonts/

# Download and install Monocraft font
curl -L https://github.com/IdreesInc/Monocraft/releases/latest/download/Monocraft-nerd-fonts-patched.ttf -o /tmp/Monocraft-nerd-fonts-patched.ttf
sudo mv /tmp/Monocraft-nerd-fonts-patched.ttf /usr/share/fonts/
fc-cache -f -v

# Set Miracode as the default font in gnome-terminal
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$DEFAULT_PROFILE/" use-system-font false
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$DEFAULT_PROFILE/" font 'Monocraft Nerd Font 12'

# Install packages
./packages.sh
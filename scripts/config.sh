#!/bin/bash

# Get gnome-terminal to use zsh
DEFAULT_PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default)
DEFAULT_PROFILE=${DEFAULT_PROFILE:1:-1}
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$DEFAULT_PROFILE/" use-custom-command true
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$DEFAULT_PROFILE/" custom-command '/bin/zsh'

cp -r config-files/. ~

# Download and install Monocraft font
curl -L https://github.com/IdreesInc/Monocraft/releases/latest/download/Monocraft-nerd-fonts-patched.ttc -o /tmp/Monocraft-nerd-fonts-patched.ttc
sudo mv /tmp/Monocraft-nerd-fonts-patched.ttc /usr/share/fonts/
fc-cache -f -v

# Set Monocraft as the default font in gnome-terminal
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$DEFAULT_PROFILE/" use-system-font false
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$DEFAULT_PROFILE/" font 'Monocraft Nerd Font 12'


gsettings set org.gnome.desktop.input-sources show-all-sources true

#!/bin/bash

# Add vscode repo and install vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf check-update
sudo dnf install code

flatpak install io.github.zen_browser.zen -y
flatpak install dev.vencord.Vesktop -y
flatpak install com.axosoft.GitKraken -y
flatpak install org.signal.Signal -y
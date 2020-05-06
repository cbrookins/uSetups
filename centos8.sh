#! /bin/bash
## My CentOS 8 install

##
## Update system and install packages
##
echo "Updating system..."
sudo dnf -y update
clear

## Enable snapd
sudo systemctl enable --now snapd.socket
## Enable classic snap support
sudo ln -s /var/lib/snapd/snap /snap

clear

echo "Adding Microsoft repos"
## Register Visual Studio Code repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

## Register the Microsoft RedHat repository
curl https://packages.microsoft.com/config/rhel/8/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo

clear

echo "Installing software..."
## Install PowerShell, VSCode
sudo dnf -y check-update
sudo dnf -y install git epel-release virt-manager snapd code powershell 
clear

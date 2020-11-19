#! /bin/bash
## My Fedora 33 install

##
## Update system and install packages
##
echo "Updating system..."
sudo dnf -y update

clear

echo "Adding RPM Fusion repos"
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

clear

echo "Adding Microsoft repos"
## Register Visual Studio Code repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

## Register the Microsoft RedHat repository
curl https://packages.microsoft.com/config/fedora/33/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo
curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo

clear

echo "Installing software..."
sudo dnf -y check-update
sudo dnf -y install code kernel-devel broadcom-wl compat-openssl10 seahorse gtkhash ffmpeg ffmpeg-libs vlc fuse-exfat exfat-utils peek powershell

clear

## Enable BCM43228 WiFi Card
echo "Prepping WiFi Kernel Module.."
git clone https://github.com/antoineco/broadcom-wl
dkms add ./broadcom-wl

clear

## PIA Client
echo "Setting up PIA"
wget https://www.privateinternetaccess.com/openvpn/openvpn-nextgen.zip
unzip openvpn-nextgen.zip
nmcli connection import type openvpn file ./Netherlands.ovpn

clear

echo "Complete.  Rebooting in 10s..."
sleep 10
reboot

#! /bin/bash
## Custom i3 install for Ubuntu minimal

##
## Update system and install packages
##
echo "Updating system and installing wanted packages"
sudo apt update && sudo apt install -y i3 xinit xterm feh nano git wpagui mutt weechat ranger firefox wireless-tools fonts-font-awesome
clear

##
## Clone git repo
##
echo "Downloading dotfiles"
git clone https://github.com/cbrookins/dotfiles
clear

##
## Copy custom configs
##
echo "Setting up dotfiles"
## cp dotfiles/.muttrc
cp -R dotfiles/.config ~/
cp dotfiles/.Xresources ~/.Xresources
cp /etc/skel/.bashrc ~/.bashrc
cp /etc/X11/xinit/xinitrc ~/.xinitrc
clear

##
## Set up feh startup
##
echo "# sh ~/.fehbg &" >> ~/.xinitrc

#! /bin/bash
## Custom i3 install for Fedora 33 minimal

##
## Update system and install packages
##
echo "Updating system and installing wanted packages"
sudo dnf update && sudo dnf install -y i3 xinit xfce4-terminal feh nano git mutt weechat ranger firefox xorg-x11-server-Xorg
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
echo "exec /usr/bin/i3" >> ~/.xinitrc
echo "# sh ~/.fehbg &" >> ~/.xinitrc

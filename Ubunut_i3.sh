#! /bin/bash
## Custom i3 install for Ubuntu minimal

##
## Update system and install packages
##
sudo apt-get update && sudo apt-get install -y i3 xinit xterm feh nano git wpaguig mutt weechat ranger firefox chromium-browser freerdp tigervnc turses fonts-font-awesome >> /dev/null

##
## Clone git repo
##
git clone https://github.com/cbrookins/dotfiles


##
## Copy custom configs
##
## cp dotfiles/.muttrc
cp -R dotfiles/.config ~/.config
cp dotfiles/.bashrc ~/.bashrc
cp dotfiles/.Xresources ~/.Xresources

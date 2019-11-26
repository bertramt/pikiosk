#!/bin/bash
# This install script is using some code from https://github.com/flipsidecreations/dotfiles

# Check if vim-addon installed, if not, install it automatically
#if hash vim-addon  2>/dev/null; then
    #echo "vim-addon (vim-scripts)  installed"
#else
    #echo "vim-addon (vim-scripts) not installed, installing"
    #sudo apt update && sudo apt -y install vim-scripts
#fi

sudo apt update && sudo apt upgrade -y
sudo apt install -y xinit xserver-xorg chromium-browser htop numlockx tmux

while true; do
    read -p "Do you wish to install extra RPi-Mon package?" yn
    case $yn in
        [Yy]* ) sudo wget http://goo.gl/vewCLL -O /etc/apt/sources.list.d/rpimonitor.list;  sudo apt install -y dirmngr;sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2C0D3C0F;sudo apt update && sudo apt install -y rpimonitor;sudo /etc/init.d/rpimonitor update;break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo ""
echo "Apt installs complete"
echo ""

# Find all dot files then if the original file exists, create a backup
# Once backed up to {file}.dtbak symlink the new dotfile in place
for file in $(find . -maxdepth 1 -name ".*" -type f  -printf "%f\n" ); do
    if [ -e ~/$file ]; then
        mv -f ~/$file{,.dtbak}
    fi
    ln -s $PWD/$file ~/$file
done

echo ""
echo "Installed Please Reboot"
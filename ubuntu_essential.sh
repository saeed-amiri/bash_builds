#! /bin/bash

# Install essential packages
echo "Installing essential packages"

sudo apt update
sudo apt install build-essential git curl wget unzip \
                              make libmpfr-dev libgmp3-dev libmpc-dev -y
sudo apt install flex bison build-essential libelf-dev linux-headers-$(uname -r) -y
sudo apt install rustc cargo

sudo apt autoremove -y
sudo apt autoclean -y                        

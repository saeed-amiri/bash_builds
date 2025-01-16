# /bin/bash

sudo apt update

# Install QEMU
echo yes | sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager

# Enable and start libvirtd
sudo systemctl enable --now libvirtd

# Print in red color
echo -e "\e[31m"
echo "Please reboot your system to complete the installation"
echo -e "\e[0m"

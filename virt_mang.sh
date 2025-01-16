# /bin/bash

sudo apt update

# Install QEMU
echo yes | sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager

# Enable and start libvirtd
sudo systemctl enable --now libvirtd
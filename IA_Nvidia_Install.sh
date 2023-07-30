#!/bin/bash

# Check if the user is running the script with root privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run with root privileges. Please use sudo or run as root."
    exit 1
fi

# Check if the system has a compatible Nvidia GPU
lspci | grep -i nvidia
if [[ $? -ne 0 ]]; then
    echo "No Nvidia GPU found on the system. Aborting installation."
    exit 1
fi

# Add RPM Fusion repository (provides Nvidia driver packages)
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install necessary packages for building the kernel module (dkms) and the Nvidia driver
dnf install -y dkms gcc kernel-devel akmod-nvidia

# Enable and start the DKMS service
systemctl enable dkms
systemctl start dkms

# Reboot the system to load the new Nvidia driver
echo "Installation completed successfully. Rebooting the system to load the new Nvidia driver..."
reboot

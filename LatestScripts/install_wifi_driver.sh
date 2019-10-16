#!/bin/bash

# Install WiFi Drivers

sudo apt-get install -y build-essential

# Download the Iwlwifi-Firmware.git repository
git clone git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
cd linux-firmware
sudo cp iwlwifi-* /lib/firmware/
cd ..

# Download the Backport-Iwlwifi.git repository
git clone https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/backport-iwlwifi.git
cd backport-iwlwifi
sudo make defconfig-iwlwifi-public
sudo make -j4
sudo make install
update-initramfs -u
sudo reboot
# on kernel update do sudo make install again


#!/bin/bash

pushd .
cd ~

# Copy over files from backup
#
pushd .
cd ~/Documents
# Insert command to copy files from backup
popd

# Install Git and set Git's user and email attributes so that code can be checked in if needed
#
# Note this section isn't needed because to run this script, the repository would have had to be cloned.
pushd .
cd ~/Code
#sudo apt install git
#git config --global user.name stan
#git config --global user.email stan@myman99
#mkdir Code
#cd Code
# 
# git clone https://github.com/stanmyman99/setup
cp setup/.bash_aliases ~
popd

# Build and install the veracrypt command line
#
pushd .
mkdir ~/Apps/veracrypt
cd ~/Apps/veracrypt
sudo apt install g++ libfuse-dev pkg-config yasm libwxbase3.0-dev
wget --content-disposition https://github.com/veracrypt/VeraCrypt/archive/refs/tags/VeraCrypt_1.25.9.tar.gz
tar -xvf VeraCrypt-VeraCrypt_1.25.9.tar.gz
cd VeraCrypt-VeraCrypt_1.25.9/src
make NOGUI=1
sudo cp Main/veracrypt /usr/bin
popd

# Setup an encrypted container in Documents
#
pushd .
cd ~/Documents
ln -s /media/veracrypt1 Encrypted
#veracrypt -t -c ~/Documents/Encrypted.vc
#veracrypt ~/Documents/Encrypted.vc /media/veracrypt1
popd

# Baseline shell settings
#
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position LEFT
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.desktop.privacy remove-old-temp-files true
gsettings set org.gnome.desktop.privacy remove-old-trash-files true
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.nautilus.preferences show-delete-permanently true
gsettings set org.gnome.nautilus.preferences show-hidden-files true
gsettings set org.gtk.Settings.FileChooser show-hidden true
gsettings set org.gnome.desktop.privacy old-files-age 1
gsettings set org.gnome.desktop.notifications show-banners false
gsettings set org.gnome.desktop.interface show-battery-percentage true
sudo service bluetooth stop
#gsettings set org.gnome.shell favorite-apps []
#gsettings set org.gnome.shell favorite-apps "['org.mozilla.firefox', 'org.gnome.Terminal.desktop', 'mullvadvpn.desktop', 'org.keepassxc.KeePassXC', 'org.standardnotes.standardnotes.desktop', 'org.onlyoffice.desktopeditors.desktop', 'org.electrum.electrum.desktop', 'org.freefilesync.FreeFileSync.desktop', 'org.gnome.gedit.desktop', 'org.gnome.Calculator.desktop', 'bleachbit-root.desktop', 'gnome-control-center.desktop']"

# Install the app frameworks. We'll use flatpak as our preferred installer.
#
sudo apt install snapd -y
sudo apt install flatpak -y
sudo apt install gnome-software-plugin-flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install the common apps using the best app framework the app supports
#
sudo apt istall keepassxc -y
sudo apt install syncthing -y
sudo apt install multitail tree zoxide trash-cli fzf bash-completion
sudo apt install android-tools-adb -y
flatpak install flathub com.brave.Browser -y
flatpak install flathub com.vscodium.codium -y
flatpak install flathub org.chromium.Chromium -y
flatpak install flathub org.freefilesync.FreeFileSync -y
flatpak install flathub org.freefilesync.FreeFileSync -y
flatpak install flathub org.freefilesync.FreeFileSync -y
flatpak install flathub org.freefilesync.FreeFileSync -y
flatpak install flathub ch.protonmail.protonmail-bridge -y
flatpak install flathub com.github.micahflee.torbrowser-launcher -y
# flatpak install flathub org.keepassxc.KeePassXC -y
# flatpak install flathub org.onlyoffice.desktopeditors -y
# flatpak install flathub org.electrum.electrum -y
# flatpak install flathub ch.protonmail.protonmail-bridge -y
# flatpak install flathub org.standardnotes.standardnotes -y
# flatpak install flathub com.github.micahflee.torbrowser-launcher -y
# flatpak install flathub com.visualstudio.code -y
# sudo apt install bleachbit -y

# Mullvad VPN
#
# Download the Mullvad signing key, Add the Mullvad repository server to apt, and install the package
sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc
echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list
sudo apt update
sudo apt install mullvad-vpn

#  Wrap up
#
popd
echo ' '
echo '------------------------------------------------------------------------------------------------------' 
echo '------------------------------------------------------------------------------------------------------' 
echo 'Provisioning complete, please see ~/Documents/Encrypted/Provision for a few post-provisioning actions'
echo '------------------------------------------------------------------------------------------------------' 
echo '------------------------------------------------------------------------------------------------------' 




#!/bin/bash

echo "# ------------------------------------------------------------------------"
echo "# Gnome configuration"
echo "# ------------------------------------------------------------------------"

if [[ -f ~/.gnomeconfigured ]]; then
    echo "Gnome is already configured"
else
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
    touch ~/.gnomeconfigured
    #sudo service bluetooth stop
    #gsettings set org.gnome.shell favorite-apps []
    #gsettings set org.gnome.shell favorite-apps "['org.mozilla.firefox', 'org.gnome.Terminal.desktop', 'mullvadvpn.desktop', 'org.keepassxc.KeePassXC', 'org.standardnotes.standardnotes.desktop', 'org.onlyoffice.desktopeditors.desktop', 'org.electrum.electrum.desktop', 'org.freefilesync.FreeFileSync.desktop', 'org.gnome.gedit.desktop', 'org.gnome.Calculator.desktop', 'bleachbit-root.desktop', 'gnome-control-center.desktop']"
fi

echo "Completed gnome configuration"
echo " "

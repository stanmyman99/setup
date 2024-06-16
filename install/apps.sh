
#!/bin/bash

echo "# ------------------------------------------------------------------------"
echo "# App installation"
echo "# ------------------------------------------------------------------------"

if [[ -d ~/Apps ]]
then
    echo "~/Apps directory already exists"
else
    mkdir ~/Apps
fi

bash install/helper-apt.sh keepassxc "KeePassXC"
bash install/helper-apt.sh rpi-imager "RPI Imager"

sudo apt install multitail tree zoxide trash-cli fzf bash-completion -y >> ~/.provision.log
bash install/helper-apt.sh android-tools-adb "Android Debugging Tools"

bash install/helper-flatpak.sh com.nextcloud.desktopclient.nextcloud "NextCloud Desktop Client"
bash install/helper-flatpak.sh com.brave.Browser "Brave Browser"
bash install/helper-flatpak.sh com.vscodium.codium "VS Codium"
bash install/helper-flatpak.sh org.chromium.Chromium "Chromium Browser"
bash install/helper-flatpak.sh org.freefilesync.FreeFileSync "FreeFileSync"
bash install/helper-flatpak.sh ch.protonmail.protonmail-bridge  "Proton Mail Bridge"
bash install/helper-flatpak.sh com.github.micahflee.torbrowser-launcher "Tor Browser"

echo "Completed app installation "
echo " "

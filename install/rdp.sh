#!/bin/bash

echo "------------------------------------------------------------------------"
echo " RDP configuration"
echo "------------------------------------------------------------------------"

if [[ -f ~/.rdp ]]; then
    echo "Gnome is already configured"
else
    sudo apt update
    sudo apt install xrdp
    #echo "Update the port to 3389 if needed"
    #sudo nano /etc/xrdp/xrdp.ini
    echo "Check to make sure that port 3389 is configured in /etc/xrdp/xrdp.ini"
    sudo service xrdp start
    sudo systemctl enable xrdp
    sudo ufw allow 3389
    sudo ufw reload
fi

echo "Completed RDP configuration"
echo " "



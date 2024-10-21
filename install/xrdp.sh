#!/bin/bash

echo "------------------------------------------------------------------------"
echo " XRDP Server"
echo "------------------------------------------------------------------------"

sudo apt install xrdp
echo "gnome-session" > ~/.xsession
sudo systemctl enable xrdp
sudo systemctl start xrdp


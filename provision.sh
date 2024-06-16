#!/bin/bash

echo "# ------------------------------------------------------------------------"
echo "# New device provisioing script"
echo "# ------------------------------------------------------------------------"
echo " "

if [[ -f ~/.provision.log ]]
then 
    rm ~/.provision.log
fi

bash install/appframeworks.sh
bash install/softlinks.sh
bash install/veracrypt.sh
bash install/gnome.sh
bash install/bash.sh
bash install/git.sh


#!/bin/bash

echo "# ------------------------------------------------------------------------"
echo "# New device provisioing script"
echo "# ------------------------------------------------------------------------"
echo " "

bash install/bash.sh
bash install/git.sh
bash install/softlinks.sh
bash install/veracrypt.sh


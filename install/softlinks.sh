#!/bin/bash

echo "# ------------------------------------------------------------------------"
echo "# Softlinks"
echo "# ------------------------------------------------------------------------"

# Make the Documents folder be a symbolic link into the Nextcloud folder
#
pushd . > /dev/null

if [[ -h ~/Documents ]]; then
    echo "Documents is already a symbolic link"
else
    echo "Creating the symbolic link for ~/Documents"
    rmdir Documents
    ln -s ~/Nextcloud/Documents ~/Documents
fi

# Set up the veracrypt links
if [[ -h ~/Private ]]; then
    echo "Private is already a symbolic link"
else
    echo "Creating the symbolic link for ~/Private"
    ln -s /media/veracrypt1 ~/Private
fi

popd > /dev/null

echo "Completed softlink configuration"
echo " "


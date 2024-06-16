#!/bin/bash

echo "# ------------------------------------------------------------------------"
echo "# Git configuration"
echo "# ------------------------------------------------------------------------"

if [[ -f ~/.ssh/stangithub ]]; then
    echo "Git is already provisioned"
else
    git config --global user.name stan
    git config --global user.email stan@myman99.com
    ssh-keygen -t ed25519 -C "stan@myman99.com" -f ~/.ssh/stangithub
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/stangithub
fi

echo "Add this key to your github account:"
cat ~/.ssh/stangithub.pub

echo "Completed git configuration"
echo " "



#!/bin/bash

echo "# ------------------------------------------------------------------------"
echo "# Download, compile, and install the veracrypt CLI"
echo "# ------------------------------------------------------------------------"

pushd . > /dev/null

if [[ -f /usr/bin/veracrypt ]]
then
    echo "Veracrypt is already installed"
else
    mkdir ~/Apps/veracrypt >> ~/.provision.log
    cd ~/Apps/veracrypt >> ~/.provision.log

    echo "Installing veracrypt dependencies"
    sudo apt install g++ libfuse-dev pkg-config yasm libwxbase3.0-dev libpcsclite-dev -y >> ~/.provision.log

    echo "Downloading veracrypt..."
    wget https://www.veracrypt.fr/code/VeraCrypt/snapshot/VeraCrypt_1.26.7.tar.gz
    tar -xvf VeraCrypt_1.26.7.tar.gz >> ~/.provision.log

    echo "Compiling veracrypt..."
    cd VeraCrypt_1.26.7/src > /dev/null
    make NOGUI=1 >> ~/.provision.log

    echo "Installing veracrypt..."
    sudo cp Main/veracrypt /usr/bin >> ~/.provision.log
fi

popd > /dev/null

echo "Completed veracrypt installation"
echo " "

# Download and install veracrypt
#
pushd .
mkdir ~/Apps/veracrypt
cd ~/Apps/veracrypt
sudo apt install g++ libfuse-dev pkg-config yasm libwxbase3.0-dev libpcsclite-dev
wget https://www.veracrypt.fr/code/VeraCrypt/snapshot/VeraCrypt_1.26.7.tar.gz
tar -xvf VeraCrypt_1.26.7.tar.gz
cd VeraCrypt_1.26.7/src
make NOGUI=1
sudo cp Main/veracrypt /usr/bin
popd

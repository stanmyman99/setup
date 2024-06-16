if command -v "$1" > /dev/null 2> /dev/null
then
    echo "$2 is already installed"
else
    echo "Installing $2..."
    sudo apt install "$1" -y >> ~/.provision.log 2>> ~/.provision.log
fi
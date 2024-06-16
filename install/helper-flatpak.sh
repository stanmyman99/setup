
flatpak info "$1" > /dev/null 2>> /dev/null
if [ $? -eq 0 ]
then 
    echo "$2 is already installed"
else   
    echo "Installing $2"
    flatpak install --user "$1" -y >> ~/.provision.log
fi


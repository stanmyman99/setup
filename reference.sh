# ---------------------------------------------------------------
# Veracrypt reference
# ---------------------------------------------------------------

# Create a new volume:
#
veracrypt -t -c

# Mount a volume:
#
veracrypt volume.hc /media/veracrypt1

# Mount a volume as read-only, using keyfiles:
#
veracrypt -m ro -k keyfile1,keyfile2 volume.hc

# Mount a volume without mounting its filesystem:
#
veracrypt --filesystem=none volume.hc

# Mount a volume prompting only for its password:
#
veracrypt -t -k "" --pim=0 --protect-hidden=no volume.hc /media/veracrypt1

# Dismount a volume:
#
veracrypt -d volume.hc

# Dismount all mounted volumes:
#
veracrypt -d

# Veracrypt container creation
#
veracrypt -t -c ~/Documents/Encrypted.vc

# Veracrypt mounting
#
veracrypt ~/Documents/Encrypted.vc /media/veracrypt1

# Veracrypt soft linking
#
pushd ~/Documents
ln -s /media/veracrypt1 Encrypted
popd

# ---------------------------------------------------------------
# Git reference
# ---------------------------------------------------------------
# clone a repository
# 
git clone https://github.com/stanmyman99/aliases

# update a repository
# 
git pull

# set email and user name
#
git config --global user.name "Your Name"
git config --global user.email "youremail@yourdomain.com"

# see where a repository came from
#
git remote get-url origin 

# see what changes are uncommitted
#
git status

# commit and push everything that has changed
#
git commit -a -m "Message for the commit"
git push

# add a specific file to the next commit
#
git add

# ---------------------------------------------------------------
# Android emulator reference
# ---------------------------------------------------------------
~/Android/Sdk/emulator/emulator -list-avds

# Boot the device, save changes
#
~/Android/Sdk/emulator/emulator -avd OSINT

# Boot the devide from off state and save changes
# 
~/Android/Sdk/emulator/emulator -avd OSINT -no-snapshot-load

# Boot the device but don't save changes
#
~/Android/Sdk/emulator/emulator -avd OSINT -no-snapshot-save

# Reset the device to factory settings
#
~/Android/Sdk/emulator/emulator -avd OSINT -wipe-data

# Boot the device, save changes, force GPU accerlation from the host
#
~/Android/Sdk/emulator/emulator -avd OSINT -gpu host

# ---------------------------------------------------------------
# Kali linux reference
# ---------------------------------------------------------------

# Build the driver for the TP-Link AC600
#
sudo apt install git dkms
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl8812au
sudo make dkms_install
#The following commands are only needed if there was already a driver present and you're updating
# sudo mv /var/lib/8812au /var/lib/8812au-orig
# sudo make dkms_install

# Show available wifi
#
nmcli dev wifi

# ---------------------------------------------------------------
# Bash reference
# ---------------------------------------------------------------
mkdir -p ~/build
cd ~/build
git clone https://github.com/christitustech/mybash
cd mybash
./setup.sh

# Install the helper tools
sudo apt install multitail tree zoxide trash-cli fzf bash-completion

# Add a new user
sudo useradd -m Stan
sudo passwd Stan
sudo usermod -a -G sudo Stan

# Delete a user
sudo deluser --remove-home Stan

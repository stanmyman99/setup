#!/bin/bash

# This is the android.txt script from Bazzel's OSINT Edition 10 book
#

clear
COLUMNS=12
PS3='Selection: '
options=(
"List Devices" 
"Launch Pixel 6 (Quick-Changes Saved)" 
"Launch Pixel 6 (Quick-Changes Not Saved)" 
"Launch Pixel 6 (Cold-Changes Saved)" 
"Launch and Wipe Pixel 6")
select opt in "${options[@]}"
do
case $opt in
"List Devices")
cd ~/Library/Android/sdk/emulator/
./emulator -list-avds
;;
"Launch Pixel 6 (Quick-Changes Saved)")
cd ~/Library/Android/sdk/emulator/
./emulator -avd Pixel_6_Pro_API_33
;;
"Launch Pixel 6 (Quick-Changes Not Saved)")
cd ~/Library/Android/sdk/emulator/
./emulator -avd Pixel_6_Pro_API_33 -no-snapshot-save
;;
"Launch Pixel 6 (Cold-Changes Saved)")
cd ~/Library/Android/sdk/emulator/
./emulator -avd Pixel_6_Pro_API_33  -no-snapshot-load
;;
"Launch and Wipe Pixel 6")
cd ~/Library/Android/sdk/emulator/
./emulator -avd Pixel_6_Pro_API_33 -wipe-data
;;
esac
done

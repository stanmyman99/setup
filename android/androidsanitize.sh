#!/bin/bash

echo "------------------------------------------------------------------------"
echo " Script to strip a stock Android device to the bare bones for privacy"
echo "------------------------------------------------------------------------"

echo "------------------------------------------------------------------------"
echo "Backing up device"
echo "------------------------------------------------------------------------"
adb backup -all -system -apk -keyvalue -obb -shared -f backup.ab
#adb restore mybackupfile.adb

bash degoogle.sh
bash desamsung.sh
bash demicrosoft.sh
bash desocial.sh



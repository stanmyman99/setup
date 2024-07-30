#!/bin/bash

echo "------------------------------------------------------------------------"
echo " De-social-media-ize an Android device"
echo "------------------------------------------------------------------------"

echo "------------------------------------------------------------------------"
echo "Disabling Social Media files"
echo "------------------------------------------------------------------------"
adb shell pm disable-user --user 0 com.facebook.system
adb shell pm disable-user --user 0 com.facebook.katana
adb shell pm disable-user --user 0 com.facebook.appmanager
adb shell pm disable-user --user 0 com.linkedin.android

echo "------------------------------------------------------------------------"
echo "Disabling media apps"
echo "------------------------------------------------------------------------"
adb shell pm disable-user --user 0 com.netflix.mediaclient
adb shell pm disable-user --user 0 com.netflix.partner.activation
adb shell pm disable-user --user 0 com.netflix.mediaclient
adb shell pm disable-user --user 0 com.spotify.music

!/bin/bash

echo "------------------------------------------------------------------------"
echo " De-microsoftize an Android device"
echo "------------------------------------------------------------------------"

echo "------------------------------------------------------------------------"
echo "Disabling outlook, office hub, ondrive, appmanager"
echo "------------------------------------------------------------------------"
adb shell pm disable-user --user 0  com.microsoft.office.outlook
adb shell pm disable-user --user 0  com.microsoft.office.officehubrow
adb shell pm disable-user --user 0  com.microsoft.skydrive
adb shell pm disable-user --user 0  com.microsoft.appmanager

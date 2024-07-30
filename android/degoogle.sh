#!/bin/bash

echo "------------------------------------------------------------------------"
echo " Script to de-google an Android device"
echo "------------------------------------------------------------------------"

echo "------------------------------------------------------------------------"
echo "Disabling google service framework and the play, carrier, and speech svcs"
echo "------------------------------------------------------------------------"
adb shell pm disable-user --user 0 com.google.android.gsf
adb shell pm disable-user --user 0 com.google.android.gms
adb shell pm disable-user --user 0 com.google.android.ims
adb shell pm disable-user --user 0 com.google.android.tts

echo "------------------------------------------------------------------------"
echo "Disabling the Bazzel google apps"
echo "------------------------------------------------------------------------"
adb shell pm disable-user --user 0 com.android.chrome
adb shell pm disable-user --user 0 com.google.android.gm
adb shell pm disable-user --user 0 com.google.android.youtube
adb shell pm disable-user --user 0 com.google.mainline.telemetry
adb shell pm disable-user --user 0 com.google.android.apps.photos
adb shell pm disable-user --user 0 com.google.android.apps.maps
adb shell pm disable-user --user 0 com.google.android.calendar
adb shell pm disable-user --user 0 com.google.android.contacts
adb shell pm disable-user --user 0 com.google.android.apps.messaging
adb shell pm disable-user --user 0 com.google.android.music
adb shell pm disable-user --user 0 com.google.android.apps.tachyon
adb shell pm disable-user --user 0 com.android.vending
adb shell pm disable-user --user 0 com.google.ar.lens
adb shell pm disable-user --user 0 com.google.android.apps.docs
adb shell pm disable-user --user 0 com.google.android.videos
adb shell pm disable-user --user 0 com.google.android.partnersetup
adb shell pm disable-user --user 0 com.google.android.apps.googleassistant
adb shell pm disable-user --user 0 com.google.android.dialer
adb shell pm disable-user --user 0 com.google.android.inputmethod.latin
adb shell pm disable-user --user 0 com.google.android.apps.nbu.files
adb shell pm disable-user --user 0 com.google.android.deskclock
adb shell pm disable-user --user 0 com.google.ar.core
adb shell pm disable-user --user 0 com.google.android.googlequicksearchbox
adb shell pm disable-user --user 0 com.google.android.marvin.talkback
adb shell pm disable-user --user 0 com.google.android.apps.turbo
adb shell pm disable-user --user 0 com.google.android.apps.restore
adb shell pm disable-user --user 0 com.google.android.feedback
adb shell pm disable-user --user 0 com.google.android.setupwizard
adb shell pm disable-user --user 0 com.google.android.gms.location.history
adb shell pm disable-user --user 0 com.google.android.apps.wellbeing
adb shell pm disable-user --user 0 com.google.android.overlay.gmswellbeingconfig
adb shell pm disable-user --user 0 com.android.calllogbackup
adb shell pm disable-user --user 0 android.platform.res.overlay.google_dialer

echo "------------------------------------------------------------------------"
echo "Disabling other google apps"
echo "------------------------------------------------------------------------"
adb shell pm disable-user --user 0 com.google.android.ondevicepersonalization.services
adb shell pm disable-user --user 0 com.google.android.apps.youtube.music
adb shell pm disable-user --user 0 com.google.android.adservices.api
adb shell pm disable-user --user 0 com.google.audio.hearing.visualization.accessibility.scribe
adb shell pm disable-user --user 0 com.google.android.health.connect.backuprestore
adb shell pm disable-user --user 0 com.google.android.overlay.gmsconfig.gsa
adb shell pm disable-user --user 0 com.google.android.overlay.gmsconfig.common
adb shell pm disable-user --user 0 com.google.android.networkstack.tethering.overlay
adb shell pm disable-user --user 0 com.google.mainline.adservices
adb shell pm disable-user --user 0 com.android.hotwordenrollment.okgoogle
adb shell pm disable-user --user 0 com.android.hotwordenrollment.xgoogle
adb shell pm disable-user --user 0 com.google.android.networkstack.tethering
adb shell pm disable-user --user 0 com.google.android.as
adb shell pm disable-user --user 0 com.google.android.as.oss

#adb shell pm disable-user --user 0 com.google.android.overlay.modules.permissioncontroller.forframework
#adb shell pm disable-user --user 0 com.google.android.printservice.recommendation
#adb shell pm disable-user --user 0 com.google.android.captiveportallogin
#adb shell pm disable-user --user 0 com.google.android.networkstack
#adb shell pm disable-user --user 0 com.google.android.overlay.gmsconfig.asi
#adb shell pm disable-user --user 0 com.google.android.documentsui
#adb shell pm disable-user --user 0 com.google.android.overlay.modules.permissioncontroller
#adb shell pm disable-user --user 0 com.google.android.apps.accessibility.voiceaccess
#adb shell pm disable-user --user 0 com.google.android.overlay.gmsconfig.geotz
#adb shell pm disable-user --user 0 com.google.android.federatedcompute
#adb shell pm disable-user --user 0 com.google.android.webview
#adb shell pm disable-user --user 0 com.google.android.sdksandbox
#adb shell pm disable-user --user 0 com.google.android.cellbroadcastservice
#adb shell pm disable-user --user 0 com.google.android.overlay.modules.modulemetadata.forframework
#adb shell pm disable-user --user 0 com.google.android.packageinstaller
#adb shell pm disable-user --user 0 com.google.android.apps.carrier.carrierwifi
#adb shell pm disable-user --user 0 com.google.android.healthconnect.controller
#adb shell pm disable-user --user 0 com.google.android.nearby.halfsheet
#adb shell pm disable-user --user 0 com.google.android.overlay.modules.ext.services
#adb shell pm disable-user --user 0 com.google.android.modulemetadata
#adb shell pm disable-user --user 0 com.google.android.ext.services
#adb shell pm disable-user --user 0 com.google.android.configupdater
#adb shell pm disable-user --user 0 com.google.android.providers.media.module
#adb shell pm disable-user --user 0 com.google.android.overlay.modules.cellbroadcastreceiver
#adb shell pm disable-user --user 0 com.google.android.cellbroadcastreceiver
#adb shell pm disable-user --user 0 com.google.android.onetimeinitializer
#adb shell pm disable-user --user 0 com.google.android.permissioncontroller
#adb shell pm disable-user --user 0 com.google.android.overlay.modules.documentsui
#adb shell pm disable-user --user 0 com.google.android.syncadapters.calendar
#adb shell pm disable-user --user 0 com.google.android.overlay.modules.cellbroadcastservice
#adb shell pm disable-user --user 0 com.google.android.safetycenter.resources
#adb shell pm disable-user --user 0 com.google.android.overlay.gmsconfig.searchselector
#adb shell pm disable-user --user 0 com.google.android.ext.shared
#adb shell pm disable-user --user 0 com.google.android.overlay.gmsconfig.photos
#adb shell pm disable-user --user 0 com.google.android.overlay.modules.captiveportallogin.forframework
#adb shell pm disable-user --user 0 com.google.android.connectivity.resources




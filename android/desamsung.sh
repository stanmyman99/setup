#!/bin/bash

ACTION="$ACTION"
if [ "$#" -eq 1 ]; then
  ACTION=$1
fi

echo Applying this action: $ACTION

echo "------------------------------------------------------------------------"
echo " Script to de-Samsung an Android device once it is connected to adb"
echo "------------------------------------------------------------------------"

echo "------------------------------------------------------------------------"
echo "Disabling Knox apps"
echo "------------------------------------------------------------------------"
adb shell pm $ACTION --user 0 com.samsung.android.knox.analytics.uploader
adb shell pm $ACTION --user 0 com.samsung.android.knox.app.networkfilter
adb shell pm $ACTION --user 0 com.knox.vpn.proxyhandler
adb shell pm $ACTION --user 0 com.samsung.android.knox.attestation
adb shell pm $ACTION --user 0 com.samsung.android.knox.containercore
adb shell pm $ACTION --user 0 com.samsung.android.knox.kpecore
adb shell pm $ACTION --user 0 com.samsung.android.knox.pushmanager
adb shell pm $ACTION --user 0 com.samsung.knox.securefolder

echo "------------------------------------------------------------------------"
echo "Disabling Samsung apps"
echo "------------------------------------------------------------------------"
adb shell pm $ACTION --user 0 com.samsung.android.app.appsedge
adb shell pm $ACTION --user 0 com.samsung.android.app.clipboardedge
adb shell pm $ACTION --user 0 com.samsung.android.app.clockpack
adb shell pm $ACTION --user 0 com.samsung.android.app.cocktailbarservice
adb shell pm $ACTION --user 0 com.samsung.android.app.contacts
adb shell pm $ACTION --user 0 com.samsung.android.app.dofviewer
adb shell pm $ACTION --user 0 com.samsung.android.app.dressroom
adb shell pm $ACTION --user 0 com.samsung.android.app.earphonetypec
adb shell pm $ACTION --user 0 com.samsung.android.app.notes
adb shell pm $ACTION --user 0 com.samsung.android.app.omcagent
adb shell pm $ACTION --user 0 com.samsung.android.app.parentalcare
adb shell pm $ACTION --user 0 com.samsung.android.app.reminder
adb shell pm $ACTION --user 0 com.samsung.android.app.routines
adb shell pm $ACTION --user 0 com.samsung.android.appseparation
adb shell pm $ACTION --user 0 com.samsung.android.app.sharelive
adb shell pm $ACTION --user 0 com.samsung.android.app.smartcapture
adb shell pm $ACTION --user 0 com.samsung.android.app.soundpicker
adb shell pm $ACTION --user 0 com.samsung.android.app.spage
adb shell pm $ACTION --user 0 com.samsung.android.app.taskedge
adb shell pm $ACTION --user 0 com.samsung.android.app.telephonyui
adb shell pm $ACTION --user 0 com.samsung.android.app.telephonyui.esimclient
adb shell pm $ACTION --user 0 com.samsung.android.app.tips
adb shell pm $ACTION --user 0 com.samsung.android.app.updatecenter
adb shell pm $ACTION --user 0 com.samsung.android.app.watchmanagerstub
adb shell pm $ACTION --user 0 com.samsung.android.game.gamehome
adb shell pm $ACTION --user 0 com.samsung.android.game.gametools
adb shell pm $ACTION --user 0 com.samsung.android.game.gos

echo "------------------------------------------------------------------------"
echo "Removing safe to remove bloatware by Samsung"
echo "------------------------------------------------------------------------"
#See https://r1.community.samsung.com/t5/others/how-to-remove-samsung-bloatware-without-root/td-p/5817510/page/3
adb shell pm $ACTION --user 0 com.samsung.android.bixby.agent
adb shell pm $ACTION --user 0 com.samsung.android.bixbyvision.framework
adb shell pm $ACTION --user 0 com.samsung.android.bixby.wakeup
#adb shell pm $ACTION --user 0 com.samsung.android.app.settings.bixby

echo "------------------------------------------------------------------------"
echo "Disabling other Samsung system components"
echo "------------------------------------------------------------------------"
adb shell pm $ACTION --user 0 android.autoinstalls.config.samsung
adb shell pm $ACTION --user 0 com.monotype.android.font.samsungone
adb shell pm $ACTION --user 0 com.samsung.aasaservice
adb shell pm $ACTION --user 0 com.samsung.accessibility
adb shell pm $ACTION --user 0 com.samsung.advp.imssettings
adb shell pm $ACTION --user 0 com.samsung.android.accessibility.talkback
adb shell pm $ACTION --user 0 com.samsung.android.aircommandmanager
adb shell pm $ACTION --user 0 com.samsung.android.allshare.service.mediashare
adb shell pm $ACTION --user 0 com.samsung.android.ardrawing
adb shell pm $ACTION --user 0 com.samsung.android.arzone
adb shell pm $ACTION --user 0 com.samsung.android.audiomirroring
adb shell pm $ACTION --user 0 com.samsung.android.authfw
adb shell pm $ACTION --user 0 com.samsung.android.aware.service
adb shell pm $ACTION --user 0 com.samsung.android.bbc.bbcagent
adb shell pm $ACTION --user 0 com.samsung.android.beaconmanager
adb shell pm $ACTION --user 0 com.samsung.android.biometrics.app.setting
adb shell pm $ACTION --user 0 com.samsung.android.bluelightfilter
adb shell pm $ACTION --user 0 com.samsung.android.calendar
adb shell pm $ACTION --user 0 com.samsung.android.callassistant
adb shell pm $ACTION --user 0 com.samsung.android.callbgprovider
adb shell pm $ACTION --user 0 com.samsung.android.cidmanager
adb shell pm $ACTION --user 0 com.samsung.android.ConnectivityUxOverlay
adb shell pm $ACTION --user 0 com.samsung.android.container
adb shell pm $ACTION --user 0 com.samsung.android.da.daagent
adb shell pm $ACTION --user 0 com.samsung.android.dbsc
adb shell pm $ACTION --user 0 com.samsung.android.dialer
adb shell pm $ACTION --user 0 com.samsung.android.dqagent
adb shell pm $ACTION --user 0 com.samsung.android.dsms
adb shell pm $ACTION --user 0 com.samsung.android.dynamiclock
adb shell pm $ACTION --user 0 com.samsung.android.easysetup
adb shell pm $ACTION --user 0 com.samsung.android.fast
adb shell pm $ACTION --user 0 com.samsung.android.fmm
adb shell pm $ACTION --user 0 com.samsung.android.forest
adb shell pm $ACTION --user 0 com.samsung.android.galaxy
adb shell pm $ACTION --user 0 com.samsung.android.galaxycontinuity
adb shell pm $ACTION --user 0 com.samsung.android.gru
adb shell pm $ACTION --user 0 com.samsung.android.hdmapp
adb shell pm $ACTION --user 0 com.samsung.android.homemode
adb shell pm $ACTION --user 0 com.samsung.android.honeyboard
adb shell pm $ACTION --user 0 com.samsung.android.incall.contentprovider
adb shell pm $ACTION --user 0 com.samsung.android.incallui
adb shell pm $ACTION --user 0 com.samsung.android.inputshare
adb shell pm $ACTION --user 0 com.samsung.android.intellivoiceservice
adb shell pm $ACTION --user 0 com.samsung.android.keycustomizationinfobackupservice
adb shell pm $ACTION --user 0 com.samsung.android.kgclient
adb shell pm $ACTION --user 0 com.samsung.android.kidsinstaller
adb shell pm $ACTION --user 0 com.samsung.android.kmxservice
adb shell pm $ACTION --user 0 com.samsung.android.location
adb shell pm $ACTION --user 0 com.samsung.android.lool
adb shell pm $ACTION --user 0 com.samsung.android.mapsagent
adb shell pm $ACTION --user 0 com.samsung.android.mcfds
adb shell pm $ACTION --user 0 com.samsung.android.mcfserver
adb shell pm $ACTION --user 0 com.samsung.android.mdecservice
adb shell pm $ACTION --user 0 com.samsung.android.mdm
adb shell pm $ACTION --user 0 com.samsung.android.mdx
adb shell pm $ACTION --user 0 com.samsung.android.mdx.kit
adb shell pm $ACTION --user 0 com.samsung.android.mdx.quickboard
adb shell pm $ACTION --user 0 com.samsung.android.messaging
adb shell pm $ACTION --user 0 com.samsung.android.mobileservice
adb shell pm $ACTION --user 0 com.samsung.android.mtp
adb shell pm $ACTION --user 0 com.samsung.android.net.wifi.wifiguider
adb shell pm $ACTION --user 0 com.samsung.android.networkdiagnostic
adb shell pm $ACTION --user 0 com.samsung.android.networkstack
adb shell pm $ACTION --user 0 com.samsung.android.networkstack.tethering.overlay
adb shell pm $ACTION --user 0 com.samsung.android.oneconnect
adb shell pm $ACTION --user 0 com.samsung.android.privacydashboard
adb shell pm $ACTION --user 0 com.samsung.android.provider.filterprovider
adb shell pm $ACTION --user 0 com.samsung.android.providers.contacts
adb shell pm $ACTION --user 0 com.samsung.android.providers.factory
adb shell pm $ACTION --user 0 com.samsung.android.providers.media
adb shell pm $ACTION --user 0 com.samsung.android.providers.trash
adb shell pm $ACTION --user 0 com.samsung.android.rampart
adb shell pm $ACTION --user 0 com.samsung.android.rubin.app
adb shell pm $ACTION --user 0 com.samsung.android.samsungpositioning
adb shell pm $ACTION --user 0 com.samsung.android.scloud
adb shell pm $ACTION --user 0 com.samsung.android.scpm
adb shell pm $ACTION --user 0 com.samsung.android.scs
adb shell pm $ACTION --user 0 com.samsung.android.sdk.handwriting
adb shell pm $ACTION --user 0 com.samsung.android.sdk.ocr
adb shell pm $ACTION --user 0 com.samsung.android.sdm.config
adb shell pm $ACTION --user 0 com.samsung.android.secsoundpicker
adb shell pm $ACTION --user 0 com.samsung.android.server.wifi.mobilewips
adb shell pm $ACTION --user 0 com.samsung.android.service.aircommand
adb shell pm $ACTION --user 0 com.samsung.android.service.airviewdictionary
adb shell pm $ACTION --user 0 com.samsung.android.service.livedrawing
adb shell pm $ACTION --user 0 com.samsung.android.service.peoplestripe
adb shell pm $ACTION --user 0 com.samsung.android.service.stplatform
adb shell pm $ACTION --user 0 com.samsung.android.setting.multisound
adb shell pm $ACTION --user 0 com.samsung.android.settingshelper
adb shell pm $ACTION --user 0 com.samsung.android.shortcutbackupservice
adb shell pm $ACTION --user 0 com.samsung.android.smartcallprovider
adb shell pm $ACTION --user 0 com.samsung.android.smartface
adb shell pm $ACTION --user 0 com.samsung.android.smartface.overlay
adb shell pm $ACTION --user 0 com.samsung.android.smartmirroring
adb shell pm $ACTION --user 0 com.samsung.android.smartsuggestions
adb shell pm $ACTION --user 0 com.samsung.android.smartswitchassistant
adb shell pm $ACTION --user 0 com.samsung.android.sm.devicesecurity
adb shell pm $ACTION --user 0 com.samsung.android.spayfw
adb shell pm $ACTION --user 0 com.samsung.android.stickercenter
adb shell pm $ACTION --user 0 com.samsung.android.svcagent
adb shell pm $ACTION --user 0 com.samsung.android.themecenter
adb shell pm $ACTION --user 0 com.samsung.android.video
adb shell pm $ACTION --user 0 com.samsung.android.visionintelligence
adb shell pm $ACTION --user 0 com.samsung.android.visualars
adb shell pm $ACTION --user 0 com.samsung.android.voc
adb shell pm $ACTION --user 0 com.samsung.android.wallpaper.res
adb shell pm $ACTION --user 0 com.samsung.android.wcmurlsnetworkstack
adb shell pm $ACTION --user 0 com.samsung.android.widget.pictureframe
adb shell pm $ACTION --user 0 com.samsung.android.wifi.ai
adb shell pm $ACTION --user 0 com.samsung.android.wifi.decrease.scan.interval.resources
adb shell pm $ACTION --user 0 com.samsung.android.wifi.h2e.resources
adb shell pm $ACTION --user 0 com.samsung.android.wifi.increase.scan.interval.resources
adb shell pm $ACTION --user 0 com.samsung.android.wifi.p2paware.resources
adb shell pm $ACTION --user 0 com.samsung.android.wifi.resources
adb shell pm $ACTION --user 0 com.samsung.android.wifi.saeupgradeoffload.resources
adb shell pm $ACTION --user 0 com.samsung.android.wifi.softap.resources
adb shell pm $ACTION --user 0 com.samsung.android.wifi.softapwpathree.resources
adb shell pm $ACTION --user 0 com.samsung.app.newtrim
adb shell pm $ACTION --user 0 com.samsung.cmh
adb shell pm $ACTION --user 0 com.samsung.faceservice
adb shell pm $ACTION --user 0 com.samsung.gpuwatchapp
adb shell pm $ACTION --user 0 com.samsung.internal.systemui.navbar.gestural_no_hint
adb shell pm $ACTION --user 0 com.samsung.internal.systemui.navbar.sec_gestural
adb shell pm $ACTION --user 0 com.samsung.internal.systemui.navbar.sec_gestural_no_hint
adb shell pm $ACTION --user 0 com.samsung.ipservice
adb shell pm $ACTION --user 0 com.samsung.klmsagent
adb shell pm $ACTION --user 0 com.samsung.oda.service
adb shell pm $ACTION --user 0 com.samsung.safetyinformation
adb shell pm $ACTION --user 0 com.samsung.sec.android.application.csc
adb shell pm $ACTION --user 0 com.samsung.SMT
adb shell pm $ACTION --user 0 com.samsung.SMT.lang_de_de_f00
adb shell pm $ACTION --user 0 com.samsung.SMT.lang_en_gb_f00
adb shell pm $ACTION --user 0 com.samsung.SMT.lang_en_us_l03
adb shell pm $ACTION --user 0 com.samsung.SMT.lang_es_es_f00
adb shell pm $ACTION --user 0 com.samsung.SMT.lang_es_us_f00
adb shell pm $ACTION --user 0 com.samsung.SMT.lang_fr_fr_f00
adb shell pm $ACTION --user 0 com.samsung.SMT.lang_hi_in_f00
adb shell pm $ACTION --user 0 com.samsung.SMT.lang_it_it_f00
adb shell pm $ACTION --user 0 com.samsung.SMT.lang_pl_pl_f00
adb shell pm $ACTION --user 0 com.samsung.SMT.lang_ru_ru_f00
adb shell pm $ACTION --user 0 com.samsung.SMT.lang_th_th_f00
adb shell pm $ACTION --user 0 com.samsung.SMT.lang_vi_vn_f00
adb shell pm $ACTION --user 0 com.samsung.SMT.lang_zh_cn_f00
adb shell pm $ACTION --user 0 com.samsung.SMT.lang_zh_hk_f00
adb shell pm $ACTION --user 0 com.samsung.SMT.lang_zh_tw_f00
adb shell pm $ACTION --user 0 com.samsung.sree
adb shell pm $ACTION --user 0 com.samsung.storyservice
adb shell pm $ACTION --user 0 com.sec.android.app.samsungapps

#!/bin/bash

# Downloads android FOSS mobile apps from the sources to provision a new phone
#

# Obtanium
#
wget --no-check-certificate --content-disposition https://github.com/ImranR98/Obtainium/releases/download/v1.1.1/app-arm64-v8a-release.apk
wget --no-check-certificate --content-disposition https://github.com/ImranR98/Obtainium/releases/download/v1.1.1/app-arm64-v8a-release.apk.sha256

# Mullvad VPN
#
wget --no-check-certificate --content-disposition https://mullvad.net/en/download/app/apk/latest
wget --no-check-certificate --content-disposition https://mullvad.net/en/download/app/apk/latest/signature

# Tor browser
#
wget --no-check-certificate --content-disposition https://dist.torproject.org/torbrowser/13.0.12/tor-browser-android-aarch64-13.0.12.apk
wget --no-check-certificate --content-disposition https://dist.torproject.org/torbrowser/13.0.12/tor-browser-android-aarch64-13.0.12.apk.asc


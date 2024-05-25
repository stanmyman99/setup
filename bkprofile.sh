#!/bin/bash

pushd .
cd ~

rsync -avP --delete -e ssh ~/Documents/ seth@sethnas.local:/Documents/
rsync -avP --delete -e ssh ~/Apps/ seth@sethnas.local:/Apps/
rsync -avP --delete -e ssh ~/Images/ seth@sethnas.local:/Images/
rsync -avP --delete -e ssh ~/Downloads/ seth@sethnas.local:/Downloads/

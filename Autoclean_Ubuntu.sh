#!/bin/bash
clear
sudo apt-get autoclean -y && sudo apt-get clean -y
sudo apt-get autoremove -y && sudo apt --fix-broken install -y
#sudo apt-get update -y && sudo apt-get upgrade -y
sudo journalctl --vacuum-time=1s
sudo snap set system refresh.retain=2
sudo snap refresh 

set -eu

LANG=C snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done

rm -rf ~/.cache/thumbnails/*

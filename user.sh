#!/bin/bash

git clone https://aur.archlinux.org/yay.git
mv yay .yay
cd .yay
makepkg -si

yay -S librewolf-bin passff-host-librewolf-git pinentry-git

gpg --list-secret-keys
#pass init  /FOOTPRINT/

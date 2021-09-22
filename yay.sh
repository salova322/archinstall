#!/bin/bash

git clone https://aur.archlinux.org/yay.git
mv yay .yay
cd .yay
makepkg -si

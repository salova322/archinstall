#!/bin/bash

fallocate -l 2GB /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap 0 0' >> /etc/fstab

ln -sf /usr/share/zoneinfo/Asia/Yekaterinburg /etc/localtime
hwclock --sysohc

sed -i '177s/.//' /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf

echo 'thinkpad' >> /etc/hostname

echo 127.0.0.1   localhost$'\n'::1         localhost$'\n'127.0.1.1   thinkpad.localdomain    thinkpad >> /etc/hosts

echo $'\n' 'Enter password for root' $'\n' 

passwd

pacman -S grub 

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg 

pacman -S xf86-video-intel xorg libxfce4ui libxfce4util xfce4-appfinder xfce4-battery-plugin xfce4-datetime-plugin xfce4-mount-plugin xfce4-netload-plugin xfce4-notifyd xfce4-panel xfce4-power-manager xfce4-pulseaudio-plugin xfce4-screensaver xfce4-screenshooter xfce4-session xfce4-settings xfce4-taskmanager xfce4-terminal xfce4-wavelan-plugin xfce4-weather-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin lightdm  lightdm-gtk-greeter lightdm-gtk-greeter-settings xdg-user-dirs htop neofetch pass networkmanager xclip xsel galculator bash-completion file-roller p7zip zip unzip nano git network-manager-applet wireless_tools wpa_supplicant dialog mtools dosfstools base-devel linux-headers pulseaudio pavucontrol alsa-utils

systemctl enable lightdm
systemctl enable NetworkManager

useradd -m -G wheel salova
echo $'\n' 'Enter password for salova' $'\n' 
passwd salova 
sed -i '75s/.//' /etc/sudoers

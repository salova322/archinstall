#!/bin/bash

fallocate -l 2GB /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap 0 0' >> /etc/fstab

ln -sf /usr/share/zoneinfo/Asia/Yekaterinburg /etc/localtime
hwclock --sysohc

nano /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf

echo 'thinkpad' >> /etc/hostname

echo 127.0.0.1   localhost$'\n'::1         localhost$'\n'127.0.1.1   thinkpad.localdomain    thinkpad >> /etc/hosts

passwd

pacman -S grub networkmanager nano file-roller p7zip zip unzip network-manager-applet wireless_tools wpa_supplicant dialog mtools dosfstools base-devel linux-headers pulseaudio pavucontrol alsa-utils

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg 

pacman -S xf86-video-intel xorg xfce4 xfce4-goodies lightdm  lightdm-gtk-greeter lightdm-gtk-greeter-settings xdg-user-dirs htop neofetch pass

systemctl enable lightdm
systemctl enable NetworkManager

useradd -m -G wheel salova
passwd salova 
EDITOR=nano visudo

exit

#!/bin/bash

cfdisk

timedatectl set-ntp true

mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt 
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap /mnt base linux linux-firmware git nano 

genfstab -U /mnt >> /mnt/etc/fstab

cp archinstall/chroot.sh /mnt 

cp archinstall/user.sh /mnt 

chmod 777 /mnt/chroot.sh /mnt/user.sh

arch-chroot /mnt


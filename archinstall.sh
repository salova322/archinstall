#!bin/bash

cfdisk

timedatectl set-ntp true

mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt 
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap /mnt base linux linux-firmware  

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt


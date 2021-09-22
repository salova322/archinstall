timedatectl set-ntp true

mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt 
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot

pacstarp /mnt base linux linux-firmware  

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

fallocate -l 2GB /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
#nano /etc/fstab
echo '/swapfile none swap 0 0' >> /etc/fstab

ln -sf /usr/share/zoneinfo/Asia/Yekaterinburg /etc/localtime
hwclock --sysohc

nano /etc/locale.gen
locale-gen
#nano /etc/locale.conf
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf

#nano /etc/hostname
echo 'thinkpad' >> /etc/hostname

#nano /etc/hosts
echo '127.0.0.1   localhost \n::1         localhost \n127.0.1.1   thinkpad.localdomain    thinkpad' >> /etc/hosts

passwd

pacman -S grub networkmanager nano file-roller zip unzip network-manager-applet wireless_tools wpa_supplicant dialog mtools dosfstools base-devel linux-headers pulseaudio pavucontrol alsa-utils

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg 

pacman -S xf86-video-intel xorg xfce4 xfce4-goodies lightdm  lightdm-gtk-greeter lightdm-gtk-greeter-settings xdg-user-dirs

systemctl enable lightdm
systemctl enable NetworkManager

useradd -m -G wheel salova
passwd salova 
EDITOR=nano visudo

exit 
umount -a
reboot

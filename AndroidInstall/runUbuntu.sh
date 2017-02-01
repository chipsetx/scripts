#!/bin/sh
#upgrade ubuntu dist sources.list
su
busybox mount -o loop /storage/extSdCard/Informatique/Os-images/ubuntu-img/ubuntu.img /mnt
chroot /mnt /root/init.sh

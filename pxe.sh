#!/usr/bin/env bash

PXE_NET_IP=192.168.1.18
PXE_NET_IP_ROUTER=192.168.1.1
PXE_NET_BROADCAST=192.168.1.255
PXE_NET_NETMASK=255.255.255.0
PXE_NET_SUBNET=192.168.1.0
PXE_NET_IP_FROM=192.168.1.51
PXE_NET_IP_TO=192.168.1.60
PXE_NET_DNS=192.168.1.1
PXE_ISO_FILES="/home/chipset/Bureau/ubuntu/*"


function check_for_sudo (){
if [ $UID != 0 ]; then
	echo "You need root privileges"
	exit 2
fi
}
function install_progs(){
	echo "#### Installing programmes ####"
	apt-get install isc-dhcp-server -y
	apt-get install tftpd-hpa -y
	apt-get install syslinux -y
	apt-get install nfs-kernel-server -y
	apt-get install inetutils-inetd -y
}
function config_dhcp(){
	echo "#### Configuring dhcp ####"
	echo "allow booting;" >> /etc/dhcp/dhcpd.conf
	echo "allow bootp;" >> /etc/dhcp/dhcpd.conf
	echo "subnet $PXE_NET_SUBNET netmask $PXE_NET_NETMASK {" >> /etc/dhcp/dhcpd.conf
	echo "  range $PXE_NET_IP_FROM $PXE_NET_IP_TO;" >> /etc/dhcp/dhcpd.conf
	echo "  option broadcast-address $PXE_NET_BROADCAST;" >> /etc/dhcp/dhcpd.conf
	echo "  option routers $PXE_NET_IP_ROUTER;" >> /etc/dhcp/dhcpd.conf
	echo "  option domain-name-servers $PXE_NET_DNS;" >> /etc/dhcp/dhcpd.conf
	echo "  filename \"/pxelinux.0\";" >> /etc/dhcp/dhcpd.conf
	echo "}" >> /etc/dhcp/dhcpd.conf
        #sed interfaces wlan0 /etc/default/isc-dhcp-server
	service isc-dhcp-server restart 
}
function config_tftp(){
	echo "#### Configuring tftp ####"
	echo "TFTP_USERNAME=\"tftp\"" > /etc/default/tftpd-hpa
	echo "TFTP_DIRECTORY=\"/var/lib/tftpboot\"" >> /etc/default/tftpd-hpa
	echo "TFTP_ADDRESS=\"$PXE_NET_IP:69\"" >> /etc/default/tftpd-hpa
	echo "TFTP_OPTIONS=\"--secure\"" >> /etc/default/tftpd-hpa
#RUN_DAEMON="yes"
}
function create_nfs(){
	echo "#### Create nfs ####"
	echo "/var/lib/tftpboot/ 192.168.1.0/255.255.255.0(async,no_root_squash,no_subtree_check,ro)" >> /etc/exports
	service nfs-kernel-server restart
}
function create_pxe_files(){
	echo "#### Create pxe files ####"
	cp /usr/lib/syslinux/pxelinux.0 /var/lib/tftpboot/pxelinux.0
	cp /usr/lib/syslinux/menu.c32 /var/lib/tftpboot/menu.c32
	mkdir /var/lib/tftpboot/pxelinux.cfg
	#mkdir /var/lib/tftpboot/ubuntu
	touch /var/lib/tftpboot/pxelinux.cfg/default

}
function copy_iso_files(){
	echo "#### Copy iso files ####"
	#cp $PXE_ISO_FILES /var/lib/tftpboot/ubuntu/
        #cp -R $PXE_ISO_FILES /var/lib/tftpboot/ubuntu/
}

mkdir /var/lib/tftpboot/images/debian/stable
wget http://ftp.fr.debian.org/debian/dists/oldstable/main/installer-i386/current/images/netboot/netboot.tar.gz
decompresser fichier i386 de netboot.tar.gz dans /var/lib/tftpboot/images/debian/stable


function create_pxe_config_file(){
	echo "#### Create pxe config file ####"
cat > /var/lib/tftpboot/pxelinux.cfg/default << EOM
DEFAULT menu.c32
MENU MARGIN 0
MENU ROWS -9
MENU TABMSG
MENU TABMSGROW -3
MENU CMDLINEROW -3
MENU HELPMSGROW -4
MENU HELPMSGENDROW -1
MENU COLOR SCREEN 30;47
MENU COLOR BORDER 30;47
MENU COLOR TITLE 30;47
MENU COLOR SCROLLBAR 30;47
MENU COLOR SEL 37;40
MENU COLOR UNSEL 30;47
MENU COLOR CMDMARK 30;47
MENU COLOR CMDLINE 30;47
MENU COLOR TABMSG 37;40
MENU COLOR DISABLED 37;40
MENU COLOR HELP 37;40
MENU TITLE Ubuntu Live

LABEL 1 Ubuntu Live
KERNEL ubuntu/casper/vmlinuz
APPEND boot=casper rootfstype=nfs netboot=nfs nfsroot=$PXE_NET_IP:/var/lib/tftpboot/ubuntu debian-installer/language=fr console-setup/layoutcode=fr console-setup/variantcode=oss quiet splash initrd=ubuntu/casper/initrd.lz --

LABEL 2 Ubuntu Live (lancement avec messages)
KERNEL ubuntu/casper/vmlinuz
APPEND boot=casper rootfstype=nfs netboot=nfs nfsroot=$PXE_NET_IP:/var/lib/tftpboot/ubuntu debian-installer/language=fr console-setup/layoutcode=fr console-setup/variantcode=oss initrd=ubuntu/casper/initrd.lz --

label 3 Debian
 MENU LABEL Lenny i386
 kernel /images/debian/stable/i386/linux
 append vga=normal initrd=images/debian/stable/i386/initrd.gz ramdisk_size=9424 root=/dev/rd/0 devfs=mount,dall rw  --

EOM
}

function set_rights(){
	echo "#### Set rights ####"
	chown -R root:root /var/lib/tftpboot
	chmod -R 755 /var/lib/tftpboot
}

nano /etc/inetd.conf
tftp dgram udp wait root /usr/sbin/in.tftpd /usr/sbin/in.tftpd -s /var/lib/tftpboot


check_for_sudo
sleep 1
install_progs
sleep 1
config_dhcp
sleep 1
config_tftp
sleep 1
create_nfs
sleep 1
create_pxe_files
sleep 1
copy_iso_files
sleep 1
create_pxe_config_file
sleep 1
set_rights



/ubuntu/install/netboot/ubuntu-installer/i386/linux

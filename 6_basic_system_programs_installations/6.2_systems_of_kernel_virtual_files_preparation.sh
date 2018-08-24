#!/bin/bash

Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';


echo -e $red"######################################"
echo -e "# Init basic sytem file installation #"
echo -e "######################################"$Rcol

if whoami | grep -vFxq 'root' ; then
	echo "You have to be root"
	echo "Connect as root then restart the script"
	echo "Be carreful, you must not be connect in the chroot part for the moment"
	exit
fi

LFS=/mnt/lfs/

## Create folders for the system files mount
mkdir -pv $LFS/{dev,proc,sys,run}

## Create peripheric node for the init system
mknod -m 600 $LFS/dev/console c 5 1
mknod -m 666 $LFS/dev/null c 1 3

## Mount host /dev folder to the $LFS system
### Kind of copy, but it is a double mount: '--bind' option
mount -v --bind /dev $LFS/dev

## Mount virtual system files
mount -vt devpts devpts $LFS/dev/pts -o gid=5,mode=620
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

## Create folder for /run
if [ -h $LFS/dev/shm ]; then
	mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi

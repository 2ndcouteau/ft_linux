## Use this script to return in the system state installation
## --> connection to the lfs chroot environement.

#!/bin/bash

Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';


echo -e $red"######################################"
echo -e "# Init basic sytem file installation #"
echo -e "#        This is the 6.2 part        #"
echo -e "######################################"$Rcol

## Disconnect from "lfs" user
if whoami | grep -Fxq 'lfs' ; then
	exit ;
fi

## Connect to "root" user.
su ;

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

echo -e $yel"####################################"
echo -e "# Enter in the$BRed chroot environement$yel #"
echo -e "#       This is the 6.4 part       #"
echo -e "####################################"$Rcol


chroot "$LFS" /tools/bin/env -i \
	HOME=/root                  \
	TERM="$TERM"                \
	PS1='(lfs chroot) \u:\w\$ ' \
	PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
	/tools/bin/bash --login +h


## +h option to force bash to not use previous hash PATH
## This will force bash to recreate PATH and go to search binaries with the new PATH

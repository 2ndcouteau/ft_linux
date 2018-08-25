#!/bin/bash

Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';


echo -e $red"####################################"
echo -e "# Enter in the$BRed chroot environement$red #"
echo -e "####################################"$Rcol


chroot "$LFS" /tools/bin/env -i \
	HOME=/root                  \
	TERM="$TERM"                \
	PS1='(lfs chroot) \u:\w\$ ' \
	PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
	/tools/bin/bash --login +h

## +h option to force bash to not use previous hash PATH
## This will force bash to recreate PATH and go to search binaries with the new PATH

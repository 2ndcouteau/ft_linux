#!/bin/bash

Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';


echo -e $blu"###################"
echo -e "# Folder Creation #"
echo -e "###################"$Rcol


## Create all the folders for the system with default right configuration (755)
## Right configuration is corrected for /root to remove access to "other"
## and /tmp /var/tmp with "sticky bit" to prevent undersirable write
### by other user in a comon writing space

mkdir -pv /{bin,boot,etc/{opt,sysconfig},home,lib/firmware,mnt,opt}
mkdir -pv /{media/{floppy,cdrom},sbin,srv,var}
install -dv -m 0750 /root
install -dv -m 1777 /tmp /var/tmp

mkdir -pv /usr/{,local/}{bin,include,lib,sbin,src}
mkdir -pv /usr/{,local/}share/{color,dict,doc,info,locale,man}
mkdir -v  /usr/{,local/}share/{misc,terminfo,zoneinfo}
mkdir -v  /usr/libexec
mkdir -pv /usr/{,local/}share/man/man{1..8}

case $(uname -m) in
 x86_64) mkdir -v /lib64 ;;
esac

mkdir -v /var/{log,mail,spool}

ln -sv /run /var/run
ln -sv /run/lock /var/lock

mkdir -pv /var/{opt,cache,lib/{color,misc,locate},local}

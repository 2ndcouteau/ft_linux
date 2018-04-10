#!/bin/bash
# Simple script to list version numbers of critical development tools
echo "----------------------------------------------"
echo "-- All these check are provide from LFS-8.2 --"
echo "----------------------------------------------"

export LC_ALL=C

bash --version | head -n1 | cut -d" " -f2-4
MYSH=$(readlink -f /bin/sh)
echo "/bin/sh -> $MYSH"
echo $MYSH | grep -q bash || echo "ERROR: /bin/sh does not point to bash"
unset MYSH

echo --
echo "Should be <=2.30"
echo -n "Binutils: "; ld --version | head -n1 | cut -d" " -f3-

echo --

bison --version | head -n1
if [ -h /usr/bin/yacc ]; then
  echo "/usr/bin/yacc -> `readlink -f /usr/bin/yacc`";
elif [ -x /usr/bin/yacc ]; then
  echo yacc is `/usr/bin/yacc --version | head -n1`
else
  echo "yacc not found"
fi

echo --
	bzip2 --version 2>&1 < /dev/null | head -n1 | cut -d" " -f1,6-
echo --
	echo -n "Coreutils: "; chown --version | head -n1 | cut -d")" -f2
echo --
	diff --version | head -n1
echo --
	find --version | head -n1
echo --

gawk --version | head -n1
if [ -h /usr/bin/awk ]; then
  echo "/usr/bin/awk -> `readlink -f /usr/bin/awk`";
elif [ -x /usr/bin/awk ]; then
  echo awk is `/usr/bin/awk --version | head -n1`
else
  echo "awk not found"
fi
echo --
	echo "gcc && g++ should be <= 7.3.0"
	gcc --version | head -n1
echo --
	g++ --version | head -n1
echo --
	echo "Should be <=2.27"
	ldd --version | head -n1 | cut -d" " -f2-  # glibc version
echo --
	grep --version | head -n1
echo --
	gzip --version | head -n1
echo --
	echo "Should be >3.2"
	cat /proc/version
echo --
	m4 --version | head -n1
echo --
	make --version | head -n1
echo --
	patch --version | head -n1
echo --
	echo Perl `perl -V:version`
echo --
	sed --version | head -n1
echo --
	tar --version | head -n1
echo --
	makeinfo --version | head -n1
echo --
	xz --version | head -n1

echo --

echo 'int main(){}' > dummy.c && g++ -o dummy dummy.c
if [ -x dummy ]
  then echo "g++ compilation OK";
  else echo "g++ compilation failed"; fi
rm -f dummy.c dummy

echo --
echo --

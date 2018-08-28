Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

### Functions declarations:

function continue_or_exit()
{
	read -rsn1 -p"Press Q to exit or Enter to continue : " input
	if [[ $input = "q" ]] || [[ $input = "Q" ]]; then
		echo "Exit."
		exit 0
	fi
	echo
}


echo -e ${red}'Be carreful, this script ask you to check output manualy !'${Rcol}
continue_or_exit;

# Edition /tools link
mv -v /tools/bin/{ld,ld-old}
mv -v /tools/$(uname -m)-pc-linux-gnu/bin/{ld,ld-old}
mv -v /tools/bin/{ld-new,ld}
ln -sv /tools/bin/ld /tools/$(uname -m)-pc-linux-gnu/bin/ld


# Change GCC specs to find header and glibc
gcc -dumpspecs | sed -e 's@/tools@@g'                   \
	-e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
	-e '/\*cpp:/{n;s@$@ -isystem /usr/include@}' >      \
	`dirname $(gcc --print-libgcc-file-name)`/specs


# Check State of the new system
echo -e ${blu}'Check compilation link use'${Rcol}
echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib'

echo -e ${blu}'Expected output with system specific output:'
echo -e ${red}'[Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]'${Rcol}
continue_or_exit;


# Check start files
echo -e ${blu}'Check start files'${Rcol}
grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log

echo -e ${blu}'Expected output:'
echo -e ${red}'/usr/lib/../lib/crt1.o succeeded
/usr/lib/../lib/crti.o succeeded
/usr/lib/../lib/crtn.o succeeded'${Rcol}
continue_or_exit;


# Check hearders compilator
echo -e ${blu}'Check hearders compilator'${Rcol}
grep -B1 '^ /usr/include' dummy.log
echo -e ${blu}'Expected output:'
echo -e ${red}'#include <...> search starts here:
/usr/include'${Rcol}
continue_or_exit;


# Check use link editor
echo -e ${blu}'Check use link editor'${Rcol}
grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'
echo -e ${blu}'Expected output:
You can ignore -linux-gnu composant'
echo -e ${red}'SEARCH_DIR("/usr/lib")
SEARCH_DIR("/lib")'${Rcol}
continue_or_exit;


# Check of the good libc
echo -e ${blu}"Check of the good libc"${Rcol}
grep "/lib.*/libc.so.6 " dummy.log
echo -e ${blu}'Last line expected output:
attempt to open /lib/libc.so.6 succeeded'
continue_or_exit;


# Check if GCC use the good editor link
echo -e ${blu}"Check if GCC use the good editor link"${Rcol}
grep found dummy.log
echo -e ${blu}'Last command expected with specific system output
found ld-linux-x86-64.so.2 at /lib/ld-linux-x86-64.so.2'
continue_or_exit;



# Clean test files
echo -e ${blu}"Clean test files"${Rcol}
rm -v dummy.c a.out dummy.log
echo -e ${red}'End of tools chain adjustment !'${Rcol}

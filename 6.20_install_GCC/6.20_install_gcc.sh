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

time {
	{
		echo -e ${red}"###########################"
		echo -e "# Start Install${BRed} 6.20 GCC${red} #"
		echo -e "###########################"${Rcol}

		echo -e ${blu}"Set${yel} SOURCES=/sources"${Rcol}
		SOURCES=/sources
		echo -e ${blu}"Set${yel} ROOT_PWD=$(pwd)"${Rcol}
		ROOT_PWD=$(pwd)/

		cd $SOURCES
		echo -e ${red}"Extract GCC"${Rcol}
		tar -xvf gcc-*.tar.xz
		if [[ $? != 0 ]]; then
			exit;
		fi
		cd gcc-*/

		echo -e ${red}"Config for x86_64"${Rcol}
		case $(uname -m) in
		  x86_64)
			sed -e '/m64=/s/lib64/lib/' \
				-i.orig gcc/config/i386/t-linux64
		  ;;
		esac

		echo -e ${red}"Clean lib gcc for the new install"${Rcol}
		rm -f /usr/lib/gcc

		echo -e ${red}"Create subfolder for the installation"${Rcol}
		mkdir -v build
		cd       build

		echo -e ${red}"./configure gcc"${Rcol}
		SED=sed                               \
		../configure --prefix=/usr            \
					 --enable-languages=c,c++ \
					 --disable-multilib       \
					 --disable-bootstrap      \
					 --with-system-zlib

		echo -e ${red}"Make"${Rcol}
		make

		echo -e ${red}"Raise up the limit of the stack"${Rcol}
		ulimit -s 32768

		echo -e ${red}"Run tests"${Rcol}
		make -k check

		echo -e ${red}"Redirect test resume"${Rcol}
		../contrib/test_summary > /sources/.gcc_test_resume.log

		echo -e ${red}"Make install"${Rcol}
		make install

		echo -e ${red}"Create link for FHS for historical reasons"${Rcol}
		ln -sv ../usr/bin/cpp /lib

		echo -e ${red}"Create link as 'cc' to be compliant with paquets usages"${Rcol}
		ln -sv gcc /usr/bin/cc

		echo -e ${red}"Create link for LTO"${Rcol}
		install -v -dm755 /usr/lib/bfd-plugins
		ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/7.3.0/liblto_plugin.so \
				/usr/lib/bfd-plugins/

		echo -e ${red}"Run compilation test"${Rcol}
		echo 'int main(){}' > dummy.c
		cc dummy.c -v -Wl,--verbose &> dummy.log
		readelf -l a.out | grep ': /lib'
		echo -e ${blu}"About expected output:\
		[Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]"${Rcol}
		continue_or_exit;

		echo -e ${red}"Check Start files"${Rcol}
		grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log
		echo -e ${blu}"About expected output:\
		/usr/lib/gcc/x86_64-pc-linux-gnu/7.3.0/../../../../lib/crt1.o succeeded\
		/usr/lib/gcc/x86_64-pc-linux-gnu/7.3.0/../../../../lib/crti.o succeeded\
		/usr/lib/gcc/x86_64-pc-linux-gnu/7.3.0/../../../../lib/crtn.o succeeded"${Rcol}
		continue_or_exit;

		echo -e ${red}"Check headers usages"${Rcol}
		grep -B4 '^ /usr/include' dummy.log
		echo -e ${blu}"About expected output:\
		#include <...> search starts here:
		/usr/lib/gcc/x86_64-pc-linux-gnu/7.3.0/include\
		/usr/local/include\
		/usr/lib/gcc/x86_64-pc-linux-gnu/7.3.0/include-fixed\
		/usr/include"${Rcol}
		continue_or_exit;


		echo -e ${red}"Check link editor"${Rcol}
		grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'
		echo -e ${blu}'About expected output:\
		SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib64")
		SEARCH_DIR("/usr/local/lib64")\
		SEARCH_DIR("/lib64")\
		SEARCH_DIR("/usr/lib64")\
		SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib")\
		SEARCH_DIR("/usr/local/lib")\
		SEARCH_DIR("/lib")\
		SEARCH_DIR("/usr/lib");'${Rcol}
		continue_or_exit;

		echo -e ${red}"Check usage of the good libc"${Rcol}
		grep "/lib.*/libc.so.6 " dummy.log
		echo -e ${blu}'About expected output:\
		attempt to open /lib/libc.so.6 succeeded'${Rcol}
		continue_or_exit;

		echo -e ${red}"Check GCC use the good dynamic link editor"${Rcol}
		grep found dummy.log
		echo -e ${blu}'About expected output:\
		found ld-linux-x86-64.so.2 at /lib/ld-linux-x86-64.so.2'${Rcol}
		continue_or_exit;

		echo -e ${red}"Clean Files"${Rcol}
		rm -v dummy.c a.out dummy.log

		echo -e ${red}"Move missplaced folder"${Rcol}
		mkdir -pv /usr/share/gdb/auto-load/usr/lib
		mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib

		echo -e $blu"Remove uncompress sources"$Rcol
		rm -rvf /sources/*/
		echo -e $red"DONE"$Rcol

		echo -e ${red}"GCC install DONE"${Rcol}

	} &> /sources/.612.log
}

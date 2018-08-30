Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/vim-*/

time {
	echo -e ${red}"Change default place of vimrc"${Rcol}
	echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h

	echo -e ${red}"Disable one test"${Rcol}
	sed -i '/call/{s/split/xsplit/;s/303/492/}' src/testdir/test_recover.vim

	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr

	echo -e ${red}"make"${Rcol}
	make

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	make -j1 test

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${red}"Create link to use vim as vi"${Rcol}
	ln -sv vim /usr/bin/vi
	for L in  /usr/share/man/{,*/}man1/vim.1; do
		ln -sv vim.1 $(dirname $L)/vi.1
	done

	echo -e ${red}"Link documentation for compliance"${Rcol}
	ln -sv ../vim/vim80/doc /usr/share/doc/vim-8.0.586


	echo -e ${red}"Vim configuration"${Rcol}
	cat > /etc/vimrc << "EOF"
" Begin /etc/vimrc
" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1
set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif
" End /etc/vimrc
EOF

	echo -e ${blu}'time install vim.sh'${Rcol}
}

Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/ninja-*/

time {
	echo -e ${red}"Limit nb process using"${Rcol}
	export NINJAJOBS=4

	echo -e ${red}"Configure binary"${Rcol}
	python3 configure.py --bootstrap

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	python3 configure.py
	./ninja ninja_test
	./ninja_test --gtest_filter=-SubprocessTest.SetWithLots

	echo -e ${red}"make install"${Rcol}
	install -vm755 ninja /usr/bin/
	install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
	install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja

	echo -e ${blu}'time install ninja.sh'${Rcol}
}

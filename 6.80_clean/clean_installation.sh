red='\e[0;31m';
BRed='\e[1;31m';

echo -e ${red}"Remove temporary installation files"${Rcol}
rm -rf /tmp/*

# Those libraries were used during regression test but not now anymore
echo -e ${red}"Remove useless static library"${Rcol}
rm -f /usr/lib/lib{bfd,opcodes}.a
rm -f /usr/lib/libbz2.a
rm -f /usr/lib/lib{com_err,e2p,ext2fs,ss}.a
rm -f /usr/lib/libltdl.a
rm -f /usr/lib/libfl.a
rm -f /usr/lib/libfl_pic.a
rm -f /usr/lib/libz.a

echo -e ${red}"Remove Archive libtools files"${Rcol}
find /usr/lib -name \*.la -delete

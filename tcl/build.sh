#!/bin/bash

# http://www.linuxfromscratch.org/blfs/view/cvs/general/tcl.html

cd unix

./configure \
    --prefix=$PREFIX        \
    --without-tzdata        \
    --enable-64bit

make

make test 

make install
make install-private-headers 

cd $PREFIX
rm -rf man share

cd $PREFIX/lib
ln -s libtcl8.6.so libtcl.so

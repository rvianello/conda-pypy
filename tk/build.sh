#!/bin/bash

cd unix

./configure \
    --prefix=$PREFIX \
    --with-tcl=$PREFIX/lib \
    --enable-64bit \
    CPPFLAGS=-I$PREFIX/include LDFLAGS=-L$PREFIX/lib

make

make install
make install-private-headers 

cd $PREFIX
rm -rf man share

cd $PREFIX/lib
ln -s libtk8.6.so libtk.so

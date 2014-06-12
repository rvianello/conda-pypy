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

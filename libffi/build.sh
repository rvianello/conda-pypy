./configure --prefix=$PREFIX --disable-static
make
make install
if [ -e $PREFIX/lib64 ]; then
    cp $PREFIX/lib64/* $PREFIX/lib/
    rm -rf $PREFIX/lib64/
fi

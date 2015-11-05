./config \
    --prefix=$PREFIX \
    --openssldir=$PREFIX/etc/ssl \
    --libdir=$PREFIX/lib \
    shared zlib-dynamic

CPATH=$PREFIX/include make

make install

./config \
    --prefix=$PREFIX \
    --openssldir=$PREFIX/etc/ssl \
    --libdir=$PREFIX/lib \
    shared zlib-dynamic
make
make install

export LDFLAGS=-L${PREFIX}/lib
export CFLAGS=-I${PREFIX}/include

./configure --prefix=$PREFIX \
    --enable-shared --disable-static \
    --disable-readline --enable-threadsafe \
    --enable-dynamic-extensions

make
make install

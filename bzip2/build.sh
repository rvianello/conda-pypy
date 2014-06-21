make -f Makefile-libbz2_so 
mkdir -p $PREFIX/lib
mkdir -p $PREFIX/include
mv bzlib.h $PREFIX/include  
mv libbz2.so.* $PREFIX/lib
cd $PREFIX/lib 
ln -s libbz2.so.1.0 libbz2.so
#make install PREFIX=$PREFIX

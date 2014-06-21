make -f Makefile-libbz2_so 
mkdir -p $PREFIX/lib
mkdir -p $PREFIX/include
mv bzlib.h $PREFIX/include  
mv libbz2.so.* $PREFIX/lib
#make install PREFIX=$PREFIX

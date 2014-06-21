mkdir -p $PREFIX/lib $PREFIX/include

pushd $PREFIX/lib
cp /lib64/libm-2.12.so .
ln -s libm-2.12.so libm.so.6
ln -s libm-2.12.so libm.so
cp -a /usr/lib64/libgfortran.so.* .
popd

cp -a /usr/include/math.h  $PREFIX/include


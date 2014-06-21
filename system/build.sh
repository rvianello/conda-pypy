mkdir -p $PREFIX/lib $PREFIX/include


for filename in /lib/x86_64-linux-gnu/libm.so.6 /lib/x86_64-linux-gnu/libm-2.17.so /lib64/libm.so.6 /lib64/libm-2.12.so /usr/lib64/libgfortran.so.3.0.0 /usr/lib64/libgfortran.so.3
do
  test -f $filename && cp -a $filename $PREFIX/lib
done
cp -a /usr/include/math.h  $PREFIX/include


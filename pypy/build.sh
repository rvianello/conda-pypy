pushd ${SRC_DIR}

wget https://bitbucket.org/squeaky/portable-pypy/downloads/pypy-2.3-linux_x86_64-portable.tar.bz2
tar xvf pypy-2.3-linux_x86_64-portable.tar.bz2
mv pypy-2.3-linux_x86_64-portable pypy-portable

popd 

pushd ${SRC_DIR}/pypy/goal

CFLAGS=-I${PREFIX}/include LDFLAGS=-L${PREFIX}/lib \
${SRC_DIR}/pypy-portable/bin/pypy \
../../rpython/bin/rpython -Ojit targetpypystandalone

# any tests I can run from here?

popd

# or from here?

cp ${SRC_DIR}/pypy/goal/pypy-c ${PREFIX}/bin/pypy

cp -r ${SRC_DIR}/site-packages ${PREFIX}
cp -r ${SRC_DIR}/lib_pypy ${PREFIX}
cp -r ${SRC_DIR}/lib-python ${PREFIX}

cp -r ${SRC_DIR}/include/* $PREFIX/include

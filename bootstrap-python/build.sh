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

# copy the interpreter
pushd ${PREFIX}/bin
cp ${SRC_DIR}/pypy/goal/pypy-c ./python
ln -s ./python pypy
popd

# compile the py modules to bytecode
${SRC_DIR}/pypy-portable/bin/pypy -m compileall ${SRC_DIR}/site-packages
${SRC_DIR}/pypy-portable/bin/pypy -m compileall ${SRC_DIR}/lib_pypy
${SRC_DIR}/pypy-portable/bin/pypy -m compileall ${SRC_DIR}/lib-python

# copy the library code
cp -r ${SRC_DIR}/site-packages ${PREFIX}
cp -r ${SRC_DIR}/lib_pypy ${PREFIX}
cp -r ${SRC_DIR}/lib-python ${PREFIX}

# copy the headers
cp -r ${SRC_DIR}/include/* $PREFIX/include

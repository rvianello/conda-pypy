pushd ${SRC_DIR}/pypy/goal

CFLAGS=-I${PREFIX}/include LDFLAGS=-L${PREFIX}/lib \
${PREFIX}/opt/python \
../../rpython/bin/rpython --shared -Ojit targetpypystandalone

# any tests I can run from here?

popd

# or from here?

# copy the interpreter
pushd ${PREFIX}/bin
cp ${SRC_DIR}/pypy/goal/pypy-c ./python
ln -s ./python pypy
popd

# and the shared library
pushd ${PREFIX}/lib
cp ${SRC_DIR}/pypy/goal/libpypy-c.so .
popd

# compile the py modules to bytecode
${PREFIX}/opt/python -m compileall ${SRC_DIR}/site-packages
${PREFIX}/opt/python -m compileall ${SRC_DIR}/lib_pypy
${PREFIX}/opt/python -m compileall ${SRC_DIR}/lib-python

# copy the library code
cp -r ${SRC_DIR}/site-packages ${PREFIX}
cp -r ${SRC_DIR}/lib_pypy ${PREFIX}
cp -r ${SRC_DIR}/lib-python ${PREFIX}

# copy the headers
cp -r ${SRC_DIR}/include/* $PREFIX/include

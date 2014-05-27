pushd ${SRC_DIR}/pypy/goal

CFLAGS=-I${PREFIX}/include \
LDFLAGS=-L${PREFIX}/lib \
$PYTHON ../../rpython/bin/rpython -Ojit targetpypystandalone

# any tests I can run from here?

popd

# or from here?

cp ${SRC_DIR}/pypy/goal/pypy-c ${PREFIX}/bin/pypy

cp -r ${SRC_DIR}/site-packages ${PREFIX}
cp -r ${SRC_DIR}/lib_pypy ${PREFIX}
cp -r ${SRC_DIR}/lib-python ${PREFIX}

cp -r ${SRC_DIR}/include/* $PREFIX/include

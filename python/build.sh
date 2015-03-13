pushd ${SRC_DIR}/pypy/goal
CFLAGS=-I${PREFIX}/include LDFLAGS=-L${PREFIX}/lib \
    ${PREFIX}/opt/bin/python \
    ../../rpython/bin/rpython --shared -Ojit targetpypystandalone
# any tests I can run from here?
popd

# or from here?

# create a distribution
mkdir -p ${SRC_DIR}/dist
pushd ${SRC_DIR}/pypy/tool/release
CFLAGS=-I${PREFIX}/include LDFLAGS=-L${PREFIX}/lib \
    ${PREFIX}/opt/bin/python \
    package.py --archive-name pypy-distribution --targetdir ${SRC_DIR}/dist
popd

# unpack it
pushd ${SRC_DIR}/dist
tar xvf pypy-distribution.tar.bz2
popd

# move and copy

pushd ${PREFIX}/bin
mv ${SRC_DIR}/dist/pypy-distribution/bin/pypy ./python
popd

pushd ${PREFIX}/lib
mv ${SRC_DIR}/dist/pypy-distribution/bin/libpypy-c.so .
popd

pushd ${PREFIX}/include
mv ${SRC_DIR}/dist/pypy-distribution/include/* .
popd

pushd ${PREFIX}
mv ${SRC_DIR}/dist/pypy-distribution/lib_pypy .
mv ${SRC_DIR}/dist/pypy-distribution/lib-python .
popd

mkdir ${PREFIX}/site-packages
pushd ${PREFIX}/site-packages
mv ${SRC_DIR}/dist/pypy-distribution/site-packages/README .
popd

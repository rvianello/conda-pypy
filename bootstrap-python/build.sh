pushd ${SRC_DIR}

wget https://bitbucket.org/squeaky/portable-pypy/downloads/pypy-2.5-linux_x86_64-portable.tar.bz2
tar xvf pypy-2.5-linux_x86_64-portable.tar.bz2
mv pypy-2.5-linux_x86_64-portable pypy-portable

popd 

# run the translation
pushd ${SRC_DIR}/pypy/goal

CFLAGS=-I${PREFIX}/include LDFLAGS=-L${PREFIX}/lib \
${SRC_DIR}/pypy-portable/bin/pypy \
../../rpython/bin/rpython -Ojit targetpypystandalone

# any tests I can run from here?

popd

# or from here?

# create a distribution
mkdir -p ${SRC_DIR}/dist
pushd ${SRC_DIR}/pypy/tool/release

CFLAGS=-I${PREFIX}/include LDFLAGS=-L${PREFIX}/lib \
${SRC_DIR}/pypy-portable/bin/pypy \
package.py --archive-name pypy-distribution --targetdir ${SRC_DIR}/dist

popd

pushd ${SRC_DIR}/dist

tar xvf pypy-distribution.tar.bz2
mv pypy-distribution/bin/pypy pypy-distribution/bin/python
mv pypy-distribution ${PREFIX}/opt

popd


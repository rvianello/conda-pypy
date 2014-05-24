cd pypy/goal

CFLAGS=-I${PREFIX}/include \
LDFLAGS=-L${PREFIX}/lib \
$PYTHON ../../rpython/bin/rpython -Ojit targetpypystandalone

exit 1

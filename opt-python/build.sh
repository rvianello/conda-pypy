mkdir -p ${PREFIX}/opt
mkdir -p ${PREFIX}/opt/site-packages

cp ${PREFIX}/bin/python ${PREFIX}/opt
cp -r ${PREFIX}/lib_pypy ${PREFIX}/opt
cp -r ${PREFIX}/lib-python ${PREFIX}/opt


#!/bin/bash
wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py -O - | $PYTHON

$PYTHON -c "import pip; print(pip.__version__)" > __conda_version__.txt


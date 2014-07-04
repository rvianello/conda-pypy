conda-pypy
==========

This repository provides a set of recipes that allow installing pypy's python into a conda environment.

Quickstart (use pre-built packages)
-----------------------------------

The quickest way to use the result from these recipes is installing some packages I've already built and uploaded to my channel on binstar (these packages were built inside a CentOS6 docker container, they should hopefully work on most modern linux distribution). Here are a few instructions:

* Install miniconda::
  
  $ wget http://repo.continuum.io/miniconda/Miniconda-3.5.5-Linux-x86_64.sh
  $ bash Miniconda-3.5.5-Linux-x86_64.sh # and follow the instructions

* Then install this `file <https://raw.githubusercontent.com/rvianello/conda-pypy/master/condarc>`_ as `$HOME/.condarc`. This file will override the default configuration of your anaconda/miniconda installation so that packages are installed from my pypy channel on binstar and are not mixed with the cpython ones that are part of the normal distribution.

* Activate your conda installation::
  
  $ export PATH=/path/to/miniconda/bin:$PATH

* Create a conda environment and install python (pypy's python) and pip in it::
  
  $ conda create -n pypy python pip

* Activate this new environment::
  
  $ . activate pypy

* Run python::
  
  (pypy) $ python
  Python 2.7.6 (32f35069a16d819b58c1b6efb17c44e3e53397b2, Jun 23 2014, 08:14:27)
  [PyPy 2.3.1 with GCC 4.4.7 20120313 (Red Hat 4.4.7-4)] on linux2
  Type "help", "copyright", "credits" or "license" for more information.
  >>>> 


Build your own packages
-----------------------

If you want to build your own packages for Linux x86_64 you can use these recipes, collect the result into your own channel and then customize the conda rc file accordingly. It's goint to take a bit of time, but it should be quite simple.

What if I want to use these packages on OSX or Windows?
-------------------------------------------------------

Please fork this repository, extend/port the recipes as needed, and then consider sending a pull request :-)

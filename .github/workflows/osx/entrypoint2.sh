#!/bin/sh -l
set -x
export TOP=$(pwd)
#exit
brew tap davidchall/hep
brew install wget coreutils  
brew install gsl
brew install gnu-sed
brew install gcc
brew install cmake
brew install zlib 
brew install autoconf 
brew install automake 
brew install libtool 
brew install pkg-config
brew install binder
brew install lhapdf
brew install --cask basictex
eval "$(/usr/libexec/path_helper)"
export PATH=$PATH:/usr/local/bin:/usr/local//Cellar/gcc/11.1.0_1/libexec/gcc/x86_64-apple-darwin19/11.1.0/:/Library/TeX/texbin/
sudo tlmgr update --self
sudo tlmgr install sectsty collection-fontsrecommended
#####

which gfortran-11
if [ "$?" = "0" ]; then 
   export CXX=g++-11
   export CC=gcc-11
   export FC=gfortran-11
   export F77=gfortran-11
   export LD=gfortran-11
else
   export CXX=g++
   export CC=gcc
   export FC=gfortran
   export F77=gfortran
   export LD=gfortran
fi
export CXXFLAGS=-std=c++14
cp /usr/local/bin/gfortran-11 /usr/local/bin/gfortran
brew install root

########################################################################

git clone https://gitlab-ci-token:glpat-HHs8pM118-nLqsAXqMTi@gitlab.cern.ch/averbyts/tmdlib

cmake -S TMDlib2-yaml -Bbuild -DCMAKE_INSTALL_PREFIX=$(pwd)/TESTINSTALLDIR 
make -j 2 -C build
make install -C build

#!/bin/bash -e

export PREFIX=${OPENRISC_BASE}/${GCC_VERSION}
export PATH=${PREFIX}/bin:${PATH}

git clone -b scripts https://github.com/openrisc/newlib build-toolchain; cd build-toolchain
git clone -b binutils-`echo ${BINUTILS_VERSION} | sed 's/\./_/g'` git://sourceware.org/git/binutils-gdb.git binutils
git clone -b or1k-${GCC_VERSION}-release https://github.com/openrisc/or1k-gcc gcc
wget https://gmplib.org/download/gmp/gmp-6.1.0.tar.xz; tar -xf gmp-6.1.0.tar.xz; ln -s ../gmp-6.1.0 gcc/gmp
wget ftp://ftp.gnu.org/gnu/mpc/mpc-1.0.3.tar.gz; tar -xzf mpc-1.0.3.tar.gz; ln -s ../mpc-1.0.3 gcc/mpc
wget http://www.mpfr.org/mpfr-current/mpfr-3.1.5.tar.xz; tar -xf mpfr-3.1.5.tar.xz; ln -s ../mpfr-3.1.5 gcc/mpfr
git clone -b `echo ${NEWLIB_VERSION} | sed 's/\./_/g'` https://github.com/openrisc/newlib
git clone -b gdb-${GDB_VERSION}-release git://sourceware.org/git/binutils-gdb.git gdb

JOBS=8 BUILD_MULTICORE=1 ./build.sh

mkdir -p ${OPENRISC_MODULEFILES}
cat <<EOF > ${OPENRISC_MODULEFILES}/${GCC_VERSION}
#%Module
prepend-path PATH ${PREFIX}/bin
EOF

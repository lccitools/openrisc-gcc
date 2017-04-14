#!/bin/bash -e

FILE=or1k-elf-multicore_gcc${GCC_VERSION}_binutils${BINUTILS_VERSION}_newlib${NEWLIB_VERSION}_gdb${GDB_VERSION}.tgz
wget https://github.com/openrisc/newlib/releases/download/v${NEWLIB_VERSION}/${FILE}

mkdir -p ${OPENRISC_BASE}/${GCC_VERSION}-newlib${NEWLIB_VERSION}
tar -xzf ${FILE} -C ${OPENRISC_BASE}/${GCC_VERSION}-newlib${NEWLIB_VERSION}

mkdir -p ${OPENRISC_MODULEFILES}
cat <<EOF > ${OPENRISC_MODULEFILES}/${GCC_VERSION}-newlib${NEWLIB_VERSION}
#%Module
prepend-path PATH ${PREFIX}/or1k-elf-multicore/bin
EOF

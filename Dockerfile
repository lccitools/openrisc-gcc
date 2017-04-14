# The MIT License
#
#  Copyright (c) 2017, Oleg Nenashev, Stefan Wallentowitz
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#  THE SOFTWARE.

FROM lccitools/base:latest
LABEL Maintainer  Stefan Wallentowitz <stefan@wallentowitz.de>
LABEL Description "OpenRISC GCC crosscompiler"

RUN apt-get update && apt-get install -y \
    git libgmp-dev libmpfr-dev libmpc-dev zlib1g-dev texinfo build-essential \
    flex bison

ARG OPENRISC_BASE=/tools/compilers/openrisc/gcc
ARG OPENRISC_MODULEFILES=/tools/modulefiles/compilers/openrisc/gcc

ARG GCC_VERSION=5.3.0
ARG BINUTILS_VERSION=2.26
ARG NEWLIB_VERSION=2.4.0
ARG GDB_VERSION=7.11
ARG JOBS=8

ENV OPENRISC_BASE=${OPENRISC_BASE}
ENV OPENRISC_MODULEFILES=${OPENRISC_MODULEFILES}

ENV GCC_VERSION=${GCC_VERSION}
ENV BINUTILS_VERSION=${BINUTILS_VERSION}
ENV NEWLIB_VERSION=${NEWLIB_VERSION}
ENV GDB_VERSION=${GDB_VERSION}
ENV JOBS=8

COPY build.sh /tmp/

ENTRYPOINT ["./build.sh"]

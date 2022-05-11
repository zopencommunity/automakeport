#!/bin/sh

cd basic || exit 99
genfiles=autom4te.cache configure autom4te.cache aclocal.m4 configure build-aux Makefile.in config.status config.log Makefile hello.o hello.dbg hello .deps"
rm -rf $genfiles

export PATH="${AUTOMAKE_PROD}/bin:$PATH"

# msf - should this be required?
export PERL5LIB="${AUTOMAKE_PROD}/share/automake-1.16:$PERL5LIB"

if ! whence autoreconf || ! whence aclocal ; then
	echo "Need autoconf and automake tools on PATH before running test" >&2
	exit 4
fi

if ! autoreconf -d --verbose --install --force ; then
	echo "autoreconf did not run correctly" >&2
	exit 4
fi

if ! ./configure ; then
	echo "configure with dependency tracking disabled did not run correctly" >&2
	exit 4
fi

if ! make ; then
	echo "unable to make helloworld program" >&2
	exit 4
fi

if ! ./hello ; then
	echo "unable to run helloworld" >&2
	exit 4
fi

exit 0

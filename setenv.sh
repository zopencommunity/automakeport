#!/bin/sh
#set -x

if ! [ -f ./setenv.sh ]; then
	echo "Need to source from the setenv.sh directory" >&2
else
	export _BPXK_AUTOCVT="ON"
	export _CEE_RUNOPTS="FILETAG(AUTOCVT,AUTOTAG),POSIX(ON),TERMTHDACT(MSG)"
	export _TAG_REDIR_ERR="txt"
	export _TAG_REDIR_IN="txt"
	export _TAG_REDIR_OUT="txt"

	export AUTOMAKE_VRM="automake-1.16"
	export AUTOMAKE_ROOT="${PWD}"

	export AUTOTOOLS_MIRROR="https://github.com/autotools-mirror"
	export AUTOCONF_URL="http://ftp.gnu.org/gnu/automake/"

	#
        # Add 'Perl' and 'M4' to PATH, LIBPATH, PERL5LIB
	#
        fsroot=$( basename $HOME )
	export PERL_ROOT="/${fsroot}/perlprod"
	export M4_ROOT="/${fsroot}/m4prod"
	export AUTOCONF_ROOT="/${fsroot}/autoconfprod"
	export PERLLIB=$( cd ${PERL_ROOT}/lib/perl5/*/os390/CORE; echo $PWD )
	export LIBPATH="${PERLLIB}:${LIBPATH}"
	export PATH="${M4_ROOT}/bin:${PERL_ROOT}/bin:${AUTOCONF_ROOT}/bin:$PATH"

	export PATH="${AUTOMAKE_ROOT}/bin:${PATH}"

	export AUTOMAKE_PROD="/${fsroot}/automakeprod"
fi

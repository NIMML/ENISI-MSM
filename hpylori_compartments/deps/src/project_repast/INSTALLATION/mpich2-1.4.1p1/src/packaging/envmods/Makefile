# This Makefile.in created by simplemake.  Do not edit

# src/packaging/envmods/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
INSTALL         = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_SCRIPT  = ${INSTALL}
INSTALL_DATA    = ${INSTALL} -m 644
MKDIR_P         = mkdir -p
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/packaging/envmods
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/packaging/envmods
prefix          = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH
sysconfdir      = ${prefix}/etc
MAKE            = make
MPILIBNAME      = mpich
PMPILIBNAME     = pmpich


VPATH = .

.SUFFIXES:
# Some make programs complain if no suffixes are set
.SUFFIXES: .c .o
apply: 
	$(ACTION) $(ACTION_INPUT)
clean: 
	-@rm -f *.o ${srcdir}/*.o 
	-@rm -f *.lo ${srcdir}/*.lo
distclean:  clean distclean-xxx remove-makefile
distclean-xxx:
	-@rm -f mpich2.module Makefile
	-@rm -rf autom4te*.cache
	-@rm -rf $(DEPS_DIR)
	-@rm -f TAGS
remove-makefile:
	rm -f Makefile
remove-genmakefiles:
	rm -f  Makefile
all-redirect:

# --------------------------------------------------------------------------
# Install target
install:  FORCE_TARGET 
	if [ ! -d ${DESTDIR}${sysconfdir} ] ; then $(MKDIR_P) ${DESTDIR}${sysconfdir} ; fi

install-strip:
	$(MAKE) INSTALL_STRIP_FLAG=-s install
uninstall: 
installcheck: 
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------
# Commented out the installation of mpich2.module till Deji has a
# complete solution how mpich2.module could be used with modules.
# optinstall_ETC = mpich2.module

.POSIX:

FORCE_TARGET:


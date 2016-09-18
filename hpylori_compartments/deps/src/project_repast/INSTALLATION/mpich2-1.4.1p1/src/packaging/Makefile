# This Makefile.in created by simplemake.  Do not edit

# src/packaging/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/packaging
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/packaging
MAKE            = make
MPILIBNAME      = mpich
PMPILIBNAME     = pmpich


VPATH = .

.SUFFIXES:
# Some make programs complain if no suffixes are set
.SUFFIXES: .c .o
apply: 
	$(ACTION) $(ACTION_INPUT)
	(cd pkgconfig && ${MAKE} apply )
	(cd envmods && ${MAKE} apply )
clean: 
	-@rm -f *.o ${srcdir}/*.o 
	-@rm -f *.lo ${srcdir}/*.lo
	(cd pkgconfig && ${MAKE} clean )
	(cd envmods && ${MAKE} clean )
distclean:  clean distclean-xxx remove-makefile
distclean-xxx:
	if [ -s pkgconfig/Makefile ] ; then (cd pkgconfig && ${MAKE} distclean ) ; fi
	if [ -s envmods/Makefile ] ; then (cd envmods && ${MAKE} distclean ) ; fi
	-@rm -f Makefile
	-@rm -rf autom4te*.cache
	-@rm -rf $(DEPS_DIR)
	-@rm -f TAGS
remove-makefile:
	rm -f Makefile
remove-genmakefiles:
	rm -f  Makefile
all-redirect:
	@(cd pkgconfig && ${MAKE} all )
	@(cd envmods && ${MAKE} all )

# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------

.POSIX:

FORCE_TARGET:


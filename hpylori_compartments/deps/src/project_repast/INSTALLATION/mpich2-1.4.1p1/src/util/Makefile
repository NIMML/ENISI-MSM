# This Makefile.in created by simplemake.  Do not edit

# src/util/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/util
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/util
MAKE            = make
MPILIBNAME      = mpich
PMPILIBNAME     = pmpich


VPATH = .

.SUFFIXES:
# Some make programs complain if no suffixes are set
.SUFFIXES: .c .o
apply: 
	$(ACTION) $(ACTION_INPUT)
	for dir in mem info msgs instrm thread dbg param osserv procmap other  - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		(cd $$dir && ${MAKE} apply ) ; done
clean: 
	-@rm -f *.o ${srcdir}/*.o 
	-@rm -f *.lo ${srcdir}/*.lo
	for dir in mem info msgs instrm thread dbg param osserv procmap other  - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		(cd $$dir && ${MAKE} clean ) ; done
distclean:  clean distclean-xxx remove-makefile
distclean-xxx:
	for dir in mem info msgs instrm thread dbg param osserv procmap other  - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		if [ ! -s $$dir/Makefile ] ; then continue ; fi ;\
		(cd $$dir && ${MAKE} distclean ) ; done
	-@rm -f createshlib Makefile
	-@rm -rf autom4te*.cache
	if [ -s logging/Makefile ] ; then (cd logging && $(MAKE) distclean ) ; fi
	-@rm -rf $(DEPS_DIR)
	-@rm -f TAGS
remove-makefile:
	rm -f Makefile
remove-genmakefiles:
	rm -f  Makefile
all-redirect:
	@(cd mem && ${MAKE} all )
	@(cd info && ${MAKE} all )
	@(cd msgs && ${MAKE} all )
	@(cd instrm && ${MAKE} all )
	@(cd thread && ${MAKE} all )
	@(cd dbg && ${MAKE} all )
	@(cd param && ${MAKE} all )
	@(cd osserv && ${MAKE} all )
	@(cd procmap && ${MAKE} all )
	@(cd other && ${MAKE} all )
	@for dir in  - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		if ( cd $$dir && ${MAKE} all ) ; then : ; else exit 1; fi \
	done

# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------
# Note info requires the PMPILIBNAME definition

.POSIX:

FORCE_TARGET:


# This Makefile.in created by simplemake.  Do not edit

# src/mpi/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpi
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpi
MAKE            = make
MPILIBNAME      = mpich
PMPILIBNAME     = pmpich


VPATH = .

.SUFFIXES:
# Some make programs complain if no suffixes are set
.SUFFIXES: .c .o
apply: 
	$(ACTION) $(ACTION_INPUT)
	for dir in attr coll comm datatype errhan group init misc pt2pt rma spawn timer topo romio  - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		(cd $$dir && ${MAKE} apply ) ; done
clean: 
	-@rm -f *.o ${srcdir}/*.o 
	-@rm -f *.lo ${srcdir}/*.lo
	for dir in attr coll comm datatype errhan group init misc pt2pt rma spawn timer topo romio  - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		(cd $$dir && ${MAKE} clean ) ; done
distclean:  clean distclean-xxx remove-makefile
distclean-xxx:
	for dir in attr coll comm datatype errhan group init misc pt2pt rma spawn timer topo romio  - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		if [ ! -s $$dir/Makefile ] ; then continue ; fi ;\
		(cd $$dir && ${MAKE} distclean ) ; done
	-@rm -f Makefile
	-@rm -rf autom4te*.cache
	if [ -s romio/Makefile ] ; then (cd romio && $(MAKE) distclean ) ; fi
	if [ -s debugger/Makefile ] ; then (cd debugger && $(MAKE) distclean ) ; fi
	-@rm -rf $(DEPS_DIR)
	-@rm -f TAGS
remove-makefile:
	rm -f Makefile
remove-genmakefiles:
	rm -f  Makefile
all-redirect:
	@(cd attr && ${MAKE} all )
	@(cd coll && ${MAKE} all )
	@(cd comm && ${MAKE} all )
	@(cd datatype && ${MAKE} all )
	@(cd errhan && ${MAKE} all )
	@(cd group && ${MAKE} all )
	@(cd init && ${MAKE} all )
	@(cd misc && ${MAKE} all )
	@(cd pt2pt && ${MAKE} all )
	@(cd rma && ${MAKE} all )
	@(cd spawn && ${MAKE} all )
	@(cd timer && ${MAKE} all )
	@(cd topo && ${MAKE} all )
	@for dir in romio - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		if ( cd $$dir && ${MAKE} all ) ; then : ; else exit 1; fi \
	done
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

.POSIX:

FORCE_TARGET:


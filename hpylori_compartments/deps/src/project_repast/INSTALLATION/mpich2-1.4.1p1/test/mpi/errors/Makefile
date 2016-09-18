# This Makefile.in created by simplemake.  Do not edit

# errors/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/errors
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/errors
MAKE            = make

VPATH = .

.SUFFIXES:
# Some make programs complain if no suffixes are set
.SUFFIXES: .c .o
apply: 
	$(ACTION) $(ACTION_INPUT)
	for dir in attr coll comm group pt2pt rma spawn topo io  cxx basic faults - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		(cd $$dir && ${MAKE} apply ) ; done
clean: 
	-@rm -f *.o ${srcdir}/*.o 
	-@rm -f *.lo ${srcdir}/*.lo
	for dir in attr coll comm group pt2pt rma spawn topo io  cxx basic faults - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		(cd $$dir && ${MAKE} clean ) ; done
distclean:  clean distclean-xxx remove-makefile
distclean-xxx:
	for dir in attr coll comm group pt2pt rma spawn topo io  cxx basic faults - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		if [ ! -s $$dir/Makefile ] ; then continue ; fi ;\
		(cd $$dir && ${MAKE} distclean ) ; done
	-@rm -f Makefile testlist
	-@rm -rf autom4te*.cache
	-@for dir in  cxx f77 f90 ; do \
	    if [ -s $$dir/Makefile ] ; then \
	      (cd $$dir && ${MAKE} distclean ;) ; fi ; \
	done
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
	@(cd group && ${MAKE} all )
	@(cd pt2pt && ${MAKE} all )
	@(cd rma && ${MAKE} all )
	@(cd spawn && ${MAKE} all )
	@(cd topo && ${MAKE} all )
	@(cd io && ${MAKE} all )
	@for dir in  cxx - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		if ( cd $$dir && ${MAKE} all ) ; then : ; else exit 1; fi \
	done
	@(cd basic && ${MAKE} all )
	@(cd faults && ${MAKE} all )

# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------

testing:
	../runtests -srcdir=$(srcdir) -tests=testlist \
		   -mpiexec=/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpiexec \
		   -xmlfile=summary.xml

.POSIX:

FORCE_TARGET:


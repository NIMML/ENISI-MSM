# This Makefile.in created by simplemake.  Do not edit

# f77/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/f77
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/f77
MAKE            = make

VPATH = .

.SUFFIXES:
# Some make programs complain if no suffixes are set
.SUFFIXES: .c .o
apply: 
	$(ACTION) $(ACTION_INPUT)
	for dir in util attr datatype coll pt2pt info init comm topo rma spawn io ext ; do \
		(cd $$dir && ${MAKE} apply ) ; done
clean: 
	-@rm -f *.o ${srcdir}/*.o 
	-@rm -f *.lo ${srcdir}/*.lo
	for dir in util attr datatype coll pt2pt info init comm topo rma spawn io ext ; do \
		(cd $$dir && ${MAKE} clean ) ; done
distclean:  clean distclean-xxx remove-makefile
distclean-xxx:
	for dir in util attr datatype coll pt2pt info init comm topo rma spawn io ext ; do \
		if [ ! -s $$dir/Makefile ] ; then continue ; fi ;\
		(cd $$dir && ${MAKE} distclean ) ; done
	-@rm -f Makefile testlist
	-@rm -rf autom4te*.cache
	-@rm -rf $(DEPS_DIR)
	-@rm -f TAGS
remove-makefile:
	rm -f Makefile
remove-genmakefiles:
	rm -f  Makefile
all-redirect:
	@(cd util && ${MAKE} all )
	@(cd attr && ${MAKE} all )
	@(cd datatype && ${MAKE} all )
	@(cd coll && ${MAKE} all )
	@(cd pt2pt && ${MAKE} all )
	@(cd info && ${MAKE} all )
	@(cd init && ${MAKE} all )
	@(cd comm && ${MAKE} all )
	@(cd topo && ${MAKE} all )
	@(cd rma && ${MAKE} all )
	@(cd spawn && ${MAKE} all )
	@(cd io && ${MAKE} all )
	@(cd ext && ${MAKE} all )

# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------

# A special testing target to simplify testing just the F77 code
testing:
	../runtests -srcdir=$(srcdir) -tests=testlist \
		   -mpiexec=/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpiexec \
		   -xmlfile=summary.xml

.POSIX:

FORCE_TARGET:


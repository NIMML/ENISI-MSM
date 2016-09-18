# This Makefile.in created by simplemake.  Do not edit

# errors/cxx/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/errors/cxx
bindir          = ${exec_prefix}/bin
exec_prefix     = ${prefix}
prefix          = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/errors/cxx
MAKE            = make

VPATH = .

.SUFFIXES:
# Some make programs complain if no suffixes are set
.SUFFIXES: .c .o
apply: 
	$(ACTION) $(ACTION_INPUT)
	(cd io && ${MAKE} apply )
	(cd errhan && ${MAKE} apply )
clean: 
	-@rm -f *.o ${srcdir}/*.o 
	-@rm -f *.lo ${srcdir}/*.lo
	(cd io && ${MAKE} clean )
	(cd errhan && ${MAKE} clean )
distclean:  clean distclean-xxx remove-makefile
distclean-xxx:
	if [ -s io/Makefile ] ; then (cd io && ${MAKE} distclean ) ; fi
	if [ -s errhan/Makefile ] ; then (cd errhan && ${MAKE} distclean ) ; fi
	-@rm -f Makefile testlist
	-@rm -rf autom4te*.cache
	-@rm -rf $(DEPS_DIR)
	-@rm -f TAGS
remove-makefile:
	rm -f Makefile
remove-genmakefiles:
	rm -f  Makefile
all-redirect:
	@(cd io && ${MAKE} all )
	@(cd errhan && ${MAKE} all )

# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------

# A special testing target to simplify testing just the C++ code
testing:
	../../runtests -srcdir=$(srcdir) -tests=testlist \
		   -mpiexec=$(bindir)/mpiexec \
		   -xmlfile=summary.xml


.POSIX:

FORCE_TARGET:


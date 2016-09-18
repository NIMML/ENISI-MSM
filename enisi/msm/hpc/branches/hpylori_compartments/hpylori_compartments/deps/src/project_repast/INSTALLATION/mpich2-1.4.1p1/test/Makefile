# This Makefile.in created by simplemake.  Do not edit

# test/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test
MAKE            = make

VPATH = .

.SUFFIXES:
# Some make programs complain if no suffixes are set
.SUFFIXES: .c .o
apply: 
	$(ACTION) $(ACTION_INPUT)
	for dir in mpi mpid util basic commands ; do \
		(cd $$dir && ${MAKE} apply ) ; done
clean: 
	-@rm -f *.o ${srcdir}/*.o 
	-@rm -f *.lo ${srcdir}/*.lo
	for dir in mpi mpid util basic commands ; do \
		(cd $$dir && ${MAKE} clean ) ; done
distclean:  clean distclean-local distclean-xxx remove-makefile
distclean-xxx:
	for dir in mpi mpid util basic commands ; do \
		if [ ! -s $$dir/Makefile ] ; then continue ; fi ;\
		(cd $$dir && ${MAKE} distclean ) ; done
	-@rm -f Makefile
	-@rm -rf autom4te*.cache
	-@rm -rf $(DEPS_DIR)
	-@rm -f TAGS
remove-makefile:
	rm -f Makefile
remove-genmakefiles:
	rm -f  Makefile
all-redirect:
	@(cd mpi && ${MAKE} all )
	@(cd mpid && ${MAKE} all )
	@(cd util && ${MAKE} all )
	@(cd basic && ${MAKE} all )
	@(cd commands && ${MAKE} all )

# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# Dummy target
dependencies:

# --------------------------------------------------------------------------
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------
distclean-local:
	rm -f runtests

# Test both the MPI routines and the MPICH2 command scripts
testing:
	(NOXMLCLOSE=YES && export NOXMLCLOSE && cd mpi && $(MAKE) testing)
	(XMLFILE=../mpi/summary.xml && XMLCONTINUE=YES && \
	export XMLFILE && export XMLCONTINUE && \
	cd commands && $(MAKE) testing)

.POSIX:

FORCE_TARGET:


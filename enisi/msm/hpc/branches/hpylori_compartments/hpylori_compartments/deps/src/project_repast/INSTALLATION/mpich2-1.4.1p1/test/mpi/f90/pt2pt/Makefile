# This Makefile.in created by simplemake.  Do not edit

# f90/pt2pt/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/f90/pt2pt
bindir          = ${exec_prefix}/bin
exec_prefix     = ${prefix}
prefix          = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/f90/pt2pt
LIBS            = -lpthread 
MAKE            = make
FC               = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpif90
FCFLAGS         = 
FC_COMPILE      = $(FC) $(FCFLAGS) $(FCINCLUDES)
FC_LINK        = $(FC)
LDFLAGS     =    ../util/mtestf90.o 

VPATH = .
FCINCLUDES = -I.

.SUFFIXES:
.SUFFIXES: .o .f90 
.f90.o:
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  FC              $<" ; \
	else \
	  echo $(FC_COMPILE) -c $< ; \
	fi
	@$(FC_COMPILE) -c $<
.f90:
	$(FC_COMPILE) -o $* $< $(LDFLAGS) $(LIBS)
apply: 
	$(ACTION) $(ACTION_INPUT)
clean: 
	-@rm -f *.o ${srcdir}/*.o greqf90 statusesf90
	-@rm -f greqf90.exe statusesf90.exe
	-@rm -f core core.[0-9]*
	-@rm -f *.lo ${srcdir}/*.lo
	-@rm -f *.irlog*
distclean:  clean distclean-xxx remove-makefile
distclean-xxx:
	-@rm -f Makefile
	-@rm -rf autom4te*.cache
	-@rm -rf $(DEPS_DIR)
	-@rm -f TAGS
remove-makefile:
	rm -f Makefile
remove-genmakefiles:
	rm -f  Makefile
all-redirect: statusesf90 greqf90

greqf90: greqf90.o dummyf90.o    ../util/mtestf90.o
	$(FC_LINK) $(FCFLAGS) $(LDFLAGS) -o greqf90 greqf90.o dummyf90.o  ${LIBS}
statusesf90: statusesf90.o    ../util/mtestf90.o
	$(FC_LINK) $(FCFLAGS) $(LDFLAGS) -o statusesf90 statusesf90.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  statusesf90.f90 greqf90.f90 dummyf90.f90
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------
# This Makefile.sm generated automatically by f77tof90
# from test/mpi/f77/pt2pt/Makefile.sm.  DO NOT EDIT


testing:
	../../runtests -srcdir=$(srcdir) -tests=testlist \
			-mpiexec=$(bindir)/mpiexec \
		   	-xmlfile=summary.xml
../util/mtestf90.o: 
	(cd ../util && $(MAKE) mtestf90.o)

.POSIX:

FORCE_TARGET:


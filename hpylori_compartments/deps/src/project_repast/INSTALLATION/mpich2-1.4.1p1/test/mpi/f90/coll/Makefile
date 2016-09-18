# This Makefile.in created by simplemake.  Do not edit

# f90/coll/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/f90/coll
bindir          = ${exec_prefix}/bin
exec_prefix     = ${prefix}
prefix          = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/f90/coll
LIBS            = -lpthread 
MAKE            = make
FC               = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpif90
FCFLAGS         = 
FC_COMPILE      = $(FC) $(FCFLAGS) $(FCINCLUDES)
FC_LINK        = $(FC)
LDFLAGS     =    ../util/mtestf90.o 

VPATH = .

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
	-@rm -f *.o ${srcdir}/*.o inplacef90 allredopttf90 reducelocalf90 alltoallwf90 exscanf90 allredint8f90 uallreducef90
	-@rm -f inplacef90.exe allredopttf90.exe reducelocalf90.exe alltoallwf90.exe exscanf90.exe allredint8f90.exe uallreducef90.exe
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
all-redirect: uallreducef90 exscanf90 alltoallwf90 inplacef90 allredint8f90 allredopttf90\
	 reducelocalf90

inplacef90: inplacef90.o    ../util/mtestf90.o
	$(FC_LINK) $(FCFLAGS) $(LDFLAGS) -o inplacef90 inplacef90.o  ${LIBS}
allredopttf90: allredopttf90.o    ../util/mtestf90.o
	$(FC_LINK) $(FCFLAGS) $(LDFLAGS) -o allredopttf90 allredopttf90.o  ${LIBS}
reducelocalf90: reducelocalf90.o    ../util/mtestf90.o
	$(FC_LINK) $(FCFLAGS) $(LDFLAGS) -o reducelocalf90 reducelocalf90.o  ${LIBS}
alltoallwf90: alltoallwf90.o    ../util/mtestf90.o
	$(FC_LINK) $(FCFLAGS) $(LDFLAGS) -o alltoallwf90 alltoallwf90.o  ${LIBS}
exscanf90: exscanf90.o    ../util/mtestf90.o
	$(FC_LINK) $(FCFLAGS) $(LDFLAGS) -o exscanf90 exscanf90.o  ${LIBS}
allredint8f90: allredint8f90.o    ../util/mtestf90.o
	$(FC_LINK) $(FCFLAGS) $(LDFLAGS) -o allredint8f90 allredint8f90.o  ${LIBS}
uallreducef90: uallreducef90.o    ../util/mtestf90.o
	$(FC_LINK) $(FCFLAGS) $(LDFLAGS) -o uallreducef90 uallreducef90.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  uallreducef90.f90 exscanf90.f90 alltoallwf90.f90 inplacef90.f90 \
	allredint8f90.f90 allredopttf90.f90 reducelocalf90.f90 
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------
# This Makefile.sm generated automatically by f77tof90
# from test/mpi/f77/coll/Makefile.sm.  DO NOT EDIT


testing:
	../../runtests -srcdir=$(srcdir) -tests=testlist \
			-mpiexec=$(bindir)/mpiexec \
		   	-xmlfile=summary.xml
../util/mtestf90.o: 
	(cd ../util && $(MAKE) mtestf90.o)

.POSIX:

FORCE_TARGET:


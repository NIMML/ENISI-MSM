# This Makefile.in created by simplemake.  Do not edit

# f77/coll/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/f77/coll
bindir          = ${exec_prefix}/bin
exec_prefix     = ${prefix}
prefix          = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/f77/coll
LIBS            = -lpthread 
MAKE            = make
F77             = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpif77
FFLAGS          = 
F77_COMPILE     = $(F77) $(FFLAGS) $(F77INCLUDES)
F77_LINK       = $(F77)
LDFLAGS     =    ../util/mtestf.o 

VPATH = .

.SUFFIXES:
.SUFFIXES: .o .f 
.f.o:
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  F77             $<" ; \
	else \
	  echo $(F77_COMPILE) -c $< ; \
	fi
	@$(F77_COMPILE) -c $<
.f:
	$(F77_COMPILE) -o $* $< $(LDFLAGS) $(LIBS)
apply: 
	$(ACTION) $(ACTION_INPUT)
clean: 
	-@rm -f *.o ${srcdir}/*.o inplacef allredint8f allredopttf reducelocalf uallreducef exscanf alltoallwf
	-@rm -f inplacef.exe allredint8f.exe allredopttf.exe reducelocalf.exe uallreducef.exe exscanf.exe alltoallwf.exe
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
all-redirect: uallreducef exscanf alltoallwf inplacef allredint8f allredopttf reducelocalf

inplacef: inplacef.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o inplacef inplacef.o  ${LIBS}
allredint8f: allredint8f.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o allredint8f allredint8f.o  ${LIBS}
allredopttf: allredopttf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o allredopttf allredopttf.o  ${LIBS}
reducelocalf: reducelocalf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o reducelocalf reducelocalf.o  ${LIBS}
uallreducef: uallreducef.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o uallreducef uallreducef.o  ${LIBS}
exscanf: exscanf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o exscanf exscanf.o  ${LIBS}
alltoallwf: alltoallwf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o alltoallwf alltoallwf.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  uallreducef.f exscanf.f alltoallwf.f inplacef.f allredint8f.f allredopttf.f \
	reducelocalf.f 
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------


testing:
	../../runtests -srcdir=$(srcdir) -tests=testlist \
			-mpiexec=$(bindir)/mpiexec \
		   	-xmlfile=summary.xml
../util/mtestf.o: 
	(cd ../util && $(MAKE) mtestf.o)

.POSIX:

FORCE_TARGET:


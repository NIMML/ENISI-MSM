# This Makefile.in created by simplemake.  Do not edit

# f77/spawn/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/f77/spawn
bindir          = ${exec_prefix}/bin
exec_prefix     = ${prefix}
prefix          = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/f77/spawn
LIBS            = -lpthread 
MAKE            = make
F77             = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpif77
FFLAGS          = 
F77_COMPILE     = $(F77) $(FFLAGS) $(F77INCLUDES)
F77_LINK       = $(F77)
LDFLAGS     =    ../util/mtestf.o 

VPATH = .
F77INCLUDES = -I. 

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
	-@rm -f *.o ${srcdir}/*.o spawnmult2f spawnmultf connaccf spawnf spawnargvf namepubf
	-@rm -f spawnmult2f.exe spawnmultf.exe connaccf.exe spawnf.exe spawnargvf.exe namepubf.exe
	-@rm -f core core.[0-9]*
	-@rm -f *.lo ${srcdir}/*.lo
	-@rm -f *.irlog*
distclean:  clean distclean-xxx remove-makefile
distclean-xxx:
	-@rm -f Makefile type1aint.h
	-@rm -rf autom4te*.cache
	-@rm -rf $(DEPS_DIR)
	-@rm -f TAGS
remove-makefile:
	rm -f Makefile
remove-genmakefiles:
	rm -f  Makefile
all-redirect: namepubf spawnf spawnargvf spawnmultf spawnmult2f connaccf

spawnmult2f: spawnmult2f.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o spawnmult2f spawnmult2f.o  ${LIBS}
spawnmultf: spawnmultf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o spawnmultf spawnmultf.o   ${LIBS}
connaccf: connaccf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o connaccf connaccf.o  ${LIBS}
spawnf: spawnf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o spawnf spawnf.o  ${LIBS}
spawnargvf: spawnargvf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o spawnargvf spawnargvf.o   ${LIBS}
namepubf: namepubf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o namepubf namepubf.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  namepubf.f spawnf.f spawnargvf.f spawnmultf.f spawnmult2f.f connaccf.f
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


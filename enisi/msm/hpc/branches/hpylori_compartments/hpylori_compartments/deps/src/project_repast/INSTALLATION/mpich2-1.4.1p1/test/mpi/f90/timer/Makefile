# This Makefile.in created by simplemake.  Do not edit

# f90/timer/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/f90/timer
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/f90/timer
LIBS            = -lpthread 
MAKE            = make
FC               = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpif90
FCFLAGS         = 
FC_COMPILE      = $(FC) $(FCFLAGS) $(FCINCLUDES)
FC_LINK        = $(FC)
LDFLAGS     =    

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
	-@rm -f *.o ${srcdir}/*.o wtimef90
	-@rm -f wtimef90.exe
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
all-redirect: wtimef90

wtimef90: wtimef90.o   
	$(FC_LINK) $(FCFLAGS) $(LDFLAGS) -o wtimef90 wtimef90.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  wtimef90.f90
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------

.POSIX:

FORCE_TARGET:


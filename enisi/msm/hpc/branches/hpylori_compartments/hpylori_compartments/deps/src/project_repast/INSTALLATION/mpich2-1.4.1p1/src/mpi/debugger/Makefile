# This Makefile.in created by simplemake.  Do not edit

# src/mpi/debugger/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
AR              = ar
AR_FLAGS        = cr
RANLIB          = ranlib
LIBTOOL         = 
CREATESHLIB     = false
ABIVERSION      = 3:3
LIBS            = -lrt -lpthread  
LDFLAGS         =  
C_LINK_SHL      = true
INSTALL         = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_SCRIPT  = ${INSTALL}
INSTALL_DATA    = ${INSTALL} -m 644
MKDIR_P         = mkdir -p
top_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpi/debugger
libdir          = ${exec_prefix}/lib
exec_prefix     = ${prefix}
prefix          = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH
master_top_srcdir  = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpi/debugger
top_srcdir      = ../../..
DEFS            = -DHAVE_CONFIG_H -I. -I${srcdir}
CPPFLAGS        =  -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpl/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpl/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/openpa/src -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/openpa/src -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/datatype -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/datatype -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/locks -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/locks -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/utils/monitor -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/utils/monitor -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/util/wrappers -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/util/wrappers
MAKE            = make
MPILIBNAME      = mpich
PMPILIBNAME     = pmpich

CC              = gcc
CFLAGS          =    -O2 $(MPICH2_MAKE_CFLAGS)
C_COMPILE       = $(CC) $(DEFS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS)
C_LINK         = $(CC)
CC_SHL          = true
C_COMPILE_SHL   = $(CC_SHL) $(DEFS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS)
LDFLAGS     =    

VPATH = .
mpi_sources = 
bindir = ${exec_prefix}/bin
MPIC_COMPILE = $(bindir)/mpicc
INCLUDES = -I../../include -I${top_srcdir}/src/include

.SUFFIXES:
.SUFFIXES: .o .lo .c 
.c.o:
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC              $<" ; \
	else \
	  echo $(C_COMPILE) -c $< ; \
	fi
	@$(C_COMPILE) -c $<
.c.lo:
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC              $<" ; \
	else \
	  echo $(C_COMPILE_SHL) -c $< -o _s$*.o ; \
	echo mv -f _s$*.o $*.lo ; \
	fi
	@$(C_COMPILE_SHL) -c $< -o _s$*.o
	@mv -f _s$*.o $*.lo
.c:
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC              $<" ; \
	else \
	  echo $(C_COMPILE) -o $* $< $(LDFLAGS) $(LIBS) ; \
	fi
	@$(C_COMPILE) -o $* $< $(LDFLAGS) $(LIBS)
apply: 
	$(ACTION) $(ACTION_INPUT)
clean:  clean-local
	-@rm -f *.o ${srcdir}/*.o qdemo tvtest
	-@rm -f .libstamp0 .libstamp1 .libstamp2 .libstamp3 
	-@rm -f qdemo.exe tvtest.exe
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
all-redirect: .libstamp0 ../../../lib/lib${MPILIBNAME}.a
	@if [ -n "" ] ; then \
	    ${MAKE} .libstamp2 || exit 1; \
	fi
	@if [ "none" != "none" ] ; then \
	    ${MAKE} .libstamp1 || exit 1; \
	    ${MAKE} libtvmpich2.so || exit 1; \
	    if [ -n "" ] ; then \
	        ${MAKE} .libstamp3 || exit 1; \
	    fi ; \
	fi

.libstamp0 ../../../lib/lib${MPILIBNAME}.a: dbginit.o 
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  AR ${AR_FLAGS} ../../../lib/lib${MPILIBNAME}.a $?" ; \
	else \
	  echo ${AR} ${AR_FLAGS} ../../../lib/lib${MPILIBNAME}.a $? ; \
	fi
	@${AR} ${AR_FLAGS} ../../../lib/lib${MPILIBNAME}.a $?
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  RANLIB          lib${MPILIBNAME}.a" ; \
	else \
	  echo ${RANLIB} ../../../lib/lib${MPILIBNAME}.a ; \
	fi
	@${RANLIB} ../../../lib/lib${MPILIBNAME}.a
	date > .libstamp0
.libstamp1 ../../../lib/lib${MPILIBNAME}.la: dbginit.lo 
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  AR ${AR_FLAGS} ../../../lib/lib${MPILIBNAME}.la $?" ; \
	else \
	  echo ${AR} ${AR_FLAGS} ../../../lib/lib${MPILIBNAME}.la $? ; \
	fi
	@${AR} ${AR_FLAGS} ../../../lib/lib${MPILIBNAME}.la $?
	date > .libstamp1
libtvmpich2.la: dll_mpich2.lo 
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  AR ${AR_FLAGS} libtvmpich2.la $?" ; \
	else \
	  echo ${AR} ${AR_FLAGS} libtvmpich2.la $? ; \
	fi
	@${AR} ${AR_FLAGS} libtvmpich2.la $?

# --------------------------------------------------------------------------
.libstamp2: 
.libstamp3: 
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# Install target
install:  FORCE_TARGET 
	if [ ! -d ${DESTDIR}${libdir} ] ; then $(MKDIR_P) ${DESTDIR}${libdir} ; fi
	if [ -s libtvmpich2.so ] ; then $(CREATESHLIB) -version-info $(ABIVERSION) --mode=install  libtvmpich2.so ${DESTDIR}${libdir}/libtvmpich2.so ; fi

install-strip:
	$(MAKE) INSTALL_STRIP_FLAG=-s install
uninstall: 
	-$(CREATESHLIB) --mode=uninstall libtvmpich2.so ${DESTDIR}${libdir}/libtvmpich2.so
installcheck: 
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  tvtest.c dll_mpich2.c dbgstub.c qdemo.c dbginit.c dll_mpich2.c
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------
# All of these routines are internal

# Used to build the queue example program

# tvtest builds a main program that uses the routines in dll_mpich2 to 
# access the internal structure of an MPICH2 program.  This is only a partial
# test, but it allows a developer to check out the basic functioning of 
# dll_mpich2 (but without loading it).
# tvtest can no longer be built using the mpich libraries - mpich2 no longer
# places all necessary object files into the MPILIBNAME or PMPILIBNAME libraries
#


# There is no static debugger interface library
# Force a custom target
./libtvmpich2.so: ./libtvmpich2.la
	(cd . && $(CREATESHLIB) -libtype= --mode=link -cc="" -clink="" -o libtvmpich2.la  -rpath $(libdir) -ldflags "$(LDFLAGS)")

#
# We need to make sure that dbginit is compiled with -g, so
# we use an explicit target.  Note that there are no PMPI functions in
# this directory)
dbginit.o: $(srcdir)/dbginit.c
	$(C_COMPILE) -g -c  $<

qdemo: $(srcdir)/qdemo.c
	$(MPIC_COMPILE) -o qdemo $<

tvtest: tvtest.o dll_mpich2.o dbgstub.o
	$(MPIC_COMPILE) -o tvtest tvtest.o dll_mpich2.o dbgstub.o

#
# We require special steps to compile the debugger interface library.
dll_mpich2.lo: $(srcdir)/dll_mpich2.c $(srcdir)/mpich2_dll_defs.h
	 $(DEFS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS) -g -c $(srcdir)/dll_mpich2.c -o _sdll_mpich2.o
	@mv -f _sdll_mpich2.o dll_mpich2.lo
#
# We may want to add some documentation on using the various debugger
# interfaces by adding the appropriate files to the doc lists


# Remove both the library file, shared library files, and any links for 
# versions of the shared libraries.
clean-local:
	rm -f libtvmpich2.*

.POSIX:

FORCE_TARGET:


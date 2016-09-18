#  (C) 1993 by Argonne National Laboratory and Mississipi State University.
#      All rights reserved.  See COPYRIGHT in top-level directory.
#

##### User configurable options #####

top_srcdir           = ..

CC                   = gcc
CC_SHL               = @CC_SHL@
CLINKER              = gcc
MPI_CC               = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/bin/mpicc
MPI_CLINKER          = $(MPI_CC)
AR                   = ar
ARFLAGS              = cr
RANLIB               = ranlib
MAKE                 = make --no-print-directory
MPI_CFLAGS           = 
MPI_LIBS             = 
INCLUDE_DIR          = -I.. -I${top_srcdir}/include \
                       -I${includebuild_dir} \
                       -I../../.. -I${top_srcdir}/../../include
PROF_LIBNAME         = mpe
CFLAGS               =    -O2
MPE_LIBDIR           = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/lib
LIB_PATH             = $(MPI_LIBS)
PROF_LIBS            = -L$(MPE_LIBDIR) @PROF_LIBS@ $(MPI_LIBS)
LDFLAGS              =   -Wl,--export-dynamic
MPE_BUILD_FORTRAN2C  = no
CC_DOES_C_O          = yes

### End User configurable options ###

SHELL            = /bin/bash
RM               = rm
MV               = mv
CP               = cp

VPATH=.:$(srcdir)

# Installation directories
prefix           = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH
exec_prefix      = ${prefix}
bindir           = ${exec_prefix}/bin
includedir       = ${prefix}/include
libdir           = ${exec_prefix}/lib
# Build directories
includebuild_dir = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/include
libbuild_dir     = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/lib
binbuild_dir     = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/bin
srcdir           = .

EXECS            = ${binbuild_dir}/check_callstack

CC_FLAGS         = $(INCLUDE_DIR) $(CFLAGS) $(MPE_COPTS)
CC_LDFLAGS       = $(LDFLAGS) $(CFLAGS) $(MPE_LDOPTS)
# MPE include path, x_INCS, goes in front of MPI include path, MPI_xFLAGS,
# in case MPI include path is in MPI_xFLAGS containing old MPE include path.
MPICC_FLAGS      = $(INCLUDE_DIR) $(MPI_CFLAGS) $(MPE_COPTS)
MPICC_LDFLAGS    = $(LDFLAGS) $(MPI_CFLAGS) $(MPE_LDOPTS)

MPE_CSOURCES     = iterator.c fancyprint.c
MPE_P_COBJECTS   = $(MPE_CSOURCES:.c=.po)
MPE_N_COBJECTS   = $(MPE_CSOURCES:.c=.no)

.SUFFIXES: .c .o .po .no .a 

.c.po:
	@if [ "$(CC_DOES_C_O)" = "yes" ]; then \
	     cmd="$(MPI_CC) $(MPICC_FLAGS) -o $@ -c $<" ; \
	 else \
	     cmd="$(MPI_CC) $(MPICC_FLAGS) -c $< ; $(MV) $*.o $*.po" ; \
	 fi ; \
	 echo "$${cmd}" ; $${cmd}

.c.no:
	@if [ "$(CC_DOES_C_O)" = "yes" ]; then \
	     cmd="$(CC) $(CC_FLAGS) -o $@ -c $<" ; \
	 else \
	     cmd="$(CC) $(CC_FLAGS) -c $< ; $(MV) $*.o $*.no" ; \
	 fi ; \
	 echo "$${cmd}" ; $${cmd}

# default_all is the same as default, but without the RANLIB.  This
# can speed up the build (ranlibs can take a LONG time).  profile_all
# is the same, but for the profile library
# **** Currently the same as default for simplicity ****
default_all: default
profile_all:

#
default: $(MPE_P_COBJECTS) $(MPE_N_COBJECTS)
	$(MAKE) $(MAKEOPTS) ${libbuild_dir}/lib$(PROF_LIBNAME)_nompi.a
	$(MAKE) $(MAKEOPTS) ${libbuild_dir}/lib$(PROF_LIBNAME).a
	$(MAKE) $(MAKEOPTS) $(EXECS)

#
# It is tempting here to use ... libmpe.a($(MPE_OBJECTS)) as the dependency,
# but this would require that all makes properly handle library dependencies.
# Since makes that DO are the exception rather than the rule, we don't
# use this form
#
# We've also had trouble with this.  Sometimes, under Solaris, the
# first file in the dependency is built but not included with $?
# This is clearly a bug in the make, since the determination of dependencies
# is done once (e.g., a blip in the filesystem time can't be
# responsible if make works as Sun documents it).  To fix this, we
# add all the objects to the library, not just the "recent" ones.
${libbuild_dir}/lib$(PROF_LIBNAME).a: $(MPE_P_COBJECTS)
	$(AR) $(ARFLAGS) $@ $(MPE_P_COBJECTS)
	$(RANLIB) $@

${libbuild_dir}/lib$(PROF_LIBNAME)_nompi.a: $(MPE_N_COBJECTS)
	$(AR) $(ARFLAGS) $@ $(MPE_N_COBJECTS)
	$(RANLIB) $@

# Link with *.o instead of *.no
# as NEC SX-8's cross-compiler refuses to link with *.no
${binbuild_dir}/check_callstack: check_callstack.no
	$(CP) -f check_callstack.no mpe2tmp.o
	$(CLINKER) $(CC_LDFLAGS) -o $@ mpe2tmp.o \
	                         -L${libbuild_dir} -l$(PROF_LIBNAME)_nompi
	@-$(RM) -f mpe2tmp.o

#
# Remove the old libraries before rebuilding (in case they came from another
# architecture or are otherwise damaged)
rmlib:
	@-$(RM) -f ${libbuild_dir}/lib$(PROF_LIBNAME).a
	@-$(RM) -f ${libbuild_dir}/lib$(PROF_LIBNAME)_nompi.a

rmprog:
	@-$(RM) -f $(EXECS)

clean: rmprog
	@-$(RM) -f ${srcdir}/*.*o *.*o *~ PI*

distclean: clean rmlib
	@-$(RM) -f Makefile

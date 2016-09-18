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
DEBUG_LIBS           = 
MPI_CFLAGS           = 
MPI_LIBS             = 
INCLUDE_DIR          = -I.. -I${top_srcdir}/include \
                       -I${includebuild_dir} \
                       -I../../.. -I${top_srcdir}/../../include 
PROF_LIBNAME         = mpe
ANIM_LIBNAME         = ampe
CFLAGS               =    -O2
MPE_BUILD_FORTRAN2C  = no
MPE_LIBDIR           = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/lib
LIB_PATH             = -lX11 $(MPI_LIBS)
LDFLAGS              =  
CC_DOES_C_O          = yes

### End User configurable options ###

SHELL            = /bin/bash
RM               = rm
MV               = mv

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

EXECS            =

# MPE include path, x_INCS, goes in front of MPI include path, MPI_xFLAGS,
# in case MPI include path is in MPI_xFLAGS containing old MPE include path.
CC_FLAGS         = $(INCLUDE_DIR) $(CFLAGS) $(MPE_COPTS)
CC_LDFLAGS       = $(LDFLAGS) $(CFLAGS) $(MPE_LDOPTS)
MPICC_FLAGS      = $(INCLUDE_DIR) $(MPI_CFLAGS) $(MPE_COPTS)
MPICC_LDFLAGS    = $(LDFLAGS) $(MPI_CFLAGS) $(MPE_LDOPTS)

# GETNAME_DEFS are needed by mpehname.c
MPE_CSOURCES     = mpe_graphics.c xcolor.c xframe.c xinit.c xwmap.c \
                   xmouse.c xkey.c
MPE_P_COBJECTS   = $(MPE_CSOURCES:.c=.po)
MPE_N_COBJECTS   = $(MPE_CSOURCES:.c=.no)

MPE_WSOURCES     = mpe_graphicsf.c xmousef.c
MPE_P_WOBJECTS   = $(MPE_WSOURCES:.c=.po)
# MPE_N_WOBJECTS   = $(MPE_WSOURCES:.c=.no)

MPE_XSOURCES     = visual_mess.c
MPE_P_XOBJECTS   = $(MPE_XSOURCES:.c=.po)
# MPE_N_XOBJECTS   = $(MPE_XSOURCES:.c=.no)

MPE_SHLCOBJECTS  = $(MPE_COBJECTS:.o=.lo)
MPE_SHLWOBJECTS  = $(MPE_WOBJECTS:.o=.lo)

.SUFFIXES: .c .o .po .no .lo .a 

.c.po:
	@if [ "$(CC_DOES_C_O)" = "yes" ]; then \
	     cmd="$(MPI_CC) $(MPICC_FLAGS) -o $@ -c $<" ; \
	 else \
	     cmd="$(MPI_CC) $(MPICC_FLAGS) -c $< ; $(MV) $*.o $*.po" ; \
	 fi ; \
	 echo "$${cmd}" ; $${cmd}

.c.no:
	@if [ "$(CC_DOES_C_O)" = "yes" ]; then \
	     cmd="$(CC) $(CC_FLAGS) -DMPE_NOMPI -o $@ -c $<" ; \
	 else \
	     cmd="$(CC) $(CC_FLAGS) -DMPE_NOMPI -c $< ; $(MV) $*.o $*.no" ; \
	 fi ; \
	 echo "$${cmd}" ; $${cmd}

# Allow compilers that do not allow -o for renaming object files
.c.lo:
	$(CC_SHL) $(CC_FLAGS) -c $< $(INC_DIR)
	@$(MV) $*.o $*.lo

# default_all is the same as default, but without the RANLIB.  This
# can speed up the build (ranlibs can take a LONG time).  profile_all 
# is the same, but for the profile library
# **** Currently the same as default for simplicity ****
default_all: default
profile_all: 

#
default: $(MPE_N_COBJECTS) $(MPE_P_COBJECTS) $(MPE_P_XOBJECTS)
	 $(MAKE) $(MAKEOPTS) ${libbuild_dir}/lib$(PROF_LIBNAME)_nompi.a 
	 $(MAKE) $(MAKEOPTS) ${libbuild_dir}/lib$(PROF_LIBNAME).a 
	 $(MAKE) $(MAKEOPTS) ${libbuild_dir}/lib$(ANIM_LIBNAME).a

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
	@if [ "$(MPE_BUILD_FORTRAN2C)" = "yes" ] ; then \
	     $(MAKE) $(MAKEOPTS) $(MPE_P_WOBJECTS) ; \
	     $(AR) $(ARFLAGS) $@ $(MPE_P_WOBJECTS) ; \
	 fi
	$(RANLIB) $@

${libbuild_dir}/lib$(ANIM_LIBNAME).a: $(MPE_P_XOBJECTS)
	$(AR) $(ARFLAGS) $@ $(MPE_P_XOBJECTS)
	$(RANLIB) $@

${libbuild_dir}/lib$(PROF_LIBNAME)_nompi.a: $(MPE_N_COBJECTS)
	$(AR) $(ARFLAGS) $@ $(MPE_N_COBJECTS)
	$(RANLIB) $@

# ********

#
# Remove the old libraries before rebuilding (in case they came from another
# architecture or are otherwise damaged)
rmlib:
	@-$(RM) -f ${libbuild_dir}/lib$(PROF_LIBNAME).a 
	@-$(RM) -f ${libbuild_dir}/lib$(ANIM_LIBNAME).a 
	@-$(RM) -f ${libbuild_dir}/lib$(PROF_LIBNAME)_nompi.a

rmprog:
	@-$(RM) -f $(EXECS)

clean: rmprog
	@-$(RM) -f *.*o ${srcdir}/*.*o *~ PI*

distclean: clean rmlib
	@-$(RM) -f Makefile Makefile_nompi

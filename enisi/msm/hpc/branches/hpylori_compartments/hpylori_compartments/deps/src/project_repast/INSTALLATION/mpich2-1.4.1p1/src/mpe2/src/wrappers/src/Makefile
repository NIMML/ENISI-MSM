#  (C) 1993 by Argonne National Laboratory and Mississipi State University.
#      All rights reserved.  See COPYRIGHT in top-level directory.
#

##### User configurable options #####

top_srcdir           = ..

CC                   = gcc
CC_SHL               = @CC_SHL@
CLINKER              = gcc
MPI_CC               = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/bin/mpicc
MPI_F77              = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/bin/mpif77
MPI_CLINKER          = $(MPI_CC)
AR                   = ar
ARFLAGS              = cr
RANLIB               = ranlib
MAKE                 = make --no-print-directory
MPI_CFLAGS           = 
MPI_FFLAGS           = 
MPI_LIBS             = 
INCLUDE_DIR          = -I.. -I${top_srcdir}/include \
                       -I${includebuild_dir} \
                       -I../../.. -I${top_srcdir}/../../include
LOG_LIBNAME          = lmpe
TRACE_LIBNAME        = tmpe
F2CMPI_LIBNAME       = mpe_f2cmpi
F2CMPI_LIBS          = 
CFLAGS               =    -O2
MPE_LIBDIR           = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/lib
LIB_PATH             = $(MPI_LIBS)
LDFLAGS              =  
MPE_BUILD_FORTRAN2C  = no

### End User configurable options ###

SHELL            = /bin/bash
RM               = rm
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

EXECS            = 

# GETNAME_DEFS are needed by mpehname.c
CC_FLAGS         = $(INCLUDE_DIR) $(CFLAGS) $(MPE_COPTS)
CC_LDFLAGS       = $(LDFLAGS) $(CFLAGS) $(MPE_LDOPTS)
# MPE include path, x_INCS, goes in front of MPI include path, MPI_xFLAGS,
# in case MPI include path is in MPI_xFLAGS containing old MPE include path.
MPICC_FLAGS      = $(INCLUDE_DIR) $(MPI_CFLAGS) $(MPE_COPTS)
MPIFC_FLAGS      = $(MPI_FFLAGS) $(MPE_FOPTS)
MPICC_LDFLAGS    = $(LDFLAGS) $(MPI_CFLAGS) $(MPE_LDOPTS)

MPE_LOG_CSRC     = log_mpi_util.c log_mpi_core.c
MPE_LOG_OBJS     = $(MPE_LOG_CSRC:.c=.o)

MPE_TRACE_CSRC   = trace_mpi_core.c
MPE_TRACE_OBJS   = $(MPE_TRACE_CSRC:.c=.o)

MPE_F2C_CSRC     = log_mpi_util.c mpe_proff.c
MPE_F2C_FSRC     = mpi_f2c_consts.f
MPE_F2C_OBJS     = $(MPE_F2C_FSRC:.f=.o) $(MPE_F2C_CSRC:.c=.o)

MPE_LOG_SHLOBJS  = $(MPE_LOG_OBJS:.o=.lo)
MPE_F2C_SHLOBJS  = $(MPE_F2C_OBJS:.o=.lo)
MPE_TRACE_SHLOBJS= $(MPE_TRACE_OBJS:.o=.lo)

.SUFFIXES: .c .f .o .lo .a 

.c.o:
	$(MPI_CC) $(MPICC_FLAGS) -c $<

.f.o:
	$(MPI_F77) $(MPIFC_FLAGS) -c $<

# Allow compilers that do not allow -o for renaming object files
.c.lo:
	$(CC_SHL) $(CC_FLAGS) -c $< $(INC_DIR)
	@mv $*.o $*.lo

# default_all is the same as default, but without the RANLIB.  This
# can speed up the build (ranlibs can take a LONG time).  profile_all 
# is the same, but for the profile library
# **** Currently the same as default for simplicity ****
default_all: default
profile_all: 

# MPE_BUILD_FORTRAN2C=yes is a necessary but insufficient condition to build
# libmpe_f2cmpi.a.  Because MPE_BUILD_FORTRAN2C is a directive from top-level
# configure, src/wrappers needs, "${F2CMPI_LIBS}" = "-l${F2CMPI_LIBNAME}" set
# by src/wrappers/configure, to be fulfilled to guarantee that libmpe_f2cmpi.a
# is needed and all the pre-requisites of libmpe_f2cmpi.a are met.
default: $(MPE_LOG_OBJS) $(MPE_TRACE_OBJS)
	 $(MAKE) $(MAKEOPTS) ${libbuild_dir}/lib$(LOG_LIBNAME).a
	 $(MAKE) $(MAKEOPTS) ${libbuild_dir}/lib$(TRACE_LIBNAME).a
	@if [    "$(MPE_BUILD_FORTRAN2C)" = "yes" \
	      -a "${F2CMPI_LIBS}" = "-l${F2CMPI_LIBNAME}" ] ; then \
	     $(MAKE) $(MAKEOPTS) ${libbuild_dir}/lib$(F2CMPI_LIBNAME).a ; \
	 fi
	 $(MAKE) $(MAKEOPTS) ${libbuild_dir}/mpe_prof.o

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
${libbuild_dir}/lib$(LOG_LIBNAME).a: $(MPE_LOG_OBJS)
	$(AR) $(ARFLAGS) $@ $(MPE_LOG_OBJS)
	$(RANLIB) $@

${libbuild_dir}/lib$(TRACE_LIBNAME).a: $(MPE_TRACE_OBJS)
	$(AR) $(ARFLAGS) $@ $(MPE_TRACE_OBJS)
	$(RANLIB) $@

${libbuild_dir}/lib$(F2CMPI_LIBNAME).a: $(MPE_F2C_OBJS)
	$(AR) $(ARFLAGS) $@ $(MPE_F2C_OBJS)
	$(RANLIB) $@

${libbuild_dir}/mpe_prof.o: mpe_prof.o
	@-if [ "${libbuild_dir}" != "." ] ; then \
	      $(CP) mpe_prof.o ${libbuild_dir} ; \
	  fi

#
# Remove the old libraries before rebuilding (in case they came from another
# architecture or are otherwise damaged)
rmlib:
	@-$(RM) -f ${libbuild_dir}/lib$(LOG_LIBNAME).a 
	@-$(RM) -f ${libbuild_dir}/lib$(TRACE_LIBNAME).a 
	@-$(RM) -f ${libbuild_dir}/lib$(F2CMPI_LIBNAME).a 
	@-$(RM) -f ${libbuild_dir}/mpe_prof.o

rmprog:
	@-$(RM) -f $(EXECS)

clean: rmprog
	@-$(RM) -f *.o ${srcdir}/*.o *~ PI*
	@-$(RM) -f *.gcno *.gcda *.bb *.bbg
	@-$(RM) -f ${srcdir}/*.gcno ${scrdir}/*.gcda

distclean: clean rmlib
	@-$(RM) -f Makefile

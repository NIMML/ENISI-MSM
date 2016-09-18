#
#  (C) 2004 by Argonne National Laboratory.
#      See COPYRIGHT in top-level directory.
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
MPI_FFLAGS           = 
MPI_LIBS             = 
INCLUDE_DIR          = -I.. -I${top_srcdir}/include \
                       -I${includebuild_dir} \
                       -I../../.. -I${top_srcdir}/../../include
COLLCHK_LIBNAME      = mpe_collchk
CFLAGS               =    -O2
MPE_LIBDIR           = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/lib
LIB_PATH             = $(MPI_LIBS)
LDFLAGS              =  
MPE_BUILD_FORTRAN2C  = no

COLLCHK_BUILD_EXSCAN = yes
COLLCHK_BUILD_ALLW   = yes
COLLCHK_BUILD_IO     = yes
COLLCHK_BUILD_RMA    = yes
COLLCHK_BUILD_COMMS  = yes

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
MPICC_LDFLAGS    = $(LDFLAGS) $(MPI_CFLAGS) $(MPE_LDOPTS)


UTIL_SRC     = begin.c err_han.c is_init.c \
               check_buff.c check_dims.c check_graph.c check_size.c \
               same_amode.c same_call.c same_dtype.c same_high_low.c \
               same_int.c same_local_leader.c same_op.c same_root.c \
               same_tag.c same_datarep.c same_whence.c
UTIL_OBJ     = $(UTIL_SRC:.c=.o)

MPI_CORE_SRC = allgather.c allgatherv.c allreduce.c alltoall.c alltoallv.c \
               barrier.c bcast.c cart_create.c cart_map.c \
               gather.c gatherv.c graph_create.c graph_map.c init.c \
               intercomm_create.c intercomm_merge.c reduce.c reduce_scatter.c \
               scan.c scatter.c scatterv.c finalize.c
MPI_CORE_OBJ = $(MPI_CORE_SRC:.c=.o)

MPI_EXSCAN_SRC  = exscan.c
MPI_EXSCAN_OBJ  = $(MPI_EXSCAN_SRC:.c=.o)
MPI_ALLW_SRC    = alltoallw.c
MPI_ALLW_OBJ    = $(MPI_ALLW_SRC:.c=.o)

MPI_IO_SRC   = file_open.c file_preallocate.c file_read_all_begin.c \
               file_read_all.c file_read_all_end.c file_read_at_all_begin.c \
               file_read_at_all.c file_read_at_all_end.c \
               file_read_ordered_begin.c file_read_ordered.c \
               file_read_ordered_end.c file_seek_shared.c \
               file_set_atomicity.c file_set_size.c \
               file_set_view.c file_write_all_begin.c \
               file_write_all.c file_write_all_end.c \
               file_write_at_all_begin.c file_write_at_all.c \
               file_write_at_all_end.c file_write_ordered_begin.c \
               file_write_ordered.c file_write_ordered_end.c \
               add_fh.c get_fh.c
MPI_IO_OBJ   = $(MPI_IO_SRC:.c=.o)

MPI_COMM_SRC = comm_accept.c comm_connect.c comm_create.c comm_disconnect.c \
               comm_dup.c comm_spawn.c comm_spawn_multiple.c comm_split.c
MPI_COMM_OBJ = $(MPI_COMM_SRC:.c=.o)

MPI_RMA_SRC  = win_create.c win_fence.c add_win.c get_win.c
MPI_RMA_OBJ  = $(MPI_RMA_SRC:.c=.o)


.SUFFIXES: .c .o .lo .a 

.c.o:
	$(MPI_CC) $(MPICC_FLAGS) -c $<

default:
	$(MAKE) $(MAKEOPTS) ${libbuild_dir}/lib$(COLLCHK_LIBNAME).a

${libbuild_dir}/lib$(COLLCHK_LIBNAME).a: $(UTIL_OBJ) $(MPI_CORE_OBJ)
	@if [ "${COLLCHK_BUILD_EXSCAN}" = "yes" ] ; then \
	     $(MAKE) $(MAKEOPTS) $(MPI_EXSCAN_OBJ) ; \
	 fi
	@if [ "${COLLCHK_BUILD_ALLW}" = "yes" ] ; then \
	     $(MAKE) $(MAKEOPTS) $(MPI_ALLW_OBJ) ; \
	 fi
	@if [ "${COLLCHK_BUILD_IO}" = "yes" ] ; then \
	     $(MAKE) $(MAKEOPTS) $(MPI_IO_OBJ) ; \
	 fi
	@if [ "${COLLCHK_BUILD_RMA}" = "yes" ] ; then \
	     $(MAKE) $(MAKEOPTS) $(MPI_RMA_OBJ) ; \
	 fi
	@if [ "${COLLCHK_BUILD_COMMS}" = "yes" ] ; then \
	     $(MAKE) $(MAKEOPTS) $(MPI_COMM_OBJ) ; \
	 fi
	$(AR) $(ARFLAGS) $@ *.o
	$(RANLIB) $@

# Remove the old libraries before rebuilding (in case they came from another
# architecture or are otherwise damaged)
rmlib:
	@-$(RM) -f ${libbuild_dir}/lib$(COLLCHK_LIBNAME).a

rmprog:
	@-$(RM) -f $(EXECS)

clean: rmprog
	@-$(RM) -f *.o ${srcdir}/*.o *~ PI*
	@-$(RM) -f *.gcno *.gcda *.bb *.bbg
	@-$(RM) -f ${srcdir}/*.gcno ${scrdir}/*.gcda

distclean: clean 
	@-$(RM) -f Makefile


##### User configurable options #####

MPI_CC      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/bin/mpicc
MPI_CLINKER = $(MPI_CC)
#
MPI_CFLAGS  = 
MPI_LIBS    = 
CFLAGS      =    -O2
MPE_INCDIR  = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/include
MPE_LIBDIR  = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/lib
PROF_LIBS   = -L$(MPE_LIBDIR) -lmpe -lX11 $(MPI_LIBS) -lm
#
INCLUDE_DIR = -I$(MPE_INCDIR)
LDFLAGS     =  

### End User configurable options ###

RM          = rm

VPATH=.:$(srcdir)

srcdir         = .

# MPE include path, x_INCS, goes in front of MPI include path, MPI_xFLAGS,
# in case MPI include path is in MPI_xFLAGS containing old MPE include path.
MPICC_FLAGS    = $(INCLUDE_DIR) $(MPI_CFLAGS) $(MPE_COPTS)
MPICC_LDFLAGS  = $(LDFLAGS) $(MPI_CFLAGS) $(MPE_LDOPTS)
EXECS          = gmm mm vb

.SUFFIXES: .c .o 

.c.o:
	$(MPI_CC) $(MPICC_FLAGS) -c $<

.o:
	$(MPI_CLINKER) $(MPICC_LDFLAGS) -o $@ $< $(PROF_LIBS)

default: $(EXECS)

gmm.o:	gmm.c
	$(MPI_CC) $(MPICC_FLAGS) -DUSE_GRAPHICS -c $?

mm.o:	gmm.c
	$(MPI_CC) $(MPICC_FLAGS) -c -o mm.o $?

vb.o:	vb.c
	$(MPI_CC) $(MPICC_FLAGS) -c $?

clean:
	@-$(RM) -f *.o *~ PI* $(EXECS) gmmlog

distclean: clean
	@-$(RM) -f Makefile

ALL: default
##### User configurable options #####

MPI_CC      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/bin/mpicc
MPI_CLINKER = $(MPI_CC)
#
MPI_CFLAGS  = 
MPI_LIBS    = 
CFLAGS      =    -O2
MPE_GRAPH   = @MPE_GRAPHICS@
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
EXECS          = pmandel

.SUFFIXES: .c .o 

.c.o:
	$(MPI_CC) $(MPICC_FLAGS) -c $<

default: $(EXECS)

fract_gen.o: fract_gen.h pmandel.h

pm_genproc.o: pmandel.h fract_gen.h

pmandel.o: pmandel.h fract_gen.h lists.h pm_genproc.h

pm_separate_rect.o: pmandel.h pm_genproc.h

pmandel: pmandel.o pm_genproc.o fract_gen.o pm_separate_rect.o lists.o args.o
	$(MPI_CLINKER) $(MPICC_LDFLAGS) -o $@ $? $(PROF_LIBS)

clean:
	@-$(RM) -f *.o *~ PI* $(EXECS) *.log *.out *.ln

distclean: clean
	@-$(RM) -f Makefile

lint:
	lint -chv $(MPE_GRAPH) $(INCLUDE_DIR) $(MPI_CFLAGS) pmandel.c \
	          pm_genproc.c fract_gen.c pm_separate_rect.c lists.c args.c

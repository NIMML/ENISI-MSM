CC          = gcc
AR          = ar cr
RANLIB      = ranlib
LIBNAME     = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/lib/libmpich.a
srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpi/romio/mpi2-other/array/fortran

INCLUDE_DIR = -I. -I../../../include -I${srcdir}/../../../mpi-io -I${srcdir}/../../../adio/include -I../../../adio/include
CFLAGS      =    -O2  -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_ROMIOCONF_H -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 $(MPIOPROFILE) $(INCLUDE_DIR)

VPATH=.:${srcdir}

MPIO_FOBJECTS = subarrayf.o darrayf.o

MPIO_TMP_PFOBJECTS = subarrayf.p darrayf.p

MPIO_REAL_PFOBJECTS = _subarrayf.o _darrayf.o

all: $(LIBNAME)

.SUFFIXES: $(SUFFIXES) .p

.c.o:
	$(CC) $(CFLAGS) -c $<

.c.p:
	@cp $(srcdir)/$*.c _$*.c
	$(CC) $(CFLAGS) -c _$*.c
	@rm -f _$*.c

profile: $(MPIO_REAL_PFOBJECTS)
	$(AR) $(LIBNAME) $(MPIO_REAL_PFOBJECTS)
	$(RANLIB) $(LIBNAME) 
	@rm -f _*.o

$(LIBNAME): $(MPIO_FOBJECTS)
	$(AR) $(LIBNAME) $(MPIO_FOBJECTS)
	$(RANLIB) $(LIBNAME) 

clean: 
	@rm -f *.o *.lo *.gcno *.gcda *.bb *.bbg
	@rm -f ${srcdir}/*.gcno ${srcdir}/*.gcda 
	@rm -f ${srcdir}/*.bb ${srcdir}/*.bbg

# Rules for the profiling objects
_subarrayf.o: subarrayf.c
	$(CC) $(CFLAGS) -c $(srcdir)/subarrayf.c -o _subarrayf.o
_darrayf.o: darrayf.c
	$(CC) $(CFLAGS) -c $(srcdir)/darrayf.c -o _darrayf.o

# This Makefile.in created by simplemake.  Do not edit

# threads/pt2pt/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/threads/pt2pt
bindir          = ${exec_prefix}/bin
exec_prefix     = ${prefix}
prefix          = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/threads/pt2pt
DEFS            = -DHAVE_CONFIG_H -I. -I${srcdir}
CPPFLAGS        = 
LIBS            = -lpthread 
MAKE            = make
CC              = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpicc
CFLAGS          =   $(MPICH2_MAKE_CFLAGS)
C_COMPILE       = $(CC) $(DEFS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS)
C_LINK         = $(CC)
LDFLAGS     =    ../../util/mtest.o ../util/mtestthread.o

VPATH = .
INCLUDES = -I../../include -I${srcdir}/../../include

.SUFFIXES:
.SUFFIXES: .o .c 
.c.o:
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC              $<" ; \
	else \
	  echo $(C_COMPILE) -c $< ; \
	fi
	@$(C_COMPILE) -c $<
.c:
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC              $<" ; \
	else \
	  echo $(C_COMPILE) -o $* $< $(LDFLAGS) $(LIBS) ; \
	fi
	@$(C_COMPILE) -o $* $< $(LDFLAGS) $(LIBS)
apply: 
	$(ACTION) $(ACTION_INPUT)
clean: 
	-@rm -f *.o ${srcdir}/*.o multisend2 alltoall multisend multisend4 multisend3 greq_test greq_wait threaded_sr threads sendselfth
	-@rm -f multisend2.exe alltoall.exe multisend.exe multisend4.exe multisend3.exe greq_test.exe greq_wait.exe threaded_sr.exe threads.exe sendselfth.exe
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
all-redirect: threads threaded_sr alltoall sendselfth greq_wait greq_test multisend multisend2\
	 multisend3 multisend4

multisend2: multisend2.o    ../../util/mtest.o ../util/mtestthread.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o multisend2 multisend2.o  ${LIBS}
alltoall: alltoall.o    ../../util/mtest.o ../util/mtestthread.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o alltoall alltoall.o  ${LIBS}
multisend: multisend.o    ../../util/mtest.o ../util/mtestthread.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o multisend multisend.o  ${LIBS}
multisend4: multisend4.o    ../../util/mtest.o ../util/mtestthread.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o multisend4 multisend4.o  ${LIBS}
multisend3: multisend3.o    ../../util/mtest.o ../util/mtestthread.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o multisend3 multisend3.o  ${LIBS}
greq_test: greq_test.o    ../../util/mtest.o ../util/mtestthread.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o greq_test greq_test.o  ${LIBS}
greq_wait: greq_wait.o    ../../util/mtest.o ../util/mtestthread.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o greq_wait greq_wait.o  ${LIBS}
threaded_sr: threaded_sr.o    ../../util/mtest.o ../util/mtestthread.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o threaded_sr threaded_sr.o  -lpthread  ${LIBS}
threads: threads.o    ../../util/mtest.o ../util/mtestthread.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o threads threads.o  ${LIBS}
sendselfth: sendselfth.o    ../../util/mtest.o ../util/mtestthread.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o sendselfth sendselfth.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  threads.c threaded_sr.c alltoall.c sendselfth.c greq_wait.c greq_test.c \
	multisend.c multisend2.c multisend3.c multisend4.c 
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------

# Use extra programs to list programs that should not be built by default.


../../util/mtest.o:
	(cd ../../util && $(MAKE) mtest.o)
../util/mtestthread.o:
	(cd ../util && $(MAKE) mtestthread.o)

# A special testing target to simplify running just the thread pt2pt tests
testing:
	../../runtests -srcdir=$(srcdir) -tests=testlist \
		   -mpiexec=$(bindir)/mpiexec \
		   -xmlfile=summary.xml

.POSIX:

FORCE_TARGET:


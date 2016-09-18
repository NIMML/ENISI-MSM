# This Makefile.in created by simplemake.  Do not edit

# perf/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/perf
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/perf
DEFS            = -DHAVE_CONFIG_H -I. -I${srcdir}
CPPFLAGS        = 
LIBS            = -lpthread 
MAKE            = make
CC              = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpicc
CFLAGS          =   $(MPICH2_MAKE_CFLAGS)
C_COMPILE       = $(CC) $(DEFS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS)
C_LINK         = $(CC)
LDFLAGS     =    ../util/mtest.o

VPATH = .
INCLUDES = -I../include -I${srcdir}/../include

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
clean:  clean-local
	-@rm -f *.o ${srcdir}/*.o manyrma non_zero_root dtpack commcreatep timer sendrecvl allredtrace twovec transp-datatype
	-@rm -f manyrma.exe non_zero_root.exe dtpack.exe commcreatep.exe timer.exe sendrecvl.exe allredtrace.exe twovec.exe transp-datatype.exe
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
all-redirect: transp-datatype non_zero_root sendrecvl twovec dtpack allredtrace commcreatep timer\
	 manyrma

manyrma: manyrma.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o manyrma manyrma.o  ${LIBS}
non_zero_root: non_zero_root.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o non_zero_root non_zero_root.o  ${LIBS}
dtpack: dtpack.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o dtpack dtpack.o  ${LIBS}
commcreatep: commcreatep.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o commcreatep commcreatep.o  ${LIBS}
timer: timer.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o timer timer.o  ${LIBS}
sendrecvl: sendrecvl.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o sendrecvl sendrecvl.o  ${LIBS}
allredtrace: allredtrace.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o allredtrace allredtrace.o  ${LIBS}
twovec: twovec.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o twovec twovec.o  ${LIBS}
transp-datatype: transp-datatype.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o transp-datatype transp-datatype.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  transp-datatype.c non_zero_root.c sendrecvl.c twovec.c dtpack.c allredtrace.c \
	commcreatep.c timer.c manyrma.c 
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------


../util/mtest.o:
	(cd ../util && $(MAKE) mtest.o)

# A special testing target to simplify running just the performance tests
testing:
	../runtests -srcdir=$(srcdir) -tests=testlist \
		   -mpiexec=/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpiexec \
		   -xmlfile=summary.xml

clean-local:
	-rm -f summary.xml

.POSIX:

FORCE_TARGET:


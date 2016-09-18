# This Makefile.in created by simplemake.  Do not edit

# init/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/init
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/init
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
	-@rm -f *.o ${srcdir}/*.o exitst3 timeout exitst2 version attrself finalized exitst1 initstat
	-@rm -f exitst3.exe timeout.exe exitst2.exe version.exe attrself.exe finalized.exe exitst1.exe initstat.exe
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
all-redirect: attrself exitst1 exitst2 exitst3 initstat version timeout finalized

exitst3: exitst3.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o exitst3 exitst3.o  ${LIBS}
timeout: timeout.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o timeout timeout.o  ${LIBS}
exitst2: exitst2.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o exitst2 exitst2.o  ${LIBS}
version: version.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o version version.o  ${LIBS}
attrself: attrself.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o attrself attrself.o  ${LIBS}
finalized: finalized.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o finalized finalized.o  ${LIBS}
exitst1: exitst1.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o exitst1 exitst1.o  ${LIBS}
initstat: initstat.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o initstat initstat.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  attrself.c exitst1.c exitst2.c exitst3.c initstat.c version.c timeout.c \
	finalized.c 
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------

# isendirecv contains features that not all systems support (e.g., the
# sincos call, not available on IRIX).

../util/mtest.o:
	(cd ../util && $(MAKE) mtest.o)

# A special testing target to simplify running just the init tests
testing:
	../runtests -srcdir=$(srcdir) -tests=testlist \
		   -mpiexec=/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpiexec \
		   -xmlfile=summary.xml
clean-local:
	-rm -f summary.xml

.POSIX:

FORCE_TARGET:


# This Makefile.in created by simplemake.  Do not edit

# errors/pt2pt/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/errors/pt2pt
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/errors/pt2pt
DEFS            = -DHAVE_CONFIG_H -I. -I${srcdir}
CPPFLAGS        = 
LIBS            = -lpthread 
MAKE            = make
CC              = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpicc
CFLAGS          =   $(MPICH2_MAKE_CFLAGS)
C_COMPILE       = $(CC) $(DEFS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS)
C_LINK         = $(CC)
LDFLAGS     =    ../../util/mtest.o

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
	-@rm -f *.o ${srcdir}/*.o errinstatta errinstatws truncmsg2 proberank errinstatts errinstatwa truncmsg1
	-@rm -f errinstatta.exe errinstatws.exe truncmsg2.exe proberank.exe errinstatts.exe errinstatwa.exe truncmsg1.exe
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
all-redirect: proberank truncmsg1 truncmsg2 errinstatts errinstatta errinstatws errinstatwa

errinstatta: errinstatta.o    ../../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o errinstatta errinstatta.o  ${LIBS}
errinstatws: errinstatws.o    ../../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o errinstatws errinstatws.o  ${LIBS}
truncmsg2: truncmsg2.o    ../../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o truncmsg2 truncmsg2.o  ${LIBS}
proberank: proberank.o    ../../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o proberank proberank.o  ${LIBS}
errinstatts: errinstatts.o    ../../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o errinstatts errinstatts.o  ${LIBS}
errinstatwa: errinstatwa.o    ../../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o errinstatwa errinstatwa.o  ${LIBS}
truncmsg1: truncmsg1.o    ../../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o truncmsg1 truncmsg1.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  proberank.c truncmsg1.c truncmsg2.c errinstatts.c errinstatta.c errinstatws.c \
	errinstatwa.c 
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------

# Use extra programs to list programs that should not be built by default.


../../util/mtest.o:
	(cd ../../util && $(MAKE) mtest.o)

.POSIX:

FORCE_TARGET:


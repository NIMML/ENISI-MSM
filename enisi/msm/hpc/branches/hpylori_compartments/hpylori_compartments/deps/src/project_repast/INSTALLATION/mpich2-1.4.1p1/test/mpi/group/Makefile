# This Makefile.in created by simplemake.  Do not edit

# group/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/group
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/group
top_srcdir      = ..
DEFS            = -DHAVE_CONFIG_H -I. -I${srcdir}
CPPFLAGS        = 
LIBS            = -lpthread 
MAKE            = make
CC              = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpicc
CFLAGS          =   $(MPICH2_MAKE_CFLAGS)
C_COMPILE       = $(CC) $(DEFS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS)
C_LINK         = $(CC)
LDFLAGS     =    

VPATH = .
INCLUDES = -I../include -I${top_srcdir}/include

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
	-@rm -f *.o ${srcdir}/*.o glpid groupcreate grouptest2 grouptest gtranksperf gtranks groupnullincl
	-@rm -f glpid.exe groupcreate.exe grouptest2.exe grouptest.exe gtranksperf.exe gtranks.exe groupnullincl.exe
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
all-redirect: grouptest grouptest2 groupcreate gtranks groupnullincl gtranksperf

glpid: glpid.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o glpid glpid.o  ${LIBS}
groupcreate: groupcreate.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o groupcreate groupcreate.o  ${LIBS}
grouptest2: grouptest2.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o grouptest2 grouptest2.o  ${LIBS}
grouptest: grouptest.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o grouptest grouptest.o  ${LIBS}
gtranksperf: gtranksperf.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o gtranksperf gtranksperf.o  ../util/mtest.o ${LIBS}
gtranks: gtranks.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o gtranks gtranks.o  ../util/mtest.o ${LIBS}
groupnullincl: groupnullincl.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o groupnullincl groupnullincl.o  ../util/mtest.o ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  glpid.c grouptest.c grouptest2.c groupcreate.c gtranks.c groupnullincl.c \
	gtranksperf.c 
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------

# glpid requires mpiimpl.h and hence special compile options.

../util/mtest.o:
	(cd ../util && $(MAKE) mtest.o)

.POSIX:

FORCE_TARGET:


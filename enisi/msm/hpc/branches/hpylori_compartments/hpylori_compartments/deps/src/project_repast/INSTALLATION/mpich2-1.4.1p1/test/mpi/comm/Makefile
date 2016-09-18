# This Makefile.in created by simplemake.  Do not edit

# comm/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/comm
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/comm
top_srcdir      = ..
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
clean:  clean-local
	-@rm -f *.o ${srcdir}/*.o ctxsplit icsplit commcreate1 icm commname cmfree ic1 dupic probe-intercomm dup ctxalloc iccreate cmsplit cmsplit2 icgroup
	-@rm -f ctxsplit.exe icsplit.exe commcreate1.exe icm.exe commname.exe cmfree.exe ic1.exe dupic.exe probe-intercomm.exe dup.exe ctxalloc.exe iccreate.exe cmsplit.exe cmsplit2.exe icgroup.exe
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
all-redirect: commcreate1 dup dupic ic1 commname ctxalloc ctxsplit icgroup icsplit iccreate cmfree\
	 icm cmsplit cmsplit2 probe-intercomm

ctxsplit: ctxsplit.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o ctxsplit ctxsplit.o  ${LIBS}
icsplit: icsplit.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o icsplit icsplit.o  ${LIBS}
commcreate1: commcreate1.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o commcreate1 commcreate1.o  ${LIBS}
icm: icm.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o icm icm.o  ${LIBS}
commname: commname.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o commname commname.o  ${LIBS}
cmfree: cmfree.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o cmfree cmfree.o  ${LIBS}
ic1: ic1.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o ic1 ic1.o  ${LIBS}
dupic: dupic.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o dupic dupic.o  ${LIBS}
probe-intercomm: probe-intercomm.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o probe-intercomm probe-intercomm.o  ${LIBS}
dup: dup.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o dup dup.o  ${LIBS}
ctxalloc: ctxalloc.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o ctxalloc ctxalloc.o  ${LIBS}
iccreate: iccreate.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o iccreate iccreate.o  ${LIBS}
cmsplit: cmsplit.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o cmsplit cmsplit.o  ${LIBS}
cmsplit2: cmsplit2.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o cmsplit2 cmsplit2.o  ${LIBS}
icgroup: icgroup.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o icgroup icgroup.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  commcreate1.c dup.c dupic.c ic1.c commname.c ctxalloc.c ctxsplit.c icgroup.c \
	icsplit.c iccreate.c cmfree.c icm.c cmsplit.c cmsplit2.c probe-intercomm.c 
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------


../util/mtest.o:
	(cd ../util && $(MAKE) mtest.o )

# A special testing target to simplify running just the comm tests
testing:
	../runtests -srcdir=$(srcdir) -tests=testlist \
		   -mpiexec=/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpiexec \
		   -xmlfile=summary.xml
clean-local:
	-rm -f summary.xml

.POSIX:

FORCE_TARGET:


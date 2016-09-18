# This Makefile.in created by simplemake.  Do not edit

# info/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/info
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/info
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
clean: 
	-@rm -f *.o ${srcdir}/*.o infomany2 infodel infovallen infoorder infomany infodup infotest
	-@rm -f infomany2.exe infodel.exe infovallen.exe infoorder.exe infomany.exe infodup.exe infotest.exe
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
all-redirect: infodup infodel infovallen infoorder infomany infomany2 infotest

infomany2: infomany2.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o infomany2 infomany2.o  ${LIBS}
infodel: infodel.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o infodel infodel.o  ${LIBS}
infovallen: infovallen.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o infovallen infovallen.o  ${LIBS}
infoorder: infoorder.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o infoorder infoorder.o  ${LIBS}
infomany: infomany.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o infomany infomany.o  ${LIBS}
infodup: infodup.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o infodup infodup.o  ${LIBS}
infotest: infotest.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o infotest infotest.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  infodup.c infodel.c infovallen.c infoorder.c infomany.c infomany2.c infotest.c
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------


# A special testing target to simplify running just the info tests
testing:
	../runtests -srcdir=$(srcdir) -tests=testlist \
		   -mpiexec=/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpiexec \
		   -xmlfile=summary.xml

../util/mtest.o:
	(cd ../util && $(MAKE) mtest.o)

.POSIX:

FORCE_TARGET:


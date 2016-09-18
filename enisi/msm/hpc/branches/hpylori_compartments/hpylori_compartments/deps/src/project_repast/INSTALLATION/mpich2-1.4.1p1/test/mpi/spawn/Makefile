# This Makefile.in created by simplemake.  Do not edit

# spawn/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/spawn
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/spawn
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
	-@rm -f *.o ${srcdir}/*.o pgroup_connect_test spawnintra selfconacc disconnect2 disconnect3 disconnect_reconnect2 multiple_ports2 join disconnect_reconnect spaiccreate2 spawnmanyarg disconnect_reconnect3 namepub spawnargv spawnmult2 spawn1 disconnect spawnminfo1 spaconacc2 concurrent_spawns spawn2 spawninfo1 multiple_ports spaconacc spaiccreate pgroup_intercomm_test taskmaster
	-@rm -f pgroup_connect_test.exe spawnintra.exe selfconacc.exe disconnect2.exe disconnect3.exe disconnect_reconnect2.exe multiple_ports2.exe join.exe disconnect_reconnect.exe spaiccreate2.exe spawnmanyarg.exe disconnect_reconnect3.exe namepub.exe spawnargv.exe spawnmult2.exe spawn1.exe disconnect.exe spawnminfo1.exe spaconacc2.exe concurrent_spawns.exe spawn2.exe spawninfo1.exe multiple_ports.exe spaconacc.exe spaiccreate.exe pgroup_intercomm_test.exe taskmaster.exe
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
all-redirect: namepub spawn1 spawninfo1 spawnminfo1 spawn2 spawnintra spawnargv spawnmanyarg\
	 spaconacc spaconacc2 selfconacc spawnmult2 taskmaster join disconnect_reconnect\
	 disconnect_reconnect2 disconnect_reconnect3 multiple_ports multiple_ports2 spaiccreate\
	 spaiccreate2 disconnect disconnect2 disconnect3 concurrent_spawns pgroup_connect_test\
	 pgroup_intercomm_test

pgroup_connect_test: pgroup_connect_test.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o pgroup_connect_test pgroup_connect_test.o  ${LIBS}
spawnintra: spawnintra.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o spawnintra spawnintra.o  ${LIBS}
selfconacc: selfconacc.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o selfconacc selfconacc.o  ${LIBS}
disconnect2: disconnect2.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o disconnect2 disconnect2.o  ${LIBS}
disconnect3: disconnect3.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o disconnect3 disconnect3.o  ${LIBS}
disconnect_reconnect2: disconnect_reconnect2.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o disconnect_reconnect2 disconnect_reconnect2.o  ${LIBS}
multiple_ports2: multiple_ports2.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o multiple_ports2 multiple_ports2.o  ${LIBS}
join: join.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o join join.o  ${LIBS}
disconnect_reconnect: disconnect_reconnect.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o disconnect_reconnect disconnect_reconnect.o  ${LIBS}
spaiccreate2: spaiccreate2.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o spaiccreate2 spaiccreate2.o  ${LIBS}
spawnmanyarg: spawnmanyarg.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o spawnmanyarg spawnmanyarg.o  ${LIBS}
disconnect_reconnect3: disconnect_reconnect3.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o disconnect_reconnect3 disconnect_reconnect3.o  ${LIBS}
namepub: namepub.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o namepub namepub.o  ${LIBS}
spawnargv: spawnargv.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o spawnargv spawnargv.o  ${LIBS}
spawnmult2: spawnmult2.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o spawnmult2 spawnmult2.o  ${LIBS}
spawn1: spawn1.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o spawn1 spawn1.o  ${LIBS}
disconnect: disconnect.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o disconnect disconnect.o  ${LIBS}
spawnminfo1: spawnminfo1.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o spawnminfo1 spawnminfo1.o  ${LIBS}
spaconacc2: spaconacc2.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o spaconacc2 spaconacc2.o  ${LIBS}
concurrent_spawns: concurrent_spawns.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o concurrent_spawns concurrent_spawns.o  ${LIBS}
spawn2: spawn2.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o spawn2 spawn2.o  ${LIBS}
spawninfo1: spawninfo1.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o spawninfo1 spawninfo1.o  ${LIBS}
multiple_ports: multiple_ports.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o multiple_ports multiple_ports.o  ${LIBS}
spaconacc: spaconacc.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o spaconacc spaconacc.o  ${LIBS}
spaiccreate: spaiccreate.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o spaiccreate spaiccreate.o  ${LIBS}
pgroup_intercomm_test: pgroup_intercomm_test.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o pgroup_intercomm_test pgroup_intercomm_test.o  ${LIBS}
taskmaster: taskmaster.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o taskmaster taskmaster.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  namepub.c spawn1.c spawninfo1.c spawnminfo1.c spawn2.c spawnintra.c \
	spawnargv.c spawnmanyarg.c spaconacc.c spaconacc2.c selfconacc.c spawnmult2.c \
	taskmaster.c join.c disconnect_reconnect.c disconnect_reconnect2.c \
	disconnect_reconnect3.c multiple_ports.c multiple_ports2.c spaiccreate.c spaiccreate2.c \
	disconnect.c disconnect2.c disconnect3.c concurrent_spawns.c pgroup_connect_test.c \
	pgroup_intercomm_test.c 
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------



../util/mtest.o:
	(cd ../util && $(MAKE) mtest.o)

testing:
	../runtests -srcdir=$(srcdir) -tests=testlist \
			-mpiexec=/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpiexec \
		   	-xmlfile=summary.xml
clean-local:
	-rm -f summary.xml

.POSIX:

FORCE_TARGET:


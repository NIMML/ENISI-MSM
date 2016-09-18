# This Makefile.in created by simplemake.  Do not edit

# cxx/spawn/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/cxx/spawn
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/cxx/spawn
DEFS            = -DHAVE_CONFIG_H -I. -I${srcdir}
CPPFLAGS        = 
LIBS            = -lpthread 
MAKE            = make
CXX             = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpicxx
CXXFLAGS        = 
CXX_COMPILE     = $(CXX) $(DEFS) $(INCLUDES) $(CXXFLAGS) $(CPPFLAGS)
CXX_LINK       = $(CXX)
LDFLAGS     =    ../util/mtest.o 

VPATH = .
INCLUDES = -I../../include -I${srcdir}/../../include

.SUFFIXES:
.SUFFIXES: .o .cxx 
.cxx.o:
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CXX             $<" ; \
	else \
	  echo $(CXX_COMPILE) -c $< ; \
	fi
	@$(CXX_COMPILE) -c $<
.cxx:
	$(CXX_COMPILE) -o $* $< $(LDFLAGS) $(LIBS)
apply: 
	$(ACTION) $(ACTION_INPUT)
clean: 
	-@rm -f *.o ${srcdir}/*.o spawnargvx namepubx selfconaccx spawnintrax
	-@rm -f spawnargvx.exe namepubx.exe selfconaccx.exe spawnintrax.exe
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
all-redirect: spawnargvx spawnintrax namepubx selfconaccx

spawnargvx: spawnargvx.o    ../util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o spawnargvx spawnargvx.o  ${LIBS}
namepubx: namepubx.o    ../util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o namepubx namepubx.o  ${LIBS}
selfconaccx: selfconaccx.o    ../util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o selfconaccx selfconaccx.o  ${LIBS}
spawnintrax: spawnintrax.o    ../util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o spawnintrax spawnintrax.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  spawnargvx.cxx spawnintrax.cxx namepubx.cxx selfconaccx.cxx
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------


../util/mtest.o:
	cd ../util && $(MAKE) mtest.o

.POSIX:

FORCE_TARGET:


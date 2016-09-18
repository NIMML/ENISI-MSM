# This Makefile.in created by simplemake.  Do not edit

# cxx/datatype/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/cxx/datatype
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/cxx/datatype
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
	-@rm -f *.o ${srcdir}/*.o typemiscx typenamex packsizex typecntsx
	-@rm -f typemiscx.exe typenamex.exe packsizex.exe typecntsx.exe
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
all-redirect: packsizex typecntsx typenamex typemiscx

typemiscx: typemiscx.o    ../util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o typemiscx typemiscx.o  ${LIBS}
typenamex: typenamex.o    ../util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o typenamex typenamex.o  ${LIBS}
packsizex: packsizex.o    ../util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o packsizex packsizex.o  ${LIBS}
typecntsx: typecntsx.o    ../util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o typecntsx typecntsx.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  packsizex.cxx typecntsx.cxx typenamex.cxx typemiscx.cxx
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------


../util/mtest.o:
	cd ../util && $(MAKE) mtest.o

.POSIX:

FORCE_TARGET:


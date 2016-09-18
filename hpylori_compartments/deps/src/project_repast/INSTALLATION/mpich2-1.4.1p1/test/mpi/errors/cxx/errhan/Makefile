# This Makefile.in created by simplemake.  Do not edit

# errors/cxx/errhan/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/errors/cxx/errhan
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/errors/cxx/errhan
DEFS            = -DHAVE_CONFIG_H -I. -I${srcdir}
CPPFLAGS        = 
LIBS            = -lpthread 
MAKE            = make
CXX             = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpicxx
CXXFLAGS        = 
CXX_COMPILE     = $(CXX) $(DEFS) $(INCLUDES) $(CXXFLAGS) $(CPPFLAGS)
CXX_LINK       = $(CXX)
LDFLAGS     =    

VPATH = .
INCLUDES = -I../../../include -I${srcdir}/../../../include

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
clean:  clean-local
	-@rm -f *.o ${srcdir}/*.o errsetx errgetx commerrx throwtest
	-@rm -f errsetx.exe errgetx.exe commerrx.exe throwtest.exe
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
all-redirect: errgetx errsetx commerrx throwtest

errsetx: errsetx.o    ../../../cxx/util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o errsetx errsetx.o  ../../../cxx/util/mtest.o \
	${LIBS} 
errgetx: errgetx.o    ../../../cxx/util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o errgetx errgetx.o  ../../../cxx/util/mtest.o \
	${LIBS} 
commerrx: commerrx.o    ../../../cxx/util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o commerrx commerrx.o  ../../../cxx/util/mtest.o \
	${LIBS} 
throwtest: throwtest.o    ../../../cxx/util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o throwtest throwtest.o  ../../../cxx/util/mtest.o \
	${LIBS} 
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  errgetx.cxx errsetx.cxx commerrx.cxx throwtest.cxx
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------


../../../cxx/util/mtest.o: 
	(cd ../../../cxx/util && $(MAKE) mtest.o)

# A special testing target to simplify running just the pt2pt tests
testing:
	../../../runtests -srcdir=$(srcdir) -tests=testlist \
		   -mpiexec=/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpiexec \
		   -xmlfile=summary.xml
clean-local:
	-rm -f summary.xml

.POSIX:

FORCE_TARGET:


# This Makefile.in created by simplemake.  Do not edit

# cxx/errhan/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/cxx/errhan
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/cxx/errhan
top_srcdir      = ../..
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
INCLUDES = -I../../include -I${top_srcdir}/include

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
	-@rm -f *.o ${srcdir}/*.o commcallx
	-@rm -f commcallx.exe
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
all-redirect: commcallx

commcallx: commcallx.o    ../util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o commcallx commcallx.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  commcallx.cxx
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------

#adderr_SOURCES = adderr.c
#errstring_SOURCES = errstring.c
#errcode_SOURCES = errcode.c errmsg.c
#errring_SOURCES = errring.c
#errfatal_SOURCES = errfatal.c


../util/mtest.o: 
	(cd ../util && make mtest.o)

testing:
	../../runtests -srcdir=$(srcdir) -tests=testlist \
			-mpiexec=/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpiexec \
		   	-xmlfile=summary.xml

.POSIX:

FORCE_TARGET:


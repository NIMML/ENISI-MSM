# This Makefile.in created by simplemake.  Do not edit

# cxx/attr/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/cxx/attr
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/cxx/attr
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
clean:  clean-local
	-@rm -f *.o ${srcdir}/*.o attricx baseattrcommx fkeyvaltypex fkeyvalcommx attrtx
	-@rm -f attricx.exe baseattrcommx.exe fkeyvaltypex.exe fkeyvalcommx.exe attrtx.exe
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
all-redirect: attrtx attricx baseattrcommx fkeyvalcommx fkeyvaltypex

attricx: attricx.o    ../util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o attricx attricx.o  ${LIBS}
baseattrcommx: baseattrcommx.o    ../util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o baseattrcommx baseattrcommx.o  ${LIBS}
fkeyvaltypex: fkeyvaltypex.o    ../util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o fkeyvaltypex fkeyvaltypex.o  ${LIBS}
fkeyvalcommx: fkeyvalcommx.o    ../util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o fkeyvalcommx fkeyvalcommx.o  ${LIBS}
attrtx: attrtx.o    ../util/mtest.o
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o attrtx attrtx.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  attrtx.cxx attricx.cxx baseattrcommx.cxx fkeyvalcommx.cxx fkeyvaltypex.cxx
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------

#attrerrx_SOURCES = attrerrx.cxx
#attrerrcommx_SOURCES = attrerrcommx.cxx
#attrerrtypex_SOURCES = attrerrtypex.cxx
#attrorderx_SOURCES = attrorderx.cxx
#attrordercommx_SOURCES = attrordercommx.cxx
#attrordertypex_SOURCES = attrordertypex.cxx
#attrorderwinx_SOURCES = attrorderwinx.cxx
#baseattr2x_SOURCES = baseattr2x.cxx
#baseattrwinx_SOURCES = baseattrwinx.cxx

../util/mtest.o:
	(cd ../util && $(MAKE) mtest.o)
testing:
	../../runtests -srcdir=$(srcdir) -tests=testlist \
			-mpiexec=/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpiexec \
		   	-xmlfile=summary.xml
clean-local:
	-rm -f summary.xml

.POSIX:

FORCE_TARGET:


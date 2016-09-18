# examples/cxx/Makefile.  Generated from Makefile.in by configure.
all: all-redirect

SHELL           = /bin/bash
top_srcdir      = ../..
srcdir          = .
DEFS            = 
CPPFLAGS        = 
LIBS            = -lrt -lpthread  
MPILIBNAME      = mpich

MPICHDIR = ../..
CXX         = $(MPICHDIR)/bin/mpicxx 
CXXFLAGS    = 
CXX_DEFS    =  -DHAVE_CXX_IOSTREAM -DHAVE_NAMESPACE_STD
CXX_COMPILE = $(CXX) $(DEFS) $(CXX_DEFS) $(INCLUDES) $(CXXFLAGS) $(CPPFLAGS)
CXX_LINK    = $(CXX)
LDFLAGS     = 

VPATH = .
.SUFFIXES:
.SUFFIXES: .o .cxx .txt 
.cxx.o:
	$(CXX_COMPILE) -c $<
.cxx:
	$(CXX_COMPILE) -o $< $(LDFLAGS) $(LIBS)

Makefile: ${srcdir}/Makefile.in
	-cd ../../../ && \
	if [ -x config.status ] ; then CONFIG_FILES=examples/cxx/Makefile CONFIG_HEADERS= ${SHELL} ./config.status ; fi
clean:
	-rm -f *.o ${srcdir}/*.o cxxpi
	-rm -f cxxpi.exe
	-rm -f *.lo ${srcdir}/*.lo
	-rm -f ${srcdir}/*.bb ${srcdir}/*.bbg ${srcdir}/*.da
distclean: clean
	rm -rf .deps
	-rm -f TAGS
maintainerclean:

all-redirect: cxxpi
coverage:
cxxpi: cxxpi.o  ../../lib/lib${MPILIBNAME}.a
	$(CXX_COMPILE) $(LDFLAGS) -o cxxpi cxxpi.o  ${LIBS}
htmldoc:
mandoc:
latexdoc:
# Dependencies
dependencies:
# End of Dependencies
SOURCES =  cxxpi.cxx
tags: TAGS
TAGS:${HEADERS} ${SOURCES}


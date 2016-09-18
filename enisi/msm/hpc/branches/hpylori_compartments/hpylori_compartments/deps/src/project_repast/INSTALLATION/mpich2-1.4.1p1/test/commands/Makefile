# This Makefile.in created by simplemake.  Do not edit

# test/commands/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/commands
bindir          = ${exec_prefix}/bin
exec_prefix     = ${prefix}
prefix          = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/commands
DEFS            = -DHAVE_CONFIG_H -I. -I${srcdir}
INCLUDES        = 
CPPFLAGS        =  -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpl/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpl/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/openpa/src -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/openpa/src -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/datatype -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/datatype -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/locks -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/locks -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/utils/monitor -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/utils/monitor -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/util/wrappers -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/util/wrappers
LIBS            = -lrt -lpthread  
MAKE            = make
CC              = gcc
CFLAGS          =    -O2 $(MPICH2_MAKE_CFLAGS)
C_COMPILE       = $(CC) $(DEFS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS)
CC_SHL          = true
C_COMPILE_SHL   = $(CC_SHL) $(DEFS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS)
CXX             = c++
CXXFLAGS        =   -O2
CXX_COMPILE     = $(CXX) $(DEFS) $(INCLUDES) $(CXXFLAGS) $(CPPFLAGS)
CXX_LINK       = $(CXX)
CXX_SHL         = false
CXX_COMPILE_SHL = $(CXX_SHL) $(DEFS) $(INCLUDES) $(CXXFLAGS) $(CPPFLAGS)
F77             = 
FFLAGS          =  
F77_COMPILE     = $(F77) $(FFLAGS) $(F77INCLUDES)
F77_LINK       = $(F77)
F77_SHL         = 
F77_COMPILE_SHL = $(F77_SHL) $(FFLAGS) $(F77INCLUDES)
LDFLAGS     =    

VPATH = .
C_LINK = $(bindir)/mpicc
MPICC = $(bindir)/mpicc
MPICXX = $(bindir)/mpicxx
MPIF77 = $(bindir)/mpif77

.SUFFIXES:
.SUFFIXES: .o .lo .c .cxx .f 
apply: 
	$(ACTION) $(ACTION_INPUT)
clean:  clean-local
	-@rm -f *.o ${srcdir}/*.o rtest stdintest checkenv1 stdintest2 rtestx stdiotest testout rtestf
	-@rm -f rtest.exe stdintest.exe checkenv1.exe stdintest2.exe rtestx.exe stdiotest.exe testout.exe rtestf.exe
	-@rm -f core core.[0-9]*
	-@rm -f *.lo ${srcdir}/*.lo
	-@rm -f *.irlog*
distclean:  clean distclean-xxx remove-makefile
distclean-xxx:
	-@rm -f Makefile cmdtests
	-@rm -rf autom4te*.cache
	-@rm -rf $(DEPS_DIR)
	-@rm -f TAGS
remove-makefile:
	rm -f Makefile
remove-genmakefiles:
	rm -f  Makefile
all-redirect: stdiotest stdintest stdintest2 checkenv1 rtest rtestf rtestx testout

rtest: rtest.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o rtest rtest.o  ${LIBS}
stdintest: stdintest.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o stdintest stdintest.o  ${LIBS}
checkenv1: checkenv1.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o checkenv1 checkenv1.o  ${LIBS}
stdintest2: stdintest2.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o stdintest2 stdintest2.o  ${LIBS}
rtestx: rtestx.o   
	$(CXX_LINK) $(CXXFLAGS) $(LDFLAGS) -o rtestx rtestx.o  ${LIBS}
stdiotest: stdiotest.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o stdiotest stdiotest.o  ${LIBS}
testout: testout.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o testout testout.o  ${LIBS}
rtestf: rtestf.o   
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o rtestf rtestf.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  stdiotest.c stdintest.c stdintest2.c checkenv1.c rtest.c rtestf.f rtestx.cxx \
	testout.c 
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------


.c:
	$(MPICC) -o $* $<
.c.o:
	$(MPICC) -c $<
.f.o:
	$(MPIF77) -c $<
.F.o:
	$(MPIF77) -c $<
.cxx.o:
	$(MPICXX) -c $<

testing:
#	./cmdtests

clean-local:
	-rm -f err.txt out.log out.txt stdintest stdintest2 sdtiotest a.out

.POSIX:

FORCE_TARGET:


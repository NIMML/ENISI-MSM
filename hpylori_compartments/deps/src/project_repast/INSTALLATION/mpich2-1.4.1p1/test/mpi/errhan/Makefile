# This Makefile.in created by simplemake.  Do not edit

# errhan/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/errhan
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/errhan
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
clean: 
	-@rm -f *.o ${srcdir}/*.o adderr commcall errcode errstring errring errfatal
	-@rm -f adderr.exe commcall.exe errcode.exe errstring.exe errring.exe errfatal.exe
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
all-redirect: adderr commcall errfatal

adderr: adderr.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o adderr adderr.o  ${LIBS}
commcall: commcall.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o commcall commcall.o  ${LIBS}
errcode: errcode.o errmsg.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o errcode errcode.o errmsg.o  ${LIBS}
errstring: errstring.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o errstring errstring.o  ${LIBS}
errring: errring.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o errring errring.o  ${LIBS}
errfatal: errfatal.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o errfatal errfatal.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  adderr.c errstring.c errcode.c errmsg.c errring.c commcall.c errfatal.c
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------



../util/mtest.o: 
	(cd ../util && make mtest.o)

testing:
	../runtests -srcdir=$(srcdir) -tests=testlist \
			-mpiexec=/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpiexec \
		   	-xmlfile=summary.xml

.POSIX:

FORCE_TARGET:


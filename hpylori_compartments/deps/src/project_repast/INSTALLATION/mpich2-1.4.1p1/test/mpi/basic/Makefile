# This Makefile.in created by simplemake.  Do not edit

# basic/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/basic
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/basic
DEFS            = -DHAVE_CONFIG_H -I. -I${srcdir}
CPPFLAGS        = 
LIBS            = -lpthread 
MAKE            = make
CC              = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpicc
CFLAGS          =   $(MPICH2_MAKE_CFLAGS)
C_COMPILE       = $(CC) $(DEFS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS)
C_LINK         = $(CC)
LDFLAGS     =    

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
	-@rm -f *.o ${srcdir}/*.o allmpi self netpipe adapt wtime patterns simple srtest sendrecv
	-@rm -f allmpi.exe self.exe netpipe.exe adapt.exe wtime.exe patterns.exe simple.exe srtest.exe sendrecv.exe
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
all-redirect: self simple sendrecv srtest wtime netpipe patterns adapt

allmpi: allmpi.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o allmpi allmpi.o  ${LIBS}
self: self.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o self self.o  ${LIBS}
netpipe: netmpi.o GetOpt.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o netpipe netmpi.o GetOpt.o  ${LIBS}
adapt: adapt.o GetOpt.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o adapt adapt.o GetOpt.o  ${LIBS}
wtime: wtime.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o wtime wtime.o  ${LIBS}
patterns: patterns.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o patterns patterns.o  ${LIBS}
simple: simple.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o simple simple.o  ${LIBS}
srtest: srtest.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o srtest srtest.o  ${LIBS}
sendrecv: sendrecv.o   
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o sendrecv sendrecv.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  self.c simple.c sendrecv.c srtest.c wtime.c netmpi.c GetOpt.c patterns.c \
	adapt.c GetOpt.c allmpi.c 
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------

# The allmpi program uses MPICH internal header files


.POSIX:

FORCE_TARGET:


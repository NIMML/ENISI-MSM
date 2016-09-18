# This Makefile.in created by simplemake.  Do not edit

# io/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/io
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/io
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
	-@rm -f *.o ${srcdir}/*.o setviewcur rdwrord userioerr i_noncontig setinfo resized async rdwrzero async_any getextent
	-@rm -f setviewcur.exe rdwrord.exe userioerr.exe i_noncontig.exe setinfo.exe resized.exe async.exe rdwrzero.exe async_any.exe getextent.exe
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
all-redirect: rdwrord rdwrzero getextent setinfo setviewcur i_noncontig async async_any userioerr\
	 resized

setviewcur: setviewcur.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o setviewcur setviewcur.o  ${LIBS}
rdwrord: rdwrord.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o rdwrord rdwrord.o  ${LIBS}
userioerr: userioerr.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o userioerr userioerr.o  ${LIBS}
i_noncontig: i_noncontig.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o i_noncontig i_noncontig.o  ${LIBS}
setinfo: setinfo.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o setinfo setinfo.o  ${LIBS}
resized: resized.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o resized resized.o  ${LIBS}
async: async.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o async async.o  ${LIBS}
rdwrzero: rdwrzero.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o rdwrzero rdwrzero.o  ${LIBS}
async_any: async_any.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o async_any async_any.o  ${LIBS}
getextent: getextent.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o getextent getextent.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  rdwrord.c rdwrzero.c getextent.c setinfo.c setviewcur.c i_noncontig.c async.c \
	async_any.c userioerr.c resized.c 
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------


../util/mtest.o:
	(cd ../util && $(MAKE) mtest.o)

# Add the temporary files that might be left behind by the test programs
clean-local:
	-@rm -f testfile testfile.?

# A special testing target to simplify running just the io tests
testing:
	../runtests -srcdir=$(srcdir) -tests=testlist \
		   -mpiexec=/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpiexec \
		   -xmlfile=summary.xml

.POSIX:

FORCE_TARGET:


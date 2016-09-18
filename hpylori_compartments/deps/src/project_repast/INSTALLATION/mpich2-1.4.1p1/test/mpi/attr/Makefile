# This Makefile.in created by simplemake.  Do not edit

# attr/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/attr
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/attr
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
	-@rm -f *.o ${srcdir}/*.o baseattrcomm attric attrerr baseattr2 keyval_double_free attrend fkeyvaltype attrend2 attrordertype attrt attr2type attrerrcomm attrerrtype fkeyvalcomm attrorder fkeyval attrordercomm
	-@rm -f baseattrcomm.exe attric.exe attrerr.exe baseattr2.exe keyval_double_free.exe attrend.exe fkeyvaltype.exe attrend2.exe attrordertype.exe attrt.exe attr2type.exe attrerrcomm.exe attrerrtype.exe fkeyvalcomm.exe attrorder.exe fkeyval.exe attrordercomm.exe
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
all-redirect: attrt attrend attrend2 attric attrerr attrerrcomm attrerrtype attr2type attrorder\
	 attrordercomm attrordertype baseattr2 baseattrcomm fkeyval fkeyvalcomm fkeyvaltype\
	 keyval_double_free

baseattrcomm: baseattrcomm.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o baseattrcomm baseattrcomm.o  ${LIBS}
attric: attric.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o attric attric.o  ${LIBS}
attrerr: attrerr.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o attrerr attrerr.o  ${LIBS}
baseattr2: baseattr2.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o baseattr2 baseattr2.o  ${LIBS}
keyval_double_free: keyval_double_free.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o keyval_double_free keyval_double_free.o  ${LIBS}
attrend: attrend.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o attrend attrend.o  ${LIBS}
fkeyvaltype: fkeyvaltype.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o fkeyvaltype fkeyvaltype.o  ${LIBS}
attrend2: attrend2.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o attrend2 attrend2.o  ${LIBS}
attrordertype: attrordertype.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o attrordertype attrordertype.o  ${LIBS}
attrt: attrt.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o attrt attrt.o  ${LIBS}
attr2type: attr2type.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o attr2type attr2type.o  ${LIBS}
attrerrcomm: attrerrcomm.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o attrerrcomm attrerrcomm.o  ${LIBS}
attrerrtype: attrerrtype.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o attrerrtype attrerrtype.o  ${LIBS}
fkeyvalcomm: fkeyvalcomm.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o fkeyvalcomm fkeyvalcomm.o  ${LIBS}
attrorder: attrorder.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o attrorder attrorder.o  ${LIBS}
fkeyval: fkeyval.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o fkeyval fkeyval.o  ${LIBS}
attrordercomm: attrordercomm.o    ../util/mtest.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o attrordercomm attrordercomm.o  ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  attrt.c attrend.c attrend2.c attric.c attrerr.c attrerrcomm.c attrerrtype.c \
	attr2type.c attrorder.c attrordercomm.c attrordertype.c baseattr2.c baseattrcomm.c \
	fkeyval.c fkeyvalcomm.c fkeyvaltype.c keyval_double_free.c 
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------


../util/mtest.o:
	(cd ../util && $(MAKE) mtest.o)
testing:
	../runtests -srcdir=$(srcdir) -tests=testlist \
			-mpiexec=/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpiexec \
		   	-xmlfile=summary.xml
clean-local:
	-rm -f summary.xml

.POSIX:

FORCE_TARGET:


# This Makefile.in created by simplemake.  Do not edit

# f77/io/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/f77/io
bindir          = ${exec_prefix}/bin
exec_prefix     = ${prefix}
prefix          = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/test/mpi/f77/io
top_srcdir      = ../..
DEFS            = -DHAVE_CONFIG_H -I. -I${srcdir}
INCLUDES        = 
CPPFLAGS        = 
LIBS            = -lpthread 
MAKE            = make
CC              = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpicc
CFLAGS          =   $(MPICH2_MAKE_CFLAGS)
C_COMPILE       = $(CC) $(DEFS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS)
C_LINK         = $(CC)
F77             = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH/bin/mpif77
FFLAGS          = 
F77_COMPILE     = $(F77) $(FFLAGS) $(F77INCLUDES)
F77_LINK       = $(F77)
LDFLAGS     =    

VPATH = .
F77INCLUDES = -I. 
F77HEADERS = iodisp.h iooffset.h

.SUFFIXES:
.SUFFIXES: .o .c .f 
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
.f.o:
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  F77             $<" ; \
	else \
	  echo $(F77_COMPILE) -c $< ; \
	fi
	@$(F77_COMPILE) -c $<
.f:
	$(F77_COMPILE) -o $* $< $(LDFLAGS) $(LIBS)
apply: 
	$(ACTION) $(ACTION_INPUT)
clean:  clean-local
	-@rm -f *.o ${srcdir}/*.o shpositionf writef iwriteshf writeallf writeatf iwritef writeallbef miscfilef fileinfof c2fmultio c2f2ciof writeatallbef atomicityf writeordbef setviewcurf writeshf iwriteatf fileerrf writeatallf writeordf
	-@rm -f shpositionf.exe writef.exe iwriteshf.exe writeallf.exe writeatf.exe iwritef.exe writeallbef.exe miscfilef.exe fileinfof.exe c2fmultio.exe c2f2ciof.exe writeatallbef.exe atomicityf.exe writeordbef.exe setviewcurf.exe writeshf.exe iwriteatf.exe fileerrf.exe writeatallf.exe writeordf.exe
	-@rm -f core core.[0-9]*
	-@rm -f *.lo ${srcdir}/*.lo
	-@rm -f *.irlog*
distclean:  clean distclean-xxx remove-makefile
distclean-xxx:
	-@rm -f Makefile iooffset.h iodisp.h ioaint.h
	-@rm -rf autom4te*.cache
	-@rm -rf $(DEPS_DIR)
	-@rm -f TAGS
remove-makefile:
	rm -f Makefile
remove-genmakefiles:
	rm -f  Makefile
all-redirect: iwriteatf iwritef iwriteshf writef writeatf writeallf writeatallf writeallbef\
	 writeordf writeordbef writeshf writeatallbef fileerrf fileinfof shpositionf atomicityf\
	 miscfilef setviewcurf c2fmultio c2f2ciof

shpositionf: shpositionf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o shpositionf shpositionf.o  ../util/mtestf.o ${LIBS}
writef: writef.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o writef writef.o  ../util/mtestf.o ${LIBS}
iwriteshf: iwriteshf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o iwriteshf iwriteshf.o  ../util/mtestf.o ${LIBS}
writeallf: writeallf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o writeallf writeallf.o  ../util/mtestf.o ${LIBS}
writeatf: writeatf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o writeatf writeatf.o  ../util/mtestf.o ${LIBS}
iwritef: iwritef.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o iwritef iwritef.o  ../util/mtestf.o ${LIBS}
writeallbef: writeallbef.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o writeallbef writeallbef.o  ../util/mtestf.o ${LIBS}
miscfilef: miscfilef.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o miscfilef miscfilef.o  ../util/mtestf.o ${LIBS}
fileinfof: fileinfof.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o fileinfof fileinfof.o  ../util/mtestf.o ${LIBS}
c2fmultio: c2fmultio.o    ../util/mtestf.o
	$(C_LINK) $(CFLAGS) $(LDFLAGS) -o c2fmultio c2fmultio.o  ${LIBS}
c2f2ciof: c2f2cio.o c2f2ciof.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o c2f2ciof c2f2cio.o c2f2ciof.o  ../util/mtestf.o  \
	${LIBS} 
writeatallbef: writeatallbef.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o writeatallbef writeatallbef.o  ../util/mtestf.o \
	${LIBS} 
atomicityf: atomicityf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o atomicityf atomicityf.o  ${LIBS}
writeordbef: writeordbef.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o writeordbef writeordbef.o  ../util/mtestf.o ${LIBS}
setviewcurf: setviewcurf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o setviewcurf setviewcurf.o  ../util/mtestf.o ${LIBS}
writeshf: writeshf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o writeshf writeshf.o  ../util/mtestf.o ${LIBS}
iwriteatf: iwriteatf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o iwriteatf iwriteatf.o  ../util/mtestf.o ${LIBS}
fileerrf: fileerrf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o fileerrf fileerrf.o  ../util/mtestf.o ${LIBS}
writeatallf: writeatallf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o writeatallf writeatallf.o  ../util/mtestf.o ${LIBS}
writeordf: writeordf.o    ../util/mtestf.o
	$(F77_LINK) $(FFLAGS) $(LDFLAGS) -o writeordf writeordf.o  ../util/mtestf.o ${LIBS}
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  iwriteatf.f iwritef.f iwriteshf.f writef.f writeatf.f writeallf.f \
	writeatallf.f writeallbef.f writeordf.f writeordbef.f writeshf.f writeatallbef.f \
	fileerrf.f fileinfof.f shpositionf.f atomicityf.f miscfilef.f setviewcurf.f c2fmultio.c \
	c2f2cio.c c2f2ciof.f 
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------






# These IO tests are build from a template and a set of definitions.
iwriteatf.f writef.f writeatf.f writeatallf.f writeallf.f writeallbef.f \
writeordf.f writeordbef.f writeshf.f writeatallbef.f \
iwritef.f iwriteshf.f : ioharness.tlt ioharness.defn ../../maint/testmerge
	../../maint/testmerge -defn=$(top_srcdir)/maint/common.defn \
		$(srcdir)/ioharness.defn $(srcdir)/ioharness.tlt

testing:
	../../runtests -srcdir=$(srcdir) -tests=testlist \
			-mpiexec=$(bindir)/mpiexec \
		   	-xmlfile=summary.xml

../util/mtestf.o: 
	(cd ../util && $(MAKE) mtestf.o)

clean-local:
	rm -f .iotest.txt.*

.POSIX:

FORCE_TARGET:


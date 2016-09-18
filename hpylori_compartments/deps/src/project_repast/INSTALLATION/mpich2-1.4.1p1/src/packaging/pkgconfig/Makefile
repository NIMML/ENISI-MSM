# This Makefile.in created by simplemake.  Do not edit

# src/packaging/pkgconfig/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
INSTALL         = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_SCRIPT  = ${INSTALL}
INSTALL_DATA    = ${INSTALL} -m 644
MKDIR_P         = mkdir -p
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/packaging/pkgconfig
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/packaging/pkgconfig
prefix          = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH
libdir          = ${exec_prefix}/lib
exec_prefix     = ${prefix}
pkgconfigdir    = ${exec_prefix}/lib/pkgconfig
MAKE            = make
MPILIBNAME      = mpich
PMPILIBNAME     = pmpich


VPATH = .

.SUFFIXES:
# Some make programs complain if no suffixes are set
.SUFFIXES: .c .o
apply: 
	$(ACTION) $(ACTION_INPUT)
clean: 
	-@rm -f *.o ${srcdir}/*.o 
	-@rm -f *.lo ${srcdir}/*.lo
distclean:  clean distclean-xxx remove-makefile
distclean-xxx:
	-@rm -f mpich2-c.pc mpich2-cxx.pc mpich2-f77.pc mpich2-f90.pc Makefile
	-@rm -rf autom4te*.cache
	-@rm -rf $(DEPS_DIR)
	-@rm -f TAGS
remove-makefile:
	rm -f Makefile
remove-genmakefiles:
	rm -f  Makefile
all-redirect:

# --------------------------------------------------------------------------
# Install target
install:  FORCE_TARGET 
	if [ ! -d ${DESTDIR}${pkgconfigdir} ] ; then $(MKDIR_P) ${DESTDIR}${pkgconfigdir} ; fi
	if [ -s mpich2-c.pc ] ; then $(INSTALL_DATA)  mpich2-c.pc ${DESTDIR}${pkgconfigdir}/mpich2-c.pc ; fi
	if [ -s mpich2-cxx.pc ] ; then $(INSTALL_DATA)  mpich2-cxx.pc ${DESTDIR}${pkgconfigdir}/mpich2-cxx.pc ; fi
	if [ -s mpich2-f77.pc ] ; then $(INSTALL_DATA)  mpich2-f77.pc ${DESTDIR}${pkgconfigdir}/mpich2-f77.pc ; fi
	if [ -s mpich2-f90.pc ] ; then $(INSTALL_DATA)  mpich2-f90.pc ${DESTDIR}${pkgconfigdir}/mpich2-f90.pc ; fi

install-strip:
	$(MAKE) INSTALL_STRIP_FLAG=-s install
uninstall: 
	-rm -f ${DESTDIR}${pkgconfigdir}/mpich2-c.pc
	-rm -f ${DESTDIR}${pkgconfigdir}/mpich2-cxx.pc
	-rm -f ${DESTDIR}${pkgconfigdir}/mpich2-f77.pc
	-rm -f ${DESTDIR}${pkgconfigdir}/mpich2-f90.pc
installcheck: 
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------

.POSIX:

FORCE_TARGET:


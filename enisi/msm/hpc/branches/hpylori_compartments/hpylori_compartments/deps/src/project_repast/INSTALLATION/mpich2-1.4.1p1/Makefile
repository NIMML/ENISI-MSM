# This Makefile.in created by simplemake.  Do not edit

# Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
LIBTOOL         = 
CREATESHLIB     = false
ABIVERSION      = 3:3
LIBS            = -lrt -lpthread  
LDFLAGS         =  
C_LINK_SHL      = true
INSTALL         = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_SCRIPT  = ${INSTALL}
INSTALL_DATA    = ${INSTALL} -m 644
MKDIR_P         = mkdir -p
includedir      = ${prefix}/include
prefix          = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1
exec_prefix     = ${prefix}
libdir          = ${exec_prefix}/lib
master_top_srcdir  = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1
srcdir          = .
bindir          = ${exec_prefix}/bin
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1

datarootdir     = ${prefix}/share
docdir          = ${datarootdir}/doc/${PACKAGE}
htmldir         = ${docdir}
mandir          = ${datarootdir}/man
MAKE            = make
MPILIBNAME      = mpich
PMPILIBNAME     = pmpich


VPATH = .
MPICXXLIBNAME = mpichcxx
MPIFLIBNAME   = mpich
MPIFWRAPNAME  = fmpich

.SUFFIXES:
# Some make programs complain if no suffixes are set
.SUFFIXES: .c .o
apply: 
	$(ACTION) $(ACTION_INPUT)
	for dir in  src/mpl src/openpa src - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		(cd $$dir && ${MAKE} apply ) ; done
clean:  clean-preamble
	-@rm -f *.o ${srcdir}/*.o 
	-@rm -f .libstamp0 .libstamp1 
	-@rm -f *.lo ${srcdir}/*.lo
	for dir in  src/mpl src/openpa src - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		(cd $$dir && ${MAKE} clean ) ; done
	${MAKE} clean-postamble
distclean:  clean distclean-local distclean-xxx remove-makefile
distclean-xxx:
	for dir in  src/mpl src/openpa src - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		if [ ! -s $$dir/Makefile ] ; then continue ; fi ;\
		(cd $$dir && ${MAKE} distclean ) ; done
	-@rm -f Makefile mpich2-doxygen src/pmi/${pmi_name}/Makefile examples/f77/Makefile examples/f90/Makefile examples/cxx/Makefile doc/refman/Makefile doc/installguide/Makefile doc/userguide/Makefile doc/logging/Makefile doc/design/Makefile doc/smpd/Makefile doc/windev/Makefile config.status config.log config.cache *conf.cache config.system
	-@rm -rf autom4te*.cache
	-@rm -f src/include/mpichconf.h
	-@rm -f test/Makefile test/util/Makefile test/basic/Makefile test/commands/Makefile test/commands/cmdtests test/mpid/Makefile test/mpid/ch3/Makefile test/util/timer/Makefile examples/Makefile doc/Makefile doc/mansrc/Makefile doc/mansrc/createhtmlindex
	-@rm -rf $(DEPS_DIR)
	-@rm -f TAGS
remove-makefile:
	rm -f Makefile
remove-genmakefiles:
	rm -f  Makefile
all-redirect: all-preamble
	${MAKE} all-local
	@for dir in  src/mpl src/openpa - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		if ( cd $$dir && ${MAKE} all ) ; then : ; else exit 1; fi \
	done
	@(cd src && ${MAKE} all )
	@if [ "none" != "none" ] ; then \
	    if [ -s lib/lib${MPILIBNAME}.la ] ; then \
	        echo "make lib/lib${MPILIBNAME}.so" ;\
	        ${MAKE} lib/lib${MPILIBNAME}.so ; \
	    fi ; \
	    if [ -s lib/libf${MPILIBNAME}.la ] ; then \
	        echo "make lib/libf${MPILIBNAME}.so" ;\
	        ${MAKE} lib/libf${MPILIBNAME}.so ; \
	    fi ; \
	    if [ -s lib/lib${MPILIBNAME}f90.la ] ; then \
	        echo "make lib/lib${MPILIBNAME}f90.so" ;\
	        ${MAKE} lib/lib${MPILIBNAME}f90.so ; \
	    fi ; \
	    if [ -s lib/lib${MPICXXLIBNAME}.la ] ; then \
	        echo "make lib/lib${MPICXXLIBNAME}.so" ;\
	        ${MAKE} lib/lib${MPICXXLIBNAME}.so ; \
	    fi ; \
	fi
	${MAKE} all-postamble

CC              = gcc
CFLAGS          =    -O2 $(MPICH2_MAKE_CFLAGS)
C_COMPILE       = $(CC) $(DEFS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS)
# Build the shared library from the shared object files
lib/lib${MPILIBNAME}.so: lib/lib${MPILIBNAME}.la
	(cd lib && $(CREATESHLIB) --mode=link  -version-info "$(ABIVERSION)" -o lib${MPILIBNAME}.la  -rpath $(libdir) -L.   -ldflags "$(LDFLAGS)" $(LIBS))
	if [ -n "" -a \
		"${MPILIBNAME}" != "${PMPILIBNAME}" ] ; then \
	(cd lib && $(CREATESHLIB) --mode=link  -version-info "$(ABIVERSION)" -o lib${PMPILIBNAME}.la  -rpath $(libdir) );\
	fi
# Build the shared library from the shared object files
lib/libf${MPILIBNAME}.so: lib/libf${MPILIBNAME}.la
	(cd lib && $(CREATESHLIB) --mode=link  -version-info "$(ABIVERSION)" -o libf${MPILIBNAME}.la  -rpath $(libdir) -L.  -l$(MPILIBNAME)  -ldflags "$(LDFLAGS)" $(LIBS))
# Build the shared library from the shared object files
lib/lib${MPILIBNAME}f90.so: lib/lib${MPILIBNAME}f90.la
	(cd lib && $(CREATESHLIB) --mode=link  -version-info "$(ABIVERSION)" -o lib${MPILIBNAME}f90.la  -rpath $(libdir) -L.  -l$(MPILIBNAME)  -ldflags "$(LDFLAGS)" $(LIBS))
# Build the shared library from the shared object files
lib/lib${MPICXXLIBNAME}.so: lib/lib${MPICXXLIBNAME}.la
	(cd lib && $(CREATESHLIB) --mode=link  -version-info "$(ABIVERSION)" -o lib${MPICXXLIBNAME}.la  -rpath $(libdir) -L.  -l$(MPILIBNAME)  -ldflags "$(LDFLAGS)" $(LIBS))

# --------------------------------------------------------------------------
.libstamp0: 
.libstamp1: 
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# Install target
install:  install-preamble FORCE_TARGET 
	if [ ! -d ${DESTDIR}${prefix} ] ; then $(MKDIR_P) ${DESTDIR}${prefix} ; fi
	if [ ! -d ${DESTDIR}${datarootdir} ] ; then $(MKDIR_P) ${DESTDIR}${datarootdir} ; fi
	if [ ! -d ${DESTDIR}${htmldir} ] ; then $(MKDIR_P) ${DESTDIR}${htmldir} ; fi
	if [ ! -d ${DESTDIR}${mandir} ] ; then $(MKDIR_P) ${DESTDIR}${mandir} ; fi
	if [ ! -d ${DESTDIR}${includedir} ] ; then $(MKDIR_P) ${DESTDIR}${includedir} ; fi
	if [ ! -d ${DESTDIR}${exec_prefix} ] ; then $(MKDIR_P) ${DESTDIR}${exec_prefix} ; fi
	if [ ! -d ${DESTDIR}${libdir} ] ; then $(MKDIR_P) ${DESTDIR}${libdir} ; fi
	${MAKE} install-local
	$(INSTALL_DATA)  src/include/mpi.h ${DESTDIR}${includedir}/mpi.h
	$(INSTALL_DATA)  $(srcdir)/src/include/mpix.h ${DESTDIR}${includedir}/mpix.h
	$(INSTALL_DATA)  lib/lib${MPILIBNAME}.a ${DESTDIR}${libdir}/lib${MPILIBNAME}.a
	if [ ! -d ${DESTDIR}${docdir} ] ; then $(MKDIR_P) ${DESTDIR}${docdir} ; fi
	@if test -d $(srcdir)/www && cd $(srcdir)/www ; then \
	 for name in * ; do \
	  if [ "$$name" = "*" ] ; then continue ; fi ; \
	  if [ -f $$name ] ; then \
	    echo "$(INSTALL_DATA) $$name ${DESTDIR}${htmldir}/$$name" ; \
	    $(INSTALL_DATA) $$name ${DESTDIR}${htmldir}/$$name ; \
	  elif [ -d $$name ] ; then \
	    if [ ! -d ${DESTDIR}${htmldir}/$$name ] ; then $(MKDIR_P) ${DESTDIR}${htmldir}/$$name ; fi ;\
	    ( cd $$name && for name2 in * ; do \
	        if [ "$$name2" = "*" ] ; then continue ; fi ; \
	        if [ -f $$name2 ] ; then \
	            echo "$(INSTALL_DATA) $$name2 ${DESTDIR}${htmldir}/$$name/$$name2" ; \
	            $(INSTALL_DATA) $$name2 ${DESTDIR}${htmldir}/$$name/$$name2 ; \
	        elif [ -d $$name2 ] ; then  \
	            echo "cp -rp $$name2 ${DESTDIR}${htmldir}/$$name" ; \
	            cp -rp $$name2 ${DESTDIR}${htmldir}/$$name ; \
	        fi \
	    done ) ; \
	  else \
	    echo "Unknown file type for $$name" ; \
	  fi ; \
	 done ; \
	fi
	@if test -d $(srcdir)/man && cd $(srcdir)/man ; then \
	 for name in * ; do \
	  if [ "$$name" = "*" ] ; then continue ; fi ; \
	  if [ -f $$name ] ; then \
	    echo "$(INSTALL_DATA) $$name ${DESTDIR}${mandir}/$$name" ; \
	    $(INSTALL_DATA) $$name ${DESTDIR}${mandir}/$$name ; \
	  elif [ -d $$name ] ; then \
	    if [ ! -d ${DESTDIR}${mandir}/$$name ] ; then $(MKDIR_P) ${DESTDIR}${mandir}/$$name ; fi ;\
	    ( cd $$name && for name2 in * ; do \
	        if [ "$$name2" = "*" ] ; then continue ; fi ; \
	        if [ -f $$name2 ] ; then \
	            echo "$(INSTALL_DATA) $$name2 ${DESTDIR}${mandir}/$$name/$$name2" ; \
	            $(INSTALL_DATA) $$name2 ${DESTDIR}${mandir}/$$name/$$name2 ; \
	        elif [ -d $$name2 ] ; then  \
	            echo "cp -rp $$name2 ${DESTDIR}${mandir}/$$name" ; \
	            cp -rp $$name2 ${DESTDIR}${mandir}/$$name ; \
	        fi \
	    done ) ; \
	  else \
	    echo "Unknown file type for $$name" ; \
	  fi ; \
	 done ; \
	fi
	if [ -s src/mpi/romio/include/mpiof.h ] ; then $(INSTALL_DATA)  src/mpi/romio/include/mpiof.h ${DESTDIR}${includedir}/mpiof.h ; fi
	if [ -s src/mpi/romio/include/mpio.h ] ; then $(INSTALL_DATA)  src/mpi/romio/include/mpio.h ${DESTDIR}${includedir}/mpio.h ; fi
	if [ -s lib/lib${MPIFLIBNAME}.a ] ; then $(INSTALL_DATA)  lib/lib${MPIFLIBNAME}.a ${DESTDIR}${libdir}/lib${MPIFLIBNAME}.a ; fi
	if [ -s lib/lib${MPICXXLIBNAME}.a ] ; then $(INSTALL_DATA)  lib/lib${MPICXXLIBNAME}.a ${DESTDIR}${libdir}/lib${MPICXXLIBNAME}.a ; fi
	if [ -s lib/lib${MPIFWRAPNAME}.a ] ; then $(INSTALL_DATA)  lib/lib${MPIFWRAPNAME}.a ${DESTDIR}${libdir}/lib${MPIFWRAPNAME}.a ; fi
	if [ -s lib/lib${PMPILIBNAME}.a ] ; then $(INSTALL_DATA)  lib/lib${PMPILIBNAME}.a ${DESTDIR}${libdir}/lib${PMPILIBNAME}.a ; fi
	if [ -s lib/libf${MPILIBNAME}.a ] ; then $(INSTALL_DATA)  lib/libf${MPILIBNAME}.a ${DESTDIR}${libdir}/libf${MPILIBNAME}.a ; fi
	if [ -s lib/lib${MPILIBNAME}f90.a ] ; then $(INSTALL_DATA)  lib/lib${MPILIBNAME}f90.a ${DESTDIR}${libdir}/lib${MPILIBNAME}f90.a ; fi
	if [ -s lib/lib${MPILIBNAME}.so ] ; then $(CREATESHLIB) -version-info $(ABIVERSION) --mode=install  lib/lib${MPILIBNAME}.so ${DESTDIR}${libdir}/lib${MPILIBNAME}.so ; fi
	if [ -s lib/lib${PMPILIBNAME}.so ] ; then $(CREATESHLIB) -version-info $(ABIVERSION) --mode=install  lib/lib${PMPILIBNAME}.so ${DESTDIR}${libdir}/lib${PMPILIBNAME}.so ; fi
	if [ -s lib/libf${MPILIBNAME}.so ] ; then $(CREATESHLIB) -version-info $(ABIVERSION) --mode=install  lib/libf${MPILIBNAME}.so ${DESTDIR}${libdir}/libf${MPILIBNAME}.so ; fi
	if [ -s lib/lib${MPILIBNAME}f90.so ] ; then $(CREATESHLIB) -version-info $(ABIVERSION) --mode=install  lib/lib${MPILIBNAME}f90.so ${DESTDIR}${libdir}/lib${MPILIBNAME}f90.so ; fi
	if [ -s lib/lib${MPICXXLIBNAME}.so ] ; then $(CREATESHLIB) -version-info $(ABIVERSION) --mode=install  lib/lib${MPICXXLIBNAME}.so ${DESTDIR}${libdir}/lib${MPICXXLIBNAME}.so ; fi
	if [ -s $(srcdir)/doc/userguide/user.pdf ] ; then $(INSTALL_DATA)  $(srcdir)/doc/userguide/user.pdf ${DESTDIR}${docdir}/user.pdf ; fi
	if [ -s $(srcdir)/doc/installguide/install.pdf ] ; then $(INSTALL_DATA)  $(srcdir)/doc/installguide/install.pdf ${DESTDIR}${docdir}/install.pdf ; fi
	if [ -s $(srcdir)/doc/smpd/smpd_pmi.pdf ] ; then $(INSTALL_DATA)  $(srcdir)/doc/smpd/smpd_pmi.pdf ${DESTDIR}${docdir}/smpd_pmi.pdf ; fi
	if [ -s $(srcdir)/doc/logging/logging.pdf ] ; then $(INSTALL_DATA)  $(srcdir)/doc/logging/logging.pdf ${DESTDIR}${docdir}/logging.pdf ; fi
	(cd src/env && $(MAKE) INSTALL_STRIP_FLAG=$(INSTALL_STRIP_FLAG) PACKAGE=$(PACKAGE) prefix=${DESTDIR}${prefix} exec_prefix=${DESTDIR}${exec_prefix} bindir=${DESTDIR}${bindir} libdir=${DESTDIR}${libdir} includedir=${DESTDIR}${includedir} install)
	(cd src/packaging/pkgconfig && $(MAKE) INSTALL_STRIP_FLAG=$(INSTALL_STRIP_FLAG) PACKAGE=$(PACKAGE) prefix=${DESTDIR}${prefix} exec_prefix=${DESTDIR}${exec_prefix} bindir=${DESTDIR}${bindir} libdir=${DESTDIR}${libdir} includedir=${DESTDIR}${includedir} install)
	(cd src/packaging/envmods && $(MAKE) INSTALL_STRIP_FLAG=$(INSTALL_STRIP_FLAG) PACKAGE=$(PACKAGE) prefix=${DESTDIR}${prefix} exec_prefix=${DESTDIR}${exec_prefix} bindir=${DESTDIR}${bindir} libdir=${DESTDIR}${libdir} includedir=${DESTDIR}${includedir} install)
	for dir in  src/binding/cxx - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ;\
		(cd $$dir && $(MAKE) INSTALL_STRIP_FLAG=$(INSTALL_STRIP_FLAG) PACKAGE=$(PACKAGE) prefix=${DESTDIR}${prefix} exec_prefix=${DESTDIR}${exec_prefix} bindir=${DESTDIR}${bindir} libdir=${DESTDIR}${libdir} includedir=${DESTDIR}${includedir} install) ;\
	done
	for dir in  src/mpl src/openpa src/pm/hydra src/mpe2 - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ;\
		(cd $$dir && $(MAKE) INSTALL_STRIP_FLAG=$(INSTALL_STRIP_FLAG) PACKAGE=$(PACKAGE) prefix=${DESTDIR}${prefix} exec_prefix=${DESTDIR}${exec_prefix} bindir=${DESTDIR}${bindir} libdir=${DESTDIR}${libdir} includedir=${DESTDIR}${includedir} install) ;\
	done

install-strip:
	$(MAKE) INSTALL_STRIP_FLAG=-s install
uninstall: 
	-rm -f ${DESTDIR}${includedir}/mpi.h
	-rm -f ${DESTDIR}${includedir}/mpix.h
	-rm -f ${DESTDIR}${libdir}/lib${MPILIBNAME}.a
	-rm -f ${DESTDIR}${includedir}/mpiof.h
	-rm -f ${DESTDIR}${includedir}/mpio.h
	-rm -f ${DESTDIR}${libdir}/lib${MPIFLIBNAME}.a
	-rm -f ${DESTDIR}${libdir}/lib${MPICXXLIBNAME}.a
	-rm -f ${DESTDIR}${libdir}/lib${MPIFWRAPNAME}.a
	-rm -f ${DESTDIR}${libdir}/lib${PMPILIBNAME}.a
	-rm -f ${DESTDIR}${libdir}/libf${MPILIBNAME}.a
	-rm -f ${DESTDIR}${libdir}/lib${MPILIBNAME}f90.a
	-$(CREATESHLIB) --mode=uninstall lib/lib${MPILIBNAME}.so ${DESTDIR}${libdir}/lib${MPILIBNAME}.so
	-$(CREATESHLIB) --mode=uninstall lib/lib${PMPILIBNAME}.so ${DESTDIR}${libdir}/lib${PMPILIBNAME}.so
	-$(CREATESHLIB) --mode=uninstall lib/libf${MPILIBNAME}.so ${DESTDIR}${libdir}/libf${MPILIBNAME}.so
	-$(CREATESHLIB) --mode=uninstall lib/lib${MPILIBNAME}f90.so ${DESTDIR}${libdir}/lib${MPILIBNAME}f90.so
	-$(CREATESHLIB) --mode=uninstall lib/lib${MPICXXLIBNAME}.so ${DESTDIR}${libdir}/lib${MPICXXLIBNAME}.so
	-rm -f ${DESTDIR}${docdir}/user.pdf
	-rm -f ${DESTDIR}${docdir}/install.pdf
	-rm -f ${DESTDIR}${docdir}/smpd_pmi.pdf
	-rm -f ${DESTDIR}${docdir}/logging.pdf
	for dir in src/env src/packaging/pkgconfig src/packaging/envmods  src/binding/cxx  src/mpl src/openpa src/pm/hydra src/mpe2 - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		(cd $$dir && ${MAKE} uninstall ) ; done
installcheck: 
	for dir in src/env src/packaging/pkgconfig src/packaging/envmods  src/binding/cxx  src/mpl src/openpa src/pm/hydra src/mpe2 - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		(cd $$dir && ${MAKE} installcheck ) ; done
	${MAKE} installcheck-postamble
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------
# -*- Mode: makefile; -*-
# Do not include test in the basic build.  
# The all-local target makes sure that when different subsystems are selected
# for the configure step, the libraries are removed and the object files 
# cleaned out.  Without this step, it is possible to run make and encounter
# errors caused by out-of-date objects in the directories and in the 
# library.  We do not replace the pkglist file until the make completes,
# using the all-postamble target.
#
# Here is the logic:
#   A new configure creates lib/newconfig
#   A cleanobjsandlibs step removes that file, as well as removing the
#     libraries and object files
#   The test for whether the clean step is performed is this:
#      Create a file lib/pkglist.new
#      Compare lib/pkglist.new to lib/pkglist
#      If the same, rm lib/pkglist.new and done.
#      If different, then cleanout the libraries and object files,
#          then mv lib/pkglist.new lib/pkglist
#          
all-local:
	@if [ ! -d lib ] ; then mkdir lib ; date > lib/.mpich2created ; \
	else \
	    echo " src/mpid/ch3  src/mpi/romio src/pmi/simple src/pm/hydra src/mpe2 " > lib/pkglist.new ; \
	    echo "gcc    -O2" >>lib/pkglist.new ;\
	    echo "c++   -O2" >> lib/pkglist.new ;\
	    echo "  " >> lib/pkglist.new ;\
	    echo "  " >> lib/pkglist.new ;\
	    echo " '--prefix=/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH' '--disable-f77' '--disable-fc'" >>lib/pkglist.new ; \
	    echo " " >> lib/pkglist.new ;\
	    if diff lib/pkglist lib/pkglist.new >/dev/null 2>&1 ; then \
	        rm -f lib/pkglist.new ; \
            else \
		${MAKE} cleanobjsandlibs ; \
		rm -f lib/pkglist ; \
		mv -f lib/pkglist.new lib/pkglist ; \
	    fi ; \
	fi

clean-preamble:
	${MAKE} cleanlibs

clean-postamble:
	cd examples && ${MAKE} clean

cleanobjsandlibs:
	${MAKE} clean && cd test && ${MAKE} clean
	rm -f lib/newconfig
# cleanlibs makes sure that we clean all of the library files
cleanlibs:
	rm -f lib/lib${MPILIBNAME}.a lib/lib${PMPILIBNAME}.a
	rm -f lib/lib${MPICXXLIBNAME}.a 
	rm -f lib/libf${MPILIBNAME}.a lib/lib${MPILIBNAME}f90.a
	rm -f lib/lib${MPILIBNAME}.so* 
	rm -f lib/lib${PMPILIBNAME}.so*
	rm -f lib/lib${MPICXXLIBNAME}.so* 
	rm -f lib/libf${MPILIBNAME}.so* 
	rm -f lib/lib${MPILIBNAME}f90.so* 
	rm -f lib/lib${MPILIBNAME}f90.*.so* 
	rm -f lib/lib${MPILIBNAME}.*.so* 
	rm -f lib/lib${PMPILIBNAME}.*.so*
	rm -f lib/lib${MPICXXLIBNAME}.*.so* 
	rm -f lib/libf${MPILIBNAME}.*.so* 
	rm -f lib/lib${MPILIBNAME}.la* lib/lib${PMPILIBNAME}.la*
	rm -f lib/lib${MPILIBNAME}f90.la*
	rm -f lib/lib${MPICXXLIBNAME}.la* 
	rm -f lib/libf${MPILIBNAME}.la* 

all-preamble:
	@echo "Beginning make"
	@echo "Using variables CC='gcc' CFLAGS='   -O2' LDFLAGS=' ' F77='' FFLAGS=' ' FC='' FCFLAGS=' ' CXX='c++' CXXFLAGS='  -O2' AR='ar' CPP='gcc -E' CPPFLAGS=' -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpl/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpl/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/openpa/src -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/openpa/src -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/datatype -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/datatype -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/locks -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/locks -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/utils/monitor -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/utils/monitor -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/util/wrappers -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/util/wrappers'"

# Add any final extras:
#    1) Build the debugger interface if requested
# Move the "pkglist.new" file to "pkglist" on successful completion
all-postamble:
	( cd examples && $(MAKE) )
	@if [ "no" = "yes" ] ; then \
	( cd src/mpi/debugger && $(MAKE) ./libtvmpich2.so ) ; fi
	@if [ -s lib/pkglist.new ] ; then mv -f lib/pkglist.new lib/pkglist ; fi
	@echo "Make completed"

# The test on lib/.mpich2created lets us delete the local lib directory
# if we created it, and not otherwise
distclean-local:
	-@rm -f lib/lib${MPILIBNAME}.a lib/pkglist lib/pkglist.new
	-@rm -f lib/lib${MPILIBNAME}.so* lib/lib${MPILIBNAME}.la
	-@if [ -s lib/.mpich2created ] ; then rm -rf lib ; fi
	-@rm -f src/include/${MPILIBNAME}conf.h
	-@rm -f src/include/mpio.h
	-@rm -f bin/mpicc
	-@rm -f bin/mpich2version
	-@cd test && $(MAKE) distclean

# With PACKAGE set, all mpich2 and mpe2 documentation
# will go to docdir=$datarootdir/doc/$PACKAGE,
# and mpe2's exaamples_*/ and logfiles/ go to $datadir/$PACKAGE.
# Unsetting PACKAGE enables docdir=$datarootdir/doc and mpe2 data in $datadir
# User can do "make install PACKAGE=mpich2-xxx" enables
# docdir=$datarootdir/doc/mpich2-xxx and mpe2 data in $datadir/mpich2-xxx.
# PACKAGE = mpich2-1.4.1p1

# We skip the mpid/mm directories because mm is no longer active
# mpe2 is an outside project and is tested against the default
# checks
coding-check: 
	@if [ -z $(CODINGCHECK) ] ;then \
	    echo "You must define CODINGCHECK for this target" ; \
	else \
	   echo "Checking the MPICH2 sources" ;\
	   $(CODINGCHECK) -addchecks=mpich2,funcstates,funcnests \
		-skipfiles=src/mpe2,src/mpid/mm src examples test ;\
	   if [ -d src/mpe2 ] ; then \
	        echo "Checking mpe2 sources" ;\
		$(CODINGCHECK) src/mpe2 ; \
	   fi ; \
	fi

# Set the document sources and types (empty lists still cause recursion)
# These should be empty; any source files should be described in the
# directory that contains those source files.  The presence of these
# items simply indicates that there are such documents

# Add the www index pages
htmldoc-local:
	doc/mansrc/createhtmlindex

# Testing requires installation first
testing:
	(cd test && $(MAKE) testing)

#optinstall_SHLIB = lib/lib${MPIFLIBNAME}.so
#optinstall_SHLIB = lib/lib${MPICXXLIBNAME}.so

# Extra information on creating shared libraries, needed on some platforms
# On the platforms that require these options, we require that 
# PMPILIBNAME and MPILIBNAME be the same.
# UNUSED, example for experimentation only
#lib${MPILIBNAME}_so_EXPORTS = maint/mpi.def
#libf${MPILIBNAME}_so_EXPORTS = maint/fmpi.def
# Add CXXFLAGS to the linker incase the user has used the CXXFLAGS to 
# change the architecture (e.g., -m64 to force 64-bit)
lib${MPICXXLIBNAME}_so_LINKER = false   -O2



# Some of the subsidiary packages may need to be installed.  This target will
# invoke their install targets as part of the installation process

# Install preamble checks for possible problems
install-preamble:
	@if [ "none" = none ] ; then\
             found=no ; \
	     for file in ${libdir}/lib*${MPILIBNAME}.so ; do \
                 if [ -f $$file ] ; then \
		     echo "Remove $$file and rerun ${MAKE} install" ; \
		     found=yes ; \
		 fi ; \
	     done ; \
	     if [ $$found != no ] ; then exit 1 ; fi ;\
	fi

# Install optional features which require special actions:
#   The debugger interface (the "Totalview" DLL)
#   The "other" process managers when more that one are built
# 
# The variables used in the make of install-alt below must be
# the ones within the Makefile - otherwise, if those variables are
# not defined in the shell, the command-line will cause the make step 
# to attempt to install into / and the user's home directory
# (This explanation is here to explain why values in the shell must not
# be used.)
install-local:
	-if [ "no" = "yes" ] ; then \
	    $(INSTALL_DATA) src/mpi/debugger/libtvmpich2.so \
			${DESTDIR}${libdir}/libtvmpich2.so ; fi
	-if [ -n "" ] ; then \
	    for pm in  /dev/null ; do \
		if [ -d src/pm/$$pm ] ; then \
		     (cd src/pm/$$pm && \
		$(MAKE) DESTDIR=${DESTDIR} prefix=${prefix} bindir=${bindir} install-alt ) ; \
		fi ; \
	    done ; \
	fi

# 
# The install-examples target may be used if you want to install the cpi
# program for others to use.  This is nto part of the default installation
# because there isn't a good place to put this in the GNU recommended 
# installation targets (its a kind of hardware-architecture-specific
# documentation)
install-examples:
	if [ ! -d ${DESTDIR}${exec_prefix}/examples ] ; then \
	    $(MKDIR_P) ${DESTDIR}${exec_prefix}/examples ; \
	fi
	$(INSTALL_PROGRAM) examples/cpi ${DESTDIR}${exec_prefix}/examples/cpi

install-devdocs:
	(cd doc && $(MAKE) install-devdocs)

# installcheck-postable adds checks that may require special
# handling.  
# FIXME: Some install checks require that the Process Manager be
# started first.  This step does not handle that.
installcheck-postamble:
	@if [ -n "mpe2" -a -d "src/mpe2" ] ; then \
	    (cd src/mpe2 && $(MAKE) installcheck-all PACKAGE=$(PACKAGE) ; ) ; fi
#
# The documents are shipped as part of the release, and so should be 
# installed from the source directory, not a VPATH build directory
#install_BIN = 
#install_SBIN = 	
# Still to do: figure out the appropriate target for installing the html
# versions of the documents.

.POSIX:

FORCE_TARGET:


ALL: all

MAKE   = make --no-print-directory
SHELL  = /bin/bash
MKDIR  = mkdir
RM     = rm
CP     = cp

top_srcdir        = .
srcdir            = .

# Build directories
includebuild_dir  = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/include
libbuild_dir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/lib
binbuild_dir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/bin
sbinbuild_dir     = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/sbin
etcbuild_dir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/etc

# Building Fortran to C interface
MPE_BUILD_FORTRAN2C  = no
# MPI implementation: used to turn on/off of certain feature
MPI_IMPL             = MPICH2
# MPE header files that are needed by endusers
MPE_HEADERS          = mpe.h mpe_misc.h mpe_callstack.h mpe_log.h mpe_graphics.h

# The empty string, "", in PKGS is needed to avoid /bin/sh from complaining
# when PKGS is really empty.
PKGS = ""  src/misc src/callstack src/logging src/wrappers src/graphics src/collchk src/slog2sdk

all-redirect: 
all: build_include
	$(MAKE) $(MAKEOPTS) build_lib_bin

#######  Building from the source
build_include:
	-@if [ -n "$(includebuild_dir)" ] ; then \
	      if [ ! -d $(includebuild_dir) ] ; then \
	          $(MKDIR) -p $(includebuild_dir) ; \
	      fi ; \
	      cd $(top_srcdir)/include && \
	      for file in $(MPE_HEADERS) ; do \
	          if [ ! -f $(includebuild_dir)/$$file ] ; then \
	              if [ -f $$file ] ; then \
	                  $(CP) $$file $(includebuild_dir) ; \
	              else \
	                  echo "/* This empty MPE header will be replaced by the correct header if the corresponding subpackage is configured successfully. */" > $(includebuild_dir)/$$file ; \
	              fi ; \
	          fi ; \
	      done ; \
	  fi

build_lib_bin:
	@for pkg in $(PKGS) ; do \
	     if [ -n "$$pkg" -a -s $$pkg/Makefile ] ; then \
	         echo ; echo "**** Making $$pkg ...." ; \
	         ( cd $$pkg && $(MAKE) $(MAKEOPTS) ) ; \
                 sleep 1 ; \
	     fi ; \
	 done

build_check:
	@if [ -n "$(MPERUN)" ] ; then \
	     ./sbin/mpecheckbuild -run="$(MPERUN)" ; \
	 else \
	     ./sbin/mpecheckbuild -run ; \
	 fi ; \

check : build_check

FORCE_TARGET:

########  Installing
install: FORCE_TARGET
	@installopts="-dmode=" ; \
	 if [ -n "$(PACKAGE)" ] ; then \
	     installopts="-package=$(PACKAGE) $$installopts" ; \
	 fi ; \
	 if [ -n "$(PREFIX)" ] ; then \
	     installopts="-prefix=$(PREFIX) $$installopts" ; \
	 fi ; \
	 if [ -n "$(prefix)" ] ; then \
	     installopts="-prefix=$(prefix) $$installopts" ; \
	 fi ; \
	 ./sbin/mpeinstall $$installopts

installcheck:
	@installopts="" ; \
	 if [ -n "$(PACKAGE)" ] ; then \
	     installopts="-package=$(PACKAGE) $$installopts" ; \
	 fi ; \
	 if [ -n "$(PREFIX)" ] ; then \
	     installopts="-prefix=$(PREFIX) $$installopts" ; \
	 fi ; \
	 if [ -n "$(prefix)" ] ; then \
	     installopts="-prefix=$(prefix) $$installopts" ; \
	 fi ; \
	 ./sbin/mpecheckinstall $$installopts

installcheck-all:
	@installopts="" ; \
	 if [ -n "$(MPERUN)" ] ; then \
	     installopts="-run=$(MPERUN) $$installopts" ; \
	 else \
	     installopts="-run $$installopts" ; \
	 fi ; \
	 if [ -n "$(PACKAGE)" ] ; then \
	     installopts="-package=$(PACKAGE) $$installopts" ; \
	 fi ; \
	 if [ -n "$(PREFIX)" ] ; then \
	     installopts="-prefix=$(PREFIX) $$installopts" ; \
	 fi ; \
	 if [ -n "$(prefix)" ] ; then \
	     installopts="-prefix=$(prefix) $$installopts" ; \
	 fi ; \
	 ./sbin/mpecheckinstall $$installopts

uninstall:
	@./sbin/mpeuninstall

########  Cleaning
# when "$(top_srcdir)" = ".", it is a non-VPATH build.
clean_include:
	@-if [ -n "$(includebuild_dir)" -a "$(top_srcdir)" != "." \
	       -a "$(includebuild_dir)" != "$(top_srcdir)/include" ] ; then \
	      for file in $(MPE_HEADERS) ; do \
	          $(RM) -f $(includebuild_dir)/$$file ; \
	      done ; \
	  fi

clean_bin:
	@-for file in $(binbuild_dir)/* ; do \
	      case "$$file" in \
	          *.in) ;; \
	          *) $(RM) -f $$file ;; \
	      esac ; \
	  done

clean_lib:
	 -$(RM) -f $(libbuild_dir)/lib*
	 -$(RM) -f $(libbuild_dir)/*.jar
	 -$(RM) -f $(libbuild_dir)/*.o

clean_etc:
	 -$(RM) -f $(etcbuild_dir)/*.conf

clean: clean_lib
	@-for pkg in $(PKGS) ; do \
	      if [ -n "$$pkg" -a -s $$pkg/Makefile ] ; then \
	          ( cd $$pkg && $(MAKE) $(MAKEOPTS) clean ) ; \
	      fi ; \
	  done
	@-$(RM) -f work.pc work.pcl

distclean-misc: clean_include clean_etc
	@-$(RM) -f sbin/mpetestlink sbin/mpetestexec sbin/mpetestexeclog
	@-$(RM) -f sbin/mpecheckinstall sbin/mpecheckbuild
	@-$(RM) -f sbin/mpeinstall sbin/mpeuninstall
	@-$(RM) -f Makefile
	@-$(RM) -f mpe_conf.h
	@-$(RM) -r f77tmpdir
	@-$(RM) -f config.log config.status
	@-$(RM) -rf autom4te*.cache

distclean: clean_bin clean_lib distclean-misc
	@-for pkg in $(PKGS) ; do \
	      if [ -n "$$pkg" -a -s $$pkg/Makefile ] ; then \
	          ( cd $$pkg && $(MAKE) $(MAKEOPTS) distclean ) ; \
	      fi ; \
	  done

maintainer-clean: clean_bin clean_lib distclean-misc
	@-for pkg in $(PKGS) ; do \
	      if [ -n "$$pkg" -a -s $$pkg/Makefile ] ; then \
	          ( cd $$pkg && $(MAKE) $(MAKEOPTS) maintainer-clean ) ; \
	      fi ; \
	  done
	@-$(RM) -f mpe_conf.h.in

owner-clean: clean_bin clean_lib distclean-misc
	@-for pkg in $(PKGS) ; do \
	      if [ -n "$$pkg" -a -s $$pkg/Makefile ] ; then \
	          ( cd $$pkg && $(MAKE) $(MAKEOPTS) owner-clean ) ; \
	      fi ; \
	  done
	@-$(RM) -f mpe_conf.h.in
	@-$(RM) -f configure

configure: configure.in aclocal_core.m4 aclocal_f77.m4 aclocal_make.m4 \
	aclocal_mpi.m4 aclocal.m4
	autoheader
	autoconf

# Allow dependencies target
dependencies:

# Allow a coverage target
coverage:

# Allow a tags target
tags: TAGS
TAGS:

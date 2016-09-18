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
etcbuild_dir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/etc
sbinbuild_dir     = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/sbin

# Building Fortran to C interface
MPE_BUILD_FORTRAN2C  = no
# MPI implementation: used to turn on/off of certain feature
MPI_IMPL             = MPICH2
# MPE header files that are needed by endusers
MPE_HEADERS          = mpe_graphics.h mpe_graphicsf.h

# Assumption: This Makefile won't be created if X is not available
all: build_include build_etc
	$(MAKE) $(MAKEOPTS) build_lib_bin
	$(MAKE) $(MAKEOPTS) linktest_all

#######  Building from the source
build_include:
	@-if [ -n "$(includebuild_dir)" ] ; then \
	      if [ ! -d $(includebuild_dir) ] ; then \
	          $(MKDIR) -p $(includebuild_dir) ; \
	      fi ; \
	      for file in $(MPE_HEADERS) ; do \
	          if [ -f $(top_srcdir)/include/$$file ] ; then \
	              $(CP) -f $(top_srcdir)/include/$$file \
	                       $(includebuild_dir) ; \
	          fi ; \
	      done ; \
	  fi

build_lib_bin:
	@( cd src && $(MAKE) $(MAKEOPTS) )

build_etc:
	@-for file in ./etc/*.conf ; do \
	      $(CP) -f $$file $(etcbuild_dir) ; \
	  done

########  Linkage Tests
linktest_all:
	$(MAKE) $(MAKEOPTS) linktest_C
	$(MAKE) $(MAKEOPTS) linktest_F77

linktest_C:
	@if [    "$(MPI_IMPL)" != "MPICH" \
	      -a "$(MPI_IMPL)" != "MPICH2" ] ; then \
	     ( cd contrib/test && $(MAKE) $(MAKEOPTS) linktest_C ) ; \
	 fi

linktest_F77:
	@if [ "$(MPE_BUILD_FORTRAN2C)" = "yes" ] ; then \
	     if [    "$(MPI_IMPL)" != "MPICH" \
	          -a "$(MPI_IMPL)" != "MPICH2" ] ; then \
	         ( cd contrib/test && $(MAKE) $(MAKEOPTS) linktest_F77 ) ; \
	     fi ; \
         fi
	@echo

########  Cleaning
# This is always a VPATH build, cleaning up the MPE_HEADERS
clean_include:
	@-cd $(includebuild_dir) && \
	  for file in $(MPE_HEADERS) ; do \
	      $(RM) -f $$file ; \
	  done

clean_lib:

clean_bin:

clean_etc:
	@-$(RM) -f ./etc/*.conf

clean: clean_bin clean_lib
	@( cd src && $(MAKE) $(MAKEOPTS) clean )

distclean: clean_include clean_bin clean_lib clean_etc
	@-( cd src && $(MAKE) $(MAKEOPTS) distclean )
	@-$(RM) -f mpe_graphics_conf.h
	@-$(RM) -f Makefile contrib/*/Makefile
	@-$(RM) -f config.log config.status
	@-$(RM) -rf autom4te*.cache

maintainer-clean: distclean
	@-$(RM) -f mpe_graphics_conf.h.in

owner-clean: maintainer-clean
	@-$(RM) -f configure

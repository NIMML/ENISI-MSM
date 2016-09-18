# This Makefile.in created by simplemake.  Do not edit

# src/mpid/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid
MAKE            = make
MPILIBNAME      = mpich

VPATH = .

.SUFFIXES:
# Some make programs complain if no suffixes are set
.SUFFIXES: .c .o
apply: 
	$(ACTION) $(ACTION_INPUT)
	for dir in common ch3 - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		(cd $$dir && ${MAKE} apply ) ; done
clean: 
	-@rm -f *.o ${srcdir}/*.o 
	-@rm -f *.lo ${srcdir}/*.lo
	for dir in common ch3 - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		(cd $$dir && ${MAKE} clean ) ; done
distclean:  clean distclean-xxx remove-makefile
distclean-xxx:
	for dir in common ch3 - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		if [ ! -s $$dir/Makefile ] ; then continue ; fi ;\
		(cd $$dir && ${MAKE} distclean ) ; done
	-@rm -f Makefile
	-@rm -rf autom4te*.cache
	-@for dir in  ch3 globus dcmfd ; do \
	    if [ -s $$dir/Makefile ] ; then \
	      (cd $$dir && ${MAKE} distclean ;) ; fi ; \
	done
	-@rm -rf $(DEPS_DIR)
	-@rm -f TAGS
remove-makefile:
	rm -f Makefile
remove-genmakefiles:
	rm -f  Makefile
all-redirect:
	@(cd common && ${MAKE} all )
	@for dir in ch3 - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		if ( cd $$dir && ${MAKE} all ) ; then : ; else exit 1; fi \
	done

# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------
# SUBDIRS_device_name are the names that @ devicename @ can take in SUBDIRS
# Remove PMPILIBNAME from the common make variables for the mpid
# directories

.POSIX:

FORCE_TARGET:


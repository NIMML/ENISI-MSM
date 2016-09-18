# This Makefile.in created by simplemake.  Do not edit

# doc/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/doc
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/doc
MAKE            = make
MPILIBNAME      = mpich
PMPILIBNAME     = pmpich


VPATH = .
DEVELOPER_SUBDIRS = pmi namepub 

DOC_SUBDIRS = mansrc userguide installguide smpd logging windev design

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
	-@rm -f Makefile
	-@rm -rf autom4te*.cache
	-@rm -rf $(DEPS_DIR)
	-@rm -f TAGS
remove-makefile:
	rm -f Makefile
remove-genmakefiles:
	rm -f  Makefile
all-redirect:

# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------


userdocs:
	for dir in $(DOC_SUBDIRS) ; do \
	    (cd $$dir && $(MAKE) ) ; done

devdocs:
	for dir in $(DEVELOPER_SUBDIRS) ; do \
	    (cd $$dir && $(MAKE) ) ; done

install-devdocs: 
	if [ -z "$(DEV_INSTALL_PREFIX)" ] ; then \
	    echo "DEV_INSTALL_PREFIX must be defined" ; \
	    exit 1 ; \
	fi
	for dir in $(DEVELOPER_SUBDIRS) ; do \
	        export DEV_INSTALL_PREFIX ; \
	        (cd $$dir && $(MAKE) install-devdocs ) ; \
	done




.POSIX:

FORCE_TARGET:


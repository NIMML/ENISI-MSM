# This Makefile.in created by simplemake.  Do not edit

# Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3
MAKE            = make
MPILIBNAME      = mpich

VPATH = .

.SUFFIXES:
# Some make programs complain if no suffixes are set
.SUFFIXES: .c .o
apply: 
	$(ACTION) $(ACTION_INPUT)
	for dir in channels src util ; do \
		(cd $$dir && ${MAKE} apply ) ; done
clean: 
	-@rm -f *.o ${srcdir}/*.o 
	-@rm -f *.lo ${srcdir}/*.lo
	for dir in channels src util ; do \
		(cd $$dir && ${MAKE} clean ) ; done
distclean:  clean distclean-local distclean-xxx remove-makefile
distclean-xxx:
	for dir in channels src util ; do \
		if [ ! -s $$dir/Makefile ] ; then continue ; fi ;\
		(cd $$dir && ${MAKE} distclean ) ; done
	-@rm -f Makefile src/Makefile util/Makefile channels/Makefile util/ftb/Makefile localdefs config.status config.log config.cache *conf.cache config.system
	-@rm -rf autom4te*.cache
	-@rm -f include/mpidi_ch3_conf.h
	-@rm -rf $(DEPS_DIR)
	-@rm -f TAGS
remove-makefile:
	rm -f Makefile
remove-genmakefiles:
	rm -f  Makefile
all-redirect:
	@(cd channels && ${MAKE} all )
	@(cd src && ${MAKE} all )
	@(cd util && ${MAKE} all )

# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------

distclean-local:
	-rm -f include/mpidi_ch3_conf.h 

maintainer-clean-local:
	-rm -f include/mpidi_ch3_conf.h.in

.POSIX:

FORCE_TARGET:


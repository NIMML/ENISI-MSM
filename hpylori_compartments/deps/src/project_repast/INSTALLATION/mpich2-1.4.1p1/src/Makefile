# This Makefile.in created by simplemake.  Do not edit

# src/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
top_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src
MAKE            = make
MPILIBNAME      = mpich
PMPILIBNAME     = pmpich


VPATH = .

.SUFFIXES:
# Some make programs complain if no suffixes are set
.SUFFIXES: .c .o
apply: 
	$(ACTION) $(ACTION_INPUT)
	for dir in mpl mpid mpi mpix util nameserv binding env packaging mpe2 pmi pm - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		(cd $$dir && ${MAKE} apply ) ; done
clean: 
	-@rm -f *.o ${srcdir}/*.o 
	-@rm -f *.lo ${srcdir}/*.lo
	for dir in mpl mpid mpi mpix util nameserv binding env packaging mpe2 pmi pm - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		(cd $$dir && ${MAKE} clean ) ; done
distclean:  clean distclean-local distclean-xxx remove-makefile
distclean-xxx:
	for dir in mpl mpid mpi mpix util nameserv binding env packaging mpe2 pmi pm - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		if [ ! -s $$dir/Makefile ] ; then continue ; fi ;\
		(cd $$dir && ${MAKE} distclean ) ; done
	-@rm -f Makefile
	-@rm -rf autom4te*.cache
	if [ -s mpe2/Makefile ] ; then (cd mpe2 && $(MAKE) distclean ) ; fi
	-@rm -rf $(DEPS_DIR)
	-@rm -f TAGS
remove-makefile:
	rm -f Makefile
remove-genmakefiles:
	rm -f  Makefile
all-redirect:
	@(cd mpl && ${MAKE} all )
	@(cd mpid && ${MAKE} all )
	@(cd mpi && ${MAKE} all )
	@(cd mpix && ${MAKE} all )
	@(cd util && ${MAKE} all )
	@(cd nameserv && ${MAKE} all )
	@(cd binding && ${MAKE} all )
	@(cd env && ${MAKE} all )
	@(cd packaging && ${MAKE} all )
	@for dir in mpe2 - ; do \
		if [ "$$dir" = "-" ] ; then break ; fi ; \
		if ( cd $$dir && ${MAKE} all ) ; then : ; else exit 1; fi \
	done
	@(cd pmi && ${MAKE} all )
	@(cd pm && ${MAKE} all )
	${MAKE} all-postamble

# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------
# Add "include" to the directories used for creating the TAGS files
# We need to invoke the distclean target in the include directory
distclean-local:
	(cd include && $(MAKE) distclean)
all-postamble:
	for dir in mpl openpa ; do \
	    (cd $$dir && ${MAKE} prefix=$(top_builddir) exec_prefix=$(top_builddir) \
	    bindir=$(top_builddir)/bin libdir=$(top_builddir)/lib \
	    includedir=$(top_builddir)/include docdir=$(top_builddir)/share/doc install) ; \
	done

.POSIX:

FORCE_TARGET:


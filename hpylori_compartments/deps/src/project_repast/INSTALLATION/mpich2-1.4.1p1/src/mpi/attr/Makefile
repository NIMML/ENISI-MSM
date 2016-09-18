# This Makefile.in created by simplemake.  Do not edit

# src/mpi/attr/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
AR              = ar
AR_FLAGS        = cr
RANLIB          = ranlib
top_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpi/attr
master_top_srcdir  = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpi/attr
top_srcdir      = ../../..
DEFS            = -DHAVE_CONFIG_H -I. -I${srcdir}
CPPFLAGS        =  -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpl/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpl/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/openpa/src -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/openpa/src -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/datatype -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/datatype -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/locks -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/locks -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/utils/monitor -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/utils/monitor -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/util/wrappers -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/util/wrappers
MAKE            = make
MPILIBNAME      = mpich
PMPILIBNAME     = pmpich

CC              = gcc
CFLAGS          =    -O2 $(MPICH2_MAKE_CFLAGS)
C_COMPILE       = $(CC) $(DEFS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS)
LIBTOOL         = 
CC_SHL          = true
C_COMPILE_SHL   = $(CC_SHL) $(DEFS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS)

VPATH = .
mpi_sources = attr_delete.c attr_get.c attr_put.c \
 comm_create_keyval.c comm_delete_attr.c comm_free_keyval.c \
 comm_get_attr.c comm_set_attr.c keyval_create.c keyval_free.c \
 type_create_keyval.c type_delete_attr.c type_free_keyval.c \
 type_get_attr.c type_set_attr.c win_create_keyval.c \
 win_delete_attr.c win_free_keyval.c win_get_attr.c win_set_attr.c
HEADERS = attr.h
INCLUDES = -I../../include -I${top_srcdir}/src/include

.SUFFIXES:
.SUFFIXES: .o .lo .c 
.c.o:
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC              $<" ; \
	else \
	  echo $(C_COMPILE) -c $< ; \
	fi
	@$(C_COMPILE) -c $<
.c.lo:
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC              $<" ; \
	else \
	  echo $(C_COMPILE_SHL) -c $< -o _s$*.o ; \
	echo mv -f _s$*.o $*.lo ; \
	fi
	@$(C_COMPILE_SHL) -c $< -o _s$*.o
	@mv -f _s$*.o $*.lo
.c:
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC              $<" ; \
	else \
	  echo $(C_COMPILE) -o $* $< $(LDFLAGS) $(LIBS) ; \
	fi
	@$(C_COMPILE) -o $* $< $(LDFLAGS) $(LIBS)
apply: 
	$(ACTION) $(ACTION_INPUT)
clean: 
	-@rm -f *.o ${srcdir}/*.o 
	-@rm -f .libstamp0 .libstamp1 .libstamp2 .libstamp3 
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
all-redirect: .libstamp0 ../../../lib/lib${MPILIBNAME}.a
	@if [ -n "" ] ; then \
	    ${MAKE} .libstamp2 || exit 1; \
	fi
	@if [ "none" != "none" ] ; then \
	    ${MAKE} .libstamp1 || exit 1; \
	    if [ -n "" ] ; then \
	        ${MAKE} .libstamp3 || exit 1; \
	    fi ; \
	fi

.libstamp0 ../../../lib/lib${MPILIBNAME}.a: attr_delete.o attr_get.o attr_put.o \
	comm_create_keyval.o comm_delete_attr.o comm_free_keyval.o comm_get_attr.o \
	comm_set_attr.o keyval_create.o keyval_free.o type_create_keyval.o type_delete_attr.o \
	type_free_keyval.o type_get_attr.o type_set_attr.o win_create_keyval.o win_delete_attr.o \
	win_free_keyval.o win_get_attr.o win_set_attr.o attrutil.o dup_fn.o 
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  AR ${AR_FLAGS} ../../../lib/lib${MPILIBNAME}.a $?" ; \
	else \
	  echo ${AR} ${AR_FLAGS} ../../../lib/lib${MPILIBNAME}.a $? ; \
	fi
	@${AR} ${AR_FLAGS} ../../../lib/lib${MPILIBNAME}.a $?
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  RANLIB          lib${MPILIBNAME}.a" ; \
	else \
	  echo ${RANLIB} ../../../lib/lib${MPILIBNAME}.a ; \
	fi
	@${RANLIB} ../../../lib/lib${MPILIBNAME}.a
	date > .libstamp0
.libstamp1 ../../../lib/lib${MPILIBNAME}.la: attr_delete.lo attr_get.lo attr_put.lo \
	comm_create_keyval.lo comm_delete_attr.lo comm_free_keyval.lo comm_get_attr.lo \
	comm_set_attr.lo keyval_create.lo keyval_free.lo type_create_keyval.lo \
	type_delete_attr.lo type_free_keyval.lo type_get_attr.lo type_set_attr.lo \
	win_create_keyval.lo win_delete_attr.lo win_free_keyval.lo win_get_attr.lo \
	win_set_attr.lo attrutil.lo dup_fn.lo 
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  AR ${AR_FLAGS} ../../../lib/lib${MPILIBNAME}.la $?" ; \
	else \
	  echo ${AR} ${AR_FLAGS} ../../../lib/lib${MPILIBNAME}.la $? ; \
	fi
	@${AR} ${AR_FLAGS} ../../../lib/lib${MPILIBNAME}.la $?
	date > .libstamp1

# --------------------------------------------------------------------------
.libstamp2: _attr_delete.o _attr_get.o _attr_put.o _comm_create_keyval.o _comm_delete_attr.o \
	_comm_free_keyval.o _comm_get_attr.o _comm_set_attr.o _keyval_create.o _keyval_free.o \
	_type_create_keyval.o _type_delete_attr.o _type_free_keyval.o _type_get_attr.o \
	_type_set_attr.o _win_create_keyval.o _win_delete_attr.o _win_free_keyval.o \
	_win_get_attr.o _win_set_attr.o 
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  AR ${AR_FLAGS} ../../../lib/lib${PMPILIBNAME}.a $?" ; \
	else \
	  echo ${AR} ${AR_FLAGS} ../../../lib/lib${PMPILIBNAME}.a $? ; \
	fi
	@${AR} ${AR_FLAGS} ../../../lib/lib${PMPILIBNAME}.a $?
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  RANLIB          lib${PMPILIBNAME}.a" ; \
	else \
	  echo ${RANLIB} ../../../lib/lib${PMPILIBNAME}.a ; \
	fi
	@${RANLIB} ../../../lib/lib${PMPILIBNAME}.a
	date > .libstamp2
.libstamp3: _attr_delete.lo _attr_get.lo _attr_put.lo _comm_create_keyval.lo _comm_delete_attr.lo \
	_comm_free_keyval.lo _comm_get_attr.lo _comm_set_attr.lo _keyval_create.lo \
	_keyval_free.lo _type_create_keyval.lo _type_delete_attr.lo _type_free_keyval.lo \
	_type_get_attr.lo _type_set_attr.lo _win_create_keyval.lo _win_delete_attr.lo \
	_win_free_keyval.lo _win_get_attr.lo _win_set_attr.lo 
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  AR ${AR_FLAGS} ../../../lib/lib${PMPILIBNAME}.la $?" ; \
	else \
	  echo ${AR} ${AR_FLAGS} ../../../lib/lib${PMPILIBNAME}.la $? ; \
	fi
	@${AR} ${AR_FLAGS} ../../../lib/lib${PMPILIBNAME}.la $?
	date > .libstamp3
_attr_delete.o: attr_delete.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/attr_delete.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/attr_delete.c -o _attr_delete.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/attr_delete.c -o _attr_delete.o
_attr_delete.lo: attr_delete.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/attr_delete.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/attr_delete.c -o _attr_delete.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/attr_delete.c -o _attr_delete.lo
_attr_get.o: attr_get.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/attr_get.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/attr_get.c -o _attr_get.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/attr_get.c -o _attr_get.o
_attr_get.lo: attr_get.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/attr_get.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/attr_get.c -o _attr_get.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/attr_get.c -o _attr_get.lo
_attr_put.o: attr_put.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/attr_put.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/attr_put.c -o _attr_put.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/attr_put.c -o _attr_put.o
_attr_put.lo: attr_put.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/attr_put.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/attr_put.c -o _attr_put.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/attr_put.c -o _attr_put.lo
_comm_create_keyval.o: comm_create_keyval.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/comm_create_keyval.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/comm_create_keyval.c -o _comm_create_keyval.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/comm_create_keyval.c -o _comm_create_keyval.o
_comm_create_keyval.lo: comm_create_keyval.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/comm_create_keyval.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/comm_create_keyval.c -o _comm_create_keyval.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/comm_create_keyval.c -o _comm_create_keyval.lo
_comm_delete_attr.o: comm_delete_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/comm_delete_attr.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/comm_delete_attr.c -o _comm_delete_attr.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/comm_delete_attr.c -o _comm_delete_attr.o
_comm_delete_attr.lo: comm_delete_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/comm_delete_attr.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/comm_delete_attr.c -o _comm_delete_attr.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/comm_delete_attr.c -o _comm_delete_attr.lo
_comm_free_keyval.o: comm_free_keyval.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/comm_free_keyval.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/comm_free_keyval.c -o _comm_free_keyval.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/comm_free_keyval.c -o _comm_free_keyval.o
_comm_free_keyval.lo: comm_free_keyval.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/comm_free_keyval.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/comm_free_keyval.c -o _comm_free_keyval.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/comm_free_keyval.c -o _comm_free_keyval.lo
_comm_get_attr.o: comm_get_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/comm_get_attr.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/comm_get_attr.c -o _comm_get_attr.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/comm_get_attr.c -o _comm_get_attr.o
_comm_get_attr.lo: comm_get_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/comm_get_attr.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/comm_get_attr.c -o _comm_get_attr.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/comm_get_attr.c -o _comm_get_attr.lo
_comm_set_attr.o: comm_set_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/comm_set_attr.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/comm_set_attr.c -o _comm_set_attr.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/comm_set_attr.c -o _comm_set_attr.o
_comm_set_attr.lo: comm_set_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/comm_set_attr.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/comm_set_attr.c -o _comm_set_attr.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/comm_set_attr.c -o _comm_set_attr.lo
_keyval_create.o: keyval_create.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/keyval_create.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/keyval_create.c -o _keyval_create.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/keyval_create.c -o _keyval_create.o
_keyval_create.lo: keyval_create.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/keyval_create.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/keyval_create.c -o _keyval_create.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/keyval_create.c -o _keyval_create.lo
_keyval_free.o: keyval_free.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/keyval_free.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/keyval_free.c -o _keyval_free.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/keyval_free.c -o _keyval_free.o
_keyval_free.lo: keyval_free.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/keyval_free.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/keyval_free.c -o _keyval_free.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/keyval_free.c -o _keyval_free.lo
_type_create_keyval.o: type_create_keyval.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/type_create_keyval.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/type_create_keyval.c -o _type_create_keyval.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/type_create_keyval.c -o _type_create_keyval.o
_type_create_keyval.lo: type_create_keyval.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/type_create_keyval.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/type_create_keyval.c -o _type_create_keyval.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/type_create_keyval.c -o _type_create_keyval.lo
_type_delete_attr.o: type_delete_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/type_delete_attr.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/type_delete_attr.c -o _type_delete_attr.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/type_delete_attr.c -o _type_delete_attr.o
_type_delete_attr.lo: type_delete_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/type_delete_attr.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/type_delete_attr.c -o _type_delete_attr.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/type_delete_attr.c -o _type_delete_attr.lo
_type_free_keyval.o: type_free_keyval.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/type_free_keyval.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/type_free_keyval.c -o _type_free_keyval.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/type_free_keyval.c -o _type_free_keyval.o
_type_free_keyval.lo: type_free_keyval.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/type_free_keyval.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/type_free_keyval.c -o _type_free_keyval.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/type_free_keyval.c -o _type_free_keyval.lo
_type_get_attr.o: type_get_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/type_get_attr.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/type_get_attr.c -o _type_get_attr.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/type_get_attr.c -o _type_get_attr.o
_type_get_attr.lo: type_get_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/type_get_attr.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/type_get_attr.c -o _type_get_attr.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/type_get_attr.c -o _type_get_attr.lo
_type_set_attr.o: type_set_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/type_set_attr.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/type_set_attr.c -o _type_set_attr.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/type_set_attr.c -o _type_set_attr.o
_type_set_attr.lo: type_set_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/type_set_attr.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/type_set_attr.c -o _type_set_attr.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/type_set_attr.c -o _type_set_attr.lo
_win_create_keyval.o: win_create_keyval.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/win_create_keyval.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/win_create_keyval.c -o _win_create_keyval.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/win_create_keyval.c -o _win_create_keyval.o
_win_create_keyval.lo: win_create_keyval.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/win_create_keyval.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/win_create_keyval.c -o _win_create_keyval.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/win_create_keyval.c -o _win_create_keyval.lo
_win_delete_attr.o: win_delete_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/win_delete_attr.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/win_delete_attr.c -o _win_delete_attr.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/win_delete_attr.c -o _win_delete_attr.o
_win_delete_attr.lo: win_delete_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/win_delete_attr.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/win_delete_attr.c -o _win_delete_attr.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/win_delete_attr.c -o _win_delete_attr.lo
_win_free_keyval.o: win_free_keyval.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/win_free_keyval.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/win_free_keyval.c -o _win_free_keyval.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/win_free_keyval.c -o _win_free_keyval.o
_win_free_keyval.lo: win_free_keyval.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/win_free_keyval.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/win_free_keyval.c -o _win_free_keyval.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/win_free_keyval.c -o _win_free_keyval.lo
_win_get_attr.o: win_get_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/win_get_attr.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/win_get_attr.c -o _win_get_attr.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/win_get_attr.c -o _win_get_attr.o
_win_get_attr.lo: win_get_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/win_get_attr.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/win_get_attr.c -o _win_get_attr.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/win_get_attr.c -o _win_get_attr.lo
_win_set_attr.o: win_set_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/win_set_attr.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/win_set_attr.c -o _win_set_attr.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/win_set_attr.c -o _win_set_attr.o
_win_set_attr.lo: win_set_attr.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/win_set_attr.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/win_set_attr.c -o _win_set_attr.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/win_set_attr.c -o _win_set_attr.lo
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  attr_delete.c attr_get.c attr_put.c comm_create_keyval.c comm_delete_attr.c \
	comm_free_keyval.c comm_get_attr.c comm_set_attr.c keyval_create.c keyval_free.c \
	type_create_keyval.c type_delete_attr.c type_free_keyval.c type_get_attr.c \
	type_set_attr.c win_create_keyval.c win_delete_attr.c win_free_keyval.c win_get_attr.c \
	win_set_attr.c attrutil.c dup_fn.c 
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------


#


.POSIX:

FORCE_TARGET:


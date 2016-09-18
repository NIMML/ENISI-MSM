# This Makefile.in created by simplemake.  Do not edit

# src/mpi/errhan/Makefile.  Generated from Makefile.in by configure.

# --------------------------------------------------------------------------
all: all-redirect

SHELL           = /bin/bash
AR              = ar
AR_FLAGS        = cr
RANLIB          = ranlib
top_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1
abs_builddir    = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpi/errhan
master_top_srcdir  = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1
srcdir          = .
abs_srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpi/errhan
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
mpi_sources = add_error_code.c add_error_class.c \
 add_error_string.c \
 comm_call_errhandler.c comm_create_errhandler.c \
 comm_get_errhandler.c comm_set_errhandler.c \
 errhandler_create.c errhandler_free.c \
 errhandler_get.c errhandler_set.c error_class.c \
 error_string.c \
 file_create_errhandler.c \
 file_get_errhandler.c file_set_errhandler.c \
 file_call_errhandler.c \
 win_create_errhandler.c win_call_errhandler.c \
 win_get_errhandler.c win_set_errhandler.c 
HEADERS = defmsg.h errcodes.h 
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

.libstamp0 ../../../lib/lib${MPILIBNAME}.a: add_error_code.o add_error_class.o add_error_string.o \
	comm_call_errhandler.o comm_create_errhandler.o comm_get_errhandler.o \
	comm_set_errhandler.o errhandler_create.o errhandler_free.o errhandler_get.o \
	errhandler_set.o error_class.o error_string.o file_create_errhandler.o \
	file_get_errhandler.o file_set_errhandler.o file_call_errhandler.o \
	win_create_errhandler.o win_call_errhandler.o win_get_errhandler.o win_set_errhandler.o \
	errutil.o dynerrutil.o 
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
.libstamp1 ../../../lib/lib${MPILIBNAME}.la: add_error_code.lo add_error_class.lo \
	add_error_string.lo comm_call_errhandler.lo comm_create_errhandler.lo \
	comm_get_errhandler.lo comm_set_errhandler.lo errhandler_create.lo errhandler_free.lo \
	errhandler_get.lo errhandler_set.lo error_class.lo error_string.lo \
	file_create_errhandler.lo file_get_errhandler.lo file_set_errhandler.lo \
	file_call_errhandler.lo win_create_errhandler.lo win_call_errhandler.lo \
	win_get_errhandler.lo win_set_errhandler.lo errutil.lo dynerrutil.lo 
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  AR ${AR_FLAGS} ../../../lib/lib${MPILIBNAME}.la $?" ; \
	else \
	  echo ${AR} ${AR_FLAGS} ../../../lib/lib${MPILIBNAME}.la $? ; \
	fi
	@${AR} ${AR_FLAGS} ../../../lib/lib${MPILIBNAME}.la $?
	date > .libstamp1

# --------------------------------------------------------------------------
.libstamp2: _add_error_code.o _add_error_class.o _add_error_string.o _comm_call_errhandler.o \
	_comm_create_errhandler.o _comm_get_errhandler.o _comm_set_errhandler.o \
	_errhandler_create.o _errhandler_free.o _errhandler_get.o _errhandler_set.o \
	_error_class.o _error_string.o _file_create_errhandler.o _file_get_errhandler.o \
	_file_set_errhandler.o _file_call_errhandler.o _win_create_errhandler.o \
	_win_call_errhandler.o _win_get_errhandler.o _win_set_errhandler.o 
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
.libstamp3: _add_error_code.lo _add_error_class.lo _add_error_string.lo _comm_call_errhandler.lo \
	_comm_create_errhandler.lo _comm_get_errhandler.lo _comm_set_errhandler.lo \
	_errhandler_create.lo _errhandler_free.lo _errhandler_get.lo _errhandler_set.lo \
	_error_class.lo _error_string.lo _file_create_errhandler.lo _file_get_errhandler.lo \
	_file_set_errhandler.lo _file_call_errhandler.lo _win_create_errhandler.lo \
	_win_call_errhandler.lo _win_get_errhandler.lo _win_set_errhandler.lo 
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  AR ${AR_FLAGS} ../../../lib/lib${PMPILIBNAME}.la $?" ; \
	else \
	  echo ${AR} ${AR_FLAGS} ../../../lib/lib${PMPILIBNAME}.la $? ; \
	fi
	@${AR} ${AR_FLAGS} ../../../lib/lib${PMPILIBNAME}.la $?
	date > .libstamp3
_add_error_code.o: add_error_code.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/add_error_code.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/add_error_code.c -o _add_error_code.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/add_error_code.c -o _add_error_code.o
_add_error_code.lo: add_error_code.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/add_error_code.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/add_error_code.c -o _add_error_code.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/add_error_code.c -o _add_error_code.lo
_add_error_class.o: add_error_class.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/add_error_class.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/add_error_class.c -o _add_error_class.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/add_error_class.c -o _add_error_class.o
_add_error_class.lo: add_error_class.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/add_error_class.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/add_error_class.c -o _add_error_class.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/add_error_class.c -o _add_error_class.lo
_add_error_string.o: add_error_string.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/add_error_string.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/add_error_string.c -o _add_error_string.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/add_error_string.c -o _add_error_string.o
_add_error_string.lo: add_error_string.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/add_error_string.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/add_error_string.c -o _add_error_string.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/add_error_string.c -o _add_error_string.lo
_comm_call_errhandler.o: comm_call_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/comm_call_errhandler.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/comm_call_errhandler.c -o _comm_call_errhandler.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/comm_call_errhandler.c -o _comm_call_errhandler.o
_comm_call_errhandler.lo: comm_call_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/comm_call_errhandler.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/comm_call_errhandler.c -o _comm_call_errhandler.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/comm_call_errhandler.c -o _comm_call_errhandler.lo
_comm_create_errhandler.o: comm_create_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/comm_create_errhandler.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/comm_create_errhandler.c -o _comm_create_errhandler.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/comm_create_errhandler.c -o _comm_create_errhandler.o
_comm_create_errhandler.lo: comm_create_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/comm_create_errhandler.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/comm_create_errhandler.c -o _comm_create_errhandler.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/comm_create_errhandler.c -o _comm_create_errhandler.lo
_comm_get_errhandler.o: comm_get_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/comm_get_errhandler.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/comm_get_errhandler.c -o _comm_get_errhandler.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/comm_get_errhandler.c -o _comm_get_errhandler.o
_comm_get_errhandler.lo: comm_get_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/comm_get_errhandler.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/comm_get_errhandler.c -o _comm_get_errhandler.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/comm_get_errhandler.c -o _comm_get_errhandler.lo
_comm_set_errhandler.o: comm_set_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/comm_set_errhandler.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/comm_set_errhandler.c -o _comm_set_errhandler.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/comm_set_errhandler.c -o _comm_set_errhandler.o
_comm_set_errhandler.lo: comm_set_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/comm_set_errhandler.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/comm_set_errhandler.c -o _comm_set_errhandler.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/comm_set_errhandler.c -o _comm_set_errhandler.lo
_errhandler_create.o: errhandler_create.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/errhandler_create.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/errhandler_create.c -o _errhandler_create.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/errhandler_create.c -o _errhandler_create.o
_errhandler_create.lo: errhandler_create.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/errhandler_create.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/errhandler_create.c -o _errhandler_create.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/errhandler_create.c -o _errhandler_create.lo
_errhandler_free.o: errhandler_free.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/errhandler_free.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/errhandler_free.c -o _errhandler_free.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/errhandler_free.c -o _errhandler_free.o
_errhandler_free.lo: errhandler_free.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/errhandler_free.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/errhandler_free.c -o _errhandler_free.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/errhandler_free.c -o _errhandler_free.lo
_errhandler_get.o: errhandler_get.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/errhandler_get.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/errhandler_get.c -o _errhandler_get.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/errhandler_get.c -o _errhandler_get.o
_errhandler_get.lo: errhandler_get.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/errhandler_get.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/errhandler_get.c -o _errhandler_get.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/errhandler_get.c -o _errhandler_get.lo
_errhandler_set.o: errhandler_set.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/errhandler_set.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/errhandler_set.c -o _errhandler_set.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/errhandler_set.c -o _errhandler_set.o
_errhandler_set.lo: errhandler_set.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/errhandler_set.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/errhandler_set.c -o _errhandler_set.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/errhandler_set.c -o _errhandler_set.lo
_error_class.o: error_class.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/error_class.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/error_class.c -o _error_class.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/error_class.c -o _error_class.o
_error_class.lo: error_class.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/error_class.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/error_class.c -o _error_class.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/error_class.c -o _error_class.lo
_error_string.o: error_string.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/error_string.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/error_string.c -o _error_string.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/error_string.c -o _error_string.o
_error_string.lo: error_string.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/error_string.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/error_string.c -o _error_string.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/error_string.c -o _error_string.lo
_file_create_errhandler.o: file_create_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/file_create_errhandler.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/file_create_errhandler.c -o _file_create_errhandler.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/file_create_errhandler.c -o _file_create_errhandler.o
_file_create_errhandler.lo: file_create_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/file_create_errhandler.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/file_create_errhandler.c -o _file_create_errhandler.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/file_create_errhandler.c -o _file_create_errhandler.lo
_file_get_errhandler.o: file_get_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/file_get_errhandler.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/file_get_errhandler.c -o _file_get_errhandler.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/file_get_errhandler.c -o _file_get_errhandler.o
_file_get_errhandler.lo: file_get_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/file_get_errhandler.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/file_get_errhandler.c -o _file_get_errhandler.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/file_get_errhandler.c -o _file_get_errhandler.lo
_file_set_errhandler.o: file_set_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/file_set_errhandler.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/file_set_errhandler.c -o _file_set_errhandler.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/file_set_errhandler.c -o _file_set_errhandler.o
_file_set_errhandler.lo: file_set_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/file_set_errhandler.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/file_set_errhandler.c -o _file_set_errhandler.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/file_set_errhandler.c -o _file_set_errhandler.lo
_file_call_errhandler.o: file_call_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/file_call_errhandler.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/file_call_errhandler.c -o _file_call_errhandler.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/file_call_errhandler.c -o _file_call_errhandler.o
_file_call_errhandler.lo: file_call_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/file_call_errhandler.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/file_call_errhandler.c -o _file_call_errhandler.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/file_call_errhandler.c -o _file_call_errhandler.lo
_win_create_errhandler.o: win_create_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/win_create_errhandler.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/win_create_errhandler.c -o _win_create_errhandler.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/win_create_errhandler.c -o _win_create_errhandler.o
_win_create_errhandler.lo: win_create_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/win_create_errhandler.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/win_create_errhandler.c -o _win_create_errhandler.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/win_create_errhandler.c -o _win_create_errhandler.lo
_win_call_errhandler.o: win_call_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/win_call_errhandler.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/win_call_errhandler.c -o _win_call_errhandler.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/win_call_errhandler.c -o _win_call_errhandler.o
_win_call_errhandler.lo: win_call_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/win_call_errhandler.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/win_call_errhandler.c -o _win_call_errhandler.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/win_call_errhandler.c -o _win_call_errhandler.lo
_win_get_errhandler.o: win_get_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/win_get_errhandler.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/win_get_errhandler.c -o _win_get_errhandler.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/win_get_errhandler.c -o _win_get_errhandler.o
_win_get_errhandler.lo: win_get_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/win_get_errhandler.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/win_get_errhandler.c -o _win_get_errhandler.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/win_get_errhandler.c -o _win_get_errhandler.lo
_win_set_errhandler.o: win_set_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo "  CC             -D<profiling> ${srcdir}/win_set_errhandler.c" ; \
	else \
	  echo $(C_COMPILE) -c  $(srcdir)/win_set_errhandler.c -o _win_set_errhandler.o ; \
	fi
	@$(C_COMPILE) -c  $(srcdir)/win_set_errhandler.c -o _win_set_errhandler.o
_win_set_errhandler.lo: win_set_errhandler.c
	@if [ "x$(VERBOSE)" != "x1" -a "x$(V)" != "x1" ] ; then \
	  echo " CC           -D<profiling> $(srcdir)/win_set_errhandler.c" ; \
	else \
	  echo $(C_COMPILE_SHL) -c  $(srcdir)/win_set_errhandler.c -o _win_set_errhandler.lo ; \
	fi
	@$(C_COMPILE_SHL) -c  $(srcdir)/win_set_errhandler.c -o _win_set_errhandler.lo
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
# --------------------------------------------------------------------------
SOURCES         =  add_error_code.c add_error_class.c add_error_string.c comm_call_errhandler.c \
	comm_create_errhandler.c comm_get_errhandler.c comm_set_errhandler.c errhandler_create.c \
	errhandler_free.c errhandler_get.c errhandler_set.c error_class.c error_string.c \
	file_create_errhandler.c file_get_errhandler.c file_set_errhandler.c \
	file_call_errhandler.c win_create_errhandler.c win_call_errhandler.c win_get_errhandler.c \
	win_set_errhandler.c errutil.c dynerrutil.c 
HEADERFILES     = $(HEADERS)
SOURCEFILES     = $(SOURCES)
# --------------------------------------------------------------------------
#

.POSIX:

FORCE_TARGET:


### End User configurable options ###
SHELL = /bin/bash

# Installation directories ( not being used here )
prefix           = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH
exec_prefix      = ${prefix}
bindir           = ${exec_prefix}/bin
includedir       = ${prefix}/include
libdir           = ${exec_prefix}/lib

# Build directories
libbuild_dir     = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/src/slog2sdk/trace_rlog/lib
binbuild_dir     = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpe2/src/slog2sdk/trace_rlog/bin
includebuild_dir = @includebuild_dir@
top_srcdir       = ..
srcdir           = .

TRACE_HOME       = $(top_srcdir)/..
TRACE_INCDIR     = $(TRACE_HOME)/src/logformat/trace
TRACE_SRCDIR     = $(TRACE_HOME)/src/logformat/trace

# Use VPATH so logformat/trace/*.c(h) do NOT need to be here.
VPATH=.:$(srcdir):$(TRACE_SRCDIR)

# Define the TRACE-API shared library name and utility program names here
LIB_TRACE        = libTraceInput.la
PGM_PRINT        = rlog_print
PGM_CHECK        = rlog_check_timeorder

# Define the TRACE-API implementation here, only variable needs to be changed
IMPL_CSRC        = trace_input.c rlogutil.c

# the next 3 lines should NOT be changed 
CSRC             = $(IMPL_CSRC) logformat_trace_InputLog.c
CSRC4T           = $(IMPL_CSRC) trace_print.c
CSRC4E           = $(IMPL_CSRC) trace_check_timeorder.c

OBJ              = $(CSRC:.c=.o)
LOBJ             = $(CSRC:.c=.lo)
OBJ4T            = $(CSRC4T:.c=.o)
OBJ4E            = $(CSRC4E:.c=.o)

CC               = gcc
LDF              = gcc     -O2  
INSTALL          = /usr/bin/install -c 
LIBTOOL          = $(SHELL) ../libtool
EXPORT_SYMBOLS   = yes
RM               = rm -f

JNI_INC          = -I/usr/lib/jvm/java-8-openjdk-amd64/include -I/usr/lib/jvm/java-8-openjdk-amd64/include/linux
CFLAGS           = -I.. $(JNI_INC) -I$(TRACE_INCDIR)     -O2
LTLDFLAGS        = -module -no-undefined -avoid-version 

# memory leak checker
MEMLIBS          = 

.SUFFIXES:
.SUFFIXES: .h .c .o .lo .la 

.c.o:
	$(CC) $(CFLAGS) -c $<

.c.lo:
	$(LIBTOOL) --mode=compile $(CC) $(CFLAGS) -c $<

ALL: $(libbuild_dir)/$(LIB_TRACE)
	$(MAKE) $(MAKEOPTS) $(binbuild_dir)/$(PGM_PRINT)
	$(MAKE) $(MAKEOPTS) $(binbuild_dir)/$(PGM_CHECK)

$(libbuild_dir)/$(LIB_TRACE): $(LOBJ)
	if [ "$(EXPORT_SYMBOLS)" = "yes" ] ; then \
	    $(LIBTOOL) --mode=link $(LDF) $(LTLDFLAGS) -o $(LIB_TRACE) $(LOBJ) \
	               -export-symbols $(srcdir)/JavaTraceInput.sym \
	               -rpath $(libbuild_dir) ; \
	else \
	    $(LIBTOOL) --mode=link $(LDF) $(LTLDFLAGS) -o $(LIB_TRACE) $(LOBJ) \
	               -rpath $(libbuild_dir) ; \
	fi
	$(LIBTOOL) --mode=install $(INSTALL) $(LIB_TRACE) $(libbuild_dir)
	$(LIBTOOL) --finish $(libbuild_dir)

INSTALL_LIBSO: $(LOBJ)
	if [ "$(EXPORT_SYMBOLS)" = "yes" ] ; then \
	    $(LIBTOOL) --mode=link $(LDF) $(LTLDFLAGS) -o $(LIB_TRACE) $(LOBJ) \
	               -export-symbols $(srcdir)/JavaTraceInput.sym \
	               -rpath $(LIBDIR) ; \
	else \
	    $(LIBTOOL) --mode=link $(LDF) $(LTLDFLAGS) -o $(LIB_TRACE) $(LOBJ) \
	               -rpath $(LIBDIR) ; \
	fi
	$(LIBTOOL) --mode=install $(INSTALL) $(LIB_TRACE) $(DESTDIR)$(LIBDIR)
	$(LIBTOOL) --finish $(LIBDIR)

$(binbuild_dir)/$(PGM_PRINT): $(OBJ4T)
	$(LDF) -o $@ $(OBJ4T) $(MEMLIBS)

$(binbuild_dir)/$(PGM_CHECK): $(OBJ4E)
	$(LDF) -o $@ $(OBJ4E) $(MEMLIBS)

clean:
	@-$(RM) *.o *.lo *.la

realclean: clean
	$(LIBTOOL) --mode=uninstall $(RM) $(libbuild_dir)/$(LIB_TRACE)
	@-$(RM) $(binbuild_dir)/$(PGM_PRINT) $(binbuild_dir)/$(PGM_CHECK)
	@-$(RM) -r .libs

distclean: realclean
	@-$(RM) Makefile

CC          = gcc
AR          = ar cr
RANLIB      = ranlib
LIBNAME     = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/lib/libmpich.a
srcdir      = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpi/romio/adio/ad_xfs
CC_SHL      = true
SHLIBNAME   = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/lib/libmpich

INCLUDES    = -I. -I${srcdir}/../include -I../include -I../../include  -I${srcdir}/../../../../include -I../../../../include
CFLAGS      =  -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpl/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpl/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/openpa/src -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/openpa/src -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/datatype -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/datatype -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/locks -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/common/locks -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/include -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/utils/monitor -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/mpid/ch3/channels/nemesis/nemesis/utils/monitor -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/util/wrappers -I/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1/src/util/wrappers    -O2  -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_ROMIOCONF_H -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 $(INCLUDES)

top_builddir  = /home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/INSTALLATION/mpich2-1.4.1p1
LIBTOOL       = 
C_COMPILE_SHL = $(CC_SHL)

VPATH=.:${srcdir}

AD_XFS_OBJECTS = ad_xfs_read.o \
      ad_xfs_open.o ad_xfs_write.o ad_xfs_done.o \
      ad_xfs_fcntl.o ad_xfs_iread.o ad_xfs_iwrite.o ad_xfs_wait.o \
      ad_xfs_resize.o ad_xfs_hints.o \
      ad_xfs.o

default: $(LIBNAME)
	@if [ "none" != "none" ] ; then \
	    $(MAKE) $(SHLIBNAME).la ;\
	fi

.SUFFIXES: $(SUFFIXES) .p .lo

.c.o:
	$(CC) $(CFLAGS) -c $<

.c.lo:
	$(C_COMPILE_SHL) $(CFLAGS) -c $< -o _s$*.o
	@mv -f _s$*.o $*.lo

$(LIBNAME): $(AD_XFS_OBJECTS)
	$(AR) $(LIBNAME) $(AD_XFS_OBJECTS)
	$(RANLIB) $(LIBNAME) 

AD_XFS_LOOBJECTS=$(AD_XFS_OBJECTS:.o=.lo)
$(SHLIBNAME).la: $(AD_XFS_LOOBJECTS)
	$(AR) $(SHLIBNAME).la $(AD_XFS_LOOBJECTS)

clean:
	@rm -f *.o *.lo *.gcno *.gcda *.bb *.bbg
	@rm -f ${srcdir}/*.gcno ${srcdir}/*.gcda 
	@rm -f ${srcdir}/*.bb ${srcdir}/*.bbg

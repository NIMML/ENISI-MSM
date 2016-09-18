/* include/mpidi_ch3i_nemesis_conf.h.  Generated from mpidi_ch3i_nemesis_conf.h.in by configure.  */
/* include/mpidi_ch3i_nemesis_conf.h.in.  Generated from configure.in by autoheader.  */

/* -*- Mode: C; c-basic-offset:4 ; -*- */
/*  
 *  (C) 2001 by Argonne National Laboratory.
 *      See COPYRIGHT in top-level directory.
 */
#ifndef MPIDI_CH3I_NEMESIS_CONF_H_INCLUDED
#define MPIDI_CH3I_NEMESIS_CONF_H_INCLUDED


/* Define to disable shared-memory communication for debugging */
/* #undef ENABLED_NO_LOCAL */

/* Define to enable debugging mode where shared-memory communication is done
   only between even procs or odd procs */
/* #undef ENABLED_ODD_EVEN_CLIQUES */

/* Define to enable shared-memory collectives */
/* #undef ENABLED_SHM_COLLECTIVES */

/* define to add per-vc function pointers to override send and recv functions
   */
/* #undef ENABLE_COMM_OVERRIDES */

/* Define to remove yield()s in polling loops */
/* #undef ENABLE_NO_YIELD */

/* Define to 1 if you have the <assert.h> header file. */
#define HAVE_ASSERT_H 1

/* Define to 1 if you have the <errno.h> header file. */
#define HAVE_ERRNO_H 1

/* Define if struct hostent contains h_addr_list */
#define HAVE_H_ADDR_LIST 1

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define if you have the <knem_io.h> header file. */
/* #undef HAVE_KNEM_IO_H */

/* Define to 1 if you have the `elan' library (-lelan). */
/* #undef HAVE_LIBELAN */

/* Define to 1 if you have the `gm' library (-lgm). */
/* #undef HAVE_LIBGM */

/* Define to 1 if you have the `myriexpress' library (-lmyriexpress). */
/* #undef HAVE_LIBMYRIEXPRESS */

/* Define to 1 if you have the `nmad' library (-lnmad). */
/* #undef HAVE_LIBNMAD */

/* Define to 1 if you have the `psm_infinipath' library (-lpsm_infinipath). */
/* #undef HAVE_LIBPSM_INFINIPATH */

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if you have the `mkstemp' function. */
#define HAVE_MKSTEMP 1

/* Define to 1 if you have the `mmap' function. */
#define HAVE_MMAP 1

/* Define to 1 if you have the `munmap' function. */
#define HAVE_MUNMAP 1

/* Define to 1 if you have the <netdb.h> header file. */
#define HAVE_NETDB_H 1

/* Define if netinet/in.h exists */
#define HAVE_NETINET_IN_H 1

/* Define if you have the <net/if.h> header file. */
#define HAVE_NET_IF_H 1

/* Define to 1 if you have the `rand' function. */
#define HAVE_RAND 1

/* Define to 1 if you have the <sched.h> header file. */
#define HAVE_SCHED_H 1

/* Define to 1 if you have the `shmat' function. */
/* #undef HAVE_SHMAT */

/* Define to 1 if you have the `shmctl' function. */
/* #undef HAVE_SHMCTL */

/* Define to 1 if you have the `shmdt' function. */
/* #undef HAVE_SHMDT */

/* Define to 1 if you have the `shmget' function. */
/* #undef HAVE_SHMGET */

/* Define to 1 if you have the `signal' function. */
#define HAVE_SIGNAL 1

/* Define to 1 if you have the <signal.h> header file. */
#define HAVE_SIGNAL_H 1

/* Define to 1 if you have the `srand' function. */
#define HAVE_SRAND 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the `strtoll' function. */
/* #undef HAVE_STRTOLL */

/* Define if struct ifconf can be used */
#define HAVE_STRUCT_IFCONF 1

/* Define to 1 if you have the <sys/ioctl.h> header file. */
#define HAVE_SYS_IOCTL_H 1

/* Define to 1 if you have the <sys/ipc.h> header file. */
#define HAVE_SYS_IPC_H 1

/* Define to 1 if you have the <sys/mman.h> header file. */
#define HAVE_SYS_MMAN_H 1

/* Define to 1 if you have the <sys/shm.h> header file. */
#define HAVE_SYS_SHM_H 1

/* Define to 1 if you have the <sys/socket.h> header file. */
#define HAVE_SYS_SOCKET_H 1

/* Define to 1 if you have the <sys/sockio.h> header file. */
/* #undef HAVE_SYS_SOCKIO_H */

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define to enable multirail support in newmad module */
/* #undef MPID_MAD_MODULE_MULTIRAIL */

/* Define to turn on the inlining optimizations in Nemesis code */
#define MPID_NEM_INLINE 1

/* Method for local large message transfers. */
#define MPID_NEM_LOCAL_LMT_IMPL MPID_NEM_LOCAL_LMT_SHM_COPY

/* Choose netmod */
#define MPID_NEM_NET_MODULE MPID_NEM_NONE

/* Define to enable lock-free communication queues */
#define MPID_NEM_USE_LOCK_FREE_QUEUES 1

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT ""

/* Define to the full name of this package. */
#define PACKAGE_NAME ""

/* Define to the full name and version of this package. */
#define PACKAGE_STRING ""

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME ""

/* Define to the version of this package. */
#define PACKAGE_VERSION ""

/* Define to turn on the prefetching optimization in Nemesis code */
#define PREFETCH_CELL 1

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Define to use the fastboxes in Nemesis code */
#define USE_FASTBOX 1

/* Define if we have sysv shared memory */
#define USE_MMAP_SHM 1

/* Define if _POSIX_C_SOURCE needs to be undefined for struct ifconf */
/* #undef USE_NOPOSIX_FOR_IFCONF */

/* Define if _SVID_SOURCE needs to be defined for struct ifconf */
/* #undef USE_SVIDSOURCE_FOR_IFCONF */

/* Define if we have sysv shared memory */
/* #undef USE_SYSV_SHM */

/* Define to `__inline__' or `__inline' if that's what the C compiler
   calls it, or to nothing if 'inline' is not supported under any name.  */
#ifndef __cplusplus
/* #undef inline */
#endif

/* Define to `int' if <sys/types.h> does not define. */
/* #undef pid_t */

#endif

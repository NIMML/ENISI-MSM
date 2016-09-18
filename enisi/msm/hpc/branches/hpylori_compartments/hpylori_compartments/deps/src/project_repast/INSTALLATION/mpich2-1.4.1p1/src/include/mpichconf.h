/* src/include/mpichconf.h.  Generated from mpichconf.h.in by configure.  */
/* src/include/mpichconf.h.in.  Generated from configure.in by autoheader.  */

/* -*- Mode: C; c-basic-offset:4 ; -*- */
/*  
 *  (C) 2001 by Argonne National Laboratory.
 *      See COPYRIGHT in top-level directory.
 */
#ifndef MPICHCONF_H_INCLUDED
#define MPICHCONF_H_INCLUDED


/* define if char * is byte pointer */
/* #undef CHAR_PTR_IS_BYTE */

/* define to enable collection of statistics */
/* #undef COLLECT_STATS */

/* Define to one of `_getb67', `GETB67', `getb67' for Cray-2 and Cray-YMP
   systems. This function is required for `alloca.c' support on those systems.
   */
/* #undef CRAY_STACKSEG_END */

/* Define to 1 if using `alloca.c'. */
/* #undef C_ALLOCA */

/* Application checkpointing enabled */
/* #undef ENABLE_CHECKPOINTING */

/* The value of false in Fortran */
/* #undef F77_FALSE_VALUE */

/* Fortran names are lowercase with no trailing underscore */
/* #undef F77_NAME_LOWER */

/* Fortran names are lowercase with two trailing underscores */
/* #undef F77_NAME_LOWER_2USCORE */

/* Fortran names are lowercase with two trailing underscores in stdcall */
/* #undef F77_NAME_LOWER_2USCORE_STDCALL */

/* Fortran names are lowercase with no trailing underscore in stdcall */
/* #undef F77_NAME_LOWER_STDCALL */

/* Fortran names are lowercase with one trailing underscore */
/* #undef F77_NAME_LOWER_USCORE */

/* Fortran names are lowercase with one trailing underscore in stdcall */
/* #undef F77_NAME_LOWER_USCORE_STDCALL */

/* Fortran names preserve the original case */
/* #undef F77_NAME_MIXED */

/* Fortran names preserve the original case in stdcall */
/* #undef F77_NAME_MIXED_STDCALL */

/* Fortran names preserve the original case with one trailing underscore */
/* #undef F77_NAME_MIXED_USCORE */

/* Fortran names preserve the original case with one trailing underscore in
   stdcall */
/* #undef F77_NAME_MIXED_USCORE_STDCALL */

/* Fortran names are uppercase */
/* #undef F77_NAME_UPPER */

/* Fortran names are uppercase in stdcall */
/* #undef F77_NAME_UPPER_STDCALL */

/* The value of true in Fortran */
/* #undef F77_TRUE_VALUE */

/* Define if we know the value of Fortran true and false */
/* #undef F77_TRUE_VALUE_SET */

/* Directory to use in namepub */
#define FILE_NAMEPUB_BASEDIR "."

/* Define if addresses are a different size than Fortran integers */
/* #undef HAVE_AINT_DIFFERENT_THAN_FINT */

/* Define if addresses are larger than Fortran integers */
/* #undef HAVE_AINT_LARGER_THAN_FINT */

/* Define to 1 if you have the `alarm' function. */
#define HAVE_ALARM 1

/* Define to 1 if you have `alloca', as a function or macro. */
#define HAVE_ALLOCA 1

/* Define to 1 if you have <alloca.h> and it should be used (not on Ultrix).
   */
#define HAVE_ALLOCA_H 1

/* Define if int32_t works with any alignment */
#define HAVE_ANY_INT32_T_ALIGNMENT 1

/* Define if int64_t works with any alignment */
#define HAVE_ANY_INT64_T_ALIGNMENT 1

/* Define to 1 if you have the <assert.h> header file. */
#define HAVE_ASSERT_H 1

/* Define to 1 if you have the `bindprocessor' function. */
/* #undef HAVE_BINDPROCESSOR */

/* define if the compiler defines __FUNC__ */
/* #undef HAVE_CAP__FUNC__ */

/* Define to 1 if you have the `clock_getres' function. */
#define HAVE_CLOCK_GETRES 1

/* Define to 1 if you have the `clock_gettime' function. */
#define HAVE_CLOCK_GETTIME 1

/* Define to 1 if you have the <complex.h> header file. */
#define HAVE_COMPLEX_H 1

/* Define if CPU_SET and CPU_ZERO defined */
/* #undef HAVE_CPU_SET_MACROS */

/* Define if cpu_set_t is defined in sched.h */
#define HAVE_CPU_SET_T 1

/* Define if C++ is supported */
#define HAVE_CXX_BINDING 1

/* Define is C++ supports complex types */
#define HAVE_CXX_COMPLEX 1

/* define if the compiler supports exceptions */
#define HAVE_CXX_EXCEPTIONS /**/

/* Define if multiple __attribute__((alias)) are supported */
/* #undef HAVE_C_MULTI_ATTR_ALIAS */

/* Define if debugger support is included */
/* #undef HAVE_DEBUGGER_SUPPORT */

/* Define to 1 if you have the declaration of `strerror_r', and to 0 if you
   don't. */
#define HAVE_DECL_STRERROR_R 1

/* Define to 1 if you have the <dlfcn.h> header file. */
/* #undef HAVE_DLFCN_H */

/* Define to 1 if you have the `dlopen' function. */
/* #undef HAVE_DLOPEN */

/* Define to 1 if you have the `dlsym' function. */
/* #undef HAVE_DLSYM */

/* Controls how alignment of doubles is performed, separate from other FP
   values */
/* #undef HAVE_DOUBLE_ALIGNMENT_EXCEPTION */

/* Controls how alignment is applied based on position of doubles in the
   structure */
/* #undef HAVE_DOUBLE_POS_ALIGNMENT */

/* Define to 1 if the system has the type `double _Complex'. */
#define HAVE_DOUBLE__COMPLEX 1

/* Define to 1 if you have the <endian.h> header file. */
#define HAVE_ENDIAN_H 1

/* Define to 1 if you have the <errno.h> header file. */
#define HAVE_ERRNO_H 1

/* Define to enable error checking */
#define HAVE_ERROR_CHECKING MPID_ERROR_LEVEL_ALL

/* Define if Fortran 90 type routines available */
/* #undef HAVE_FC_TYPE_ROUTINES */

/* Define to 1 if you have the `fdopen' function. */
#define HAVE_FDOPEN 1

/* Define if Fortran integer are the same size as C ints */
/* #undef HAVE_FINT_IS_INT */

/* Define to 1 if the system has the type `float _Complex'. */
#define HAVE_FLOAT__COMPLEX 1

/* Define if Fortran is supported */
/* #undef HAVE_FORTRAN_BINDING */

/* Define if using gcc on a system with an IA64 class chip */
/* #undef HAVE_GCC_AND_IA64_ASM */

/* Define if using gcc on a system with an Intel Pentium class chip */
/* #undef HAVE_GCC_AND_PENTIUM_ASM */

/* Define if using gcc on a system with an AMD x86_64 class chip */
#define HAVE_GCC_AND_X86_64_ASM 1

/* Define if GNU __attribute__ is supported */
#define HAVE_GCC_ATTRIBUTE 1

/* Define to 1 if you have the `gethrtime' function. */
/* #undef HAVE_GETHRTIME */

/* Define to 1 if you have the `getpid' function. */
#define HAVE_GETPID 1

/* Define to 1 if you have the `gettimeofday' function. */
#define HAVE_GETTIMEOFDAY 1

/* Define if int16_t is supported by the C compiler */
#define HAVE_INT16_T 1

/* Define if int32_t is supported by the C compiler */
#define HAVE_INT32_T 1

/* Define if int64_t is supported by the C compiler */
#define HAVE_INT64_T 1

/* Define if int8_t is supported by the C compiler */
#define HAVE_INT8_T 1

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define when alignment of structures is based on largest component */
/* #undef HAVE_LARGEST_STRUCT_ALIGNMENT */

/* Define to 1 if you have the `cr' library (-lcr). */
/* #undef HAVE_LIBCR */

/* Define to 1 if you have the <limits.h> header file. */
#define HAVE_LIMITS_H 1

/* Controls how alignment is applied based on position of long long ints in
   the structure */
/* #undef HAVE_LLINT_POS_ALIGNMENT */

/* Define if long double is supported */
#define HAVE_LONG_DOUBLE 1

/* Define to 1 if the system has the type `long double _Complex'. */
#define HAVE_LONG_DOUBLE__COMPLEX 1

/* Define if long long allowed */
/* #undef HAVE_LONG_LONG */

/* Define if long long is supported */
#define HAVE_LONG_LONG_INT 1

/* Define to 1 if you have the `mach_absolute_time' function. */
/* #undef HAVE_MACH_ABSOLUTE_TIME */

/* Define if C99-style variable argument list macro functionality */
#define HAVE_MACRO_VA_ARGS 1

/* Controls byte alignment of structs with doubles */
#define HAVE_MAX_DOUBLE_FP_ALIGNMENT 8

/* Controls byte alignment of structures with floats, doubles, and long
   doubles (for MPI structs) */
#define HAVE_MAX_FP_ALIGNMENT 16

/* Controls byte alignment of integer structures (for MPI structs) */
#define HAVE_MAX_INTEGER_ALIGNMENT 8

/* Controls byte alignment of structs with long doubles */
#define HAVE_MAX_LONG_DOUBLE_FP_ALIGNMENT 16

/* Controls byte alignment of structures (for aligning allocated structures)
   */
#define HAVE_MAX_STRUCT_ALIGNMENT 8

/* Define to 1 if you have the <memory.h> header file. */
/* #undef HAVE_MEMORY_H */

/* Define to 1 if you have the `mkstemp' function. */
#define HAVE_MKSTEMP 1

/* Define so that we can test whether the mpichconf.h file has been included
   */
#define HAVE_MPICHCONF 1

/* Define if the Fortran init code for MPI works from C programs without
   special libraries */
/* #undef HAVE_MPI_F_INIT_WORKS_WITH_C */

/* Define if multiple weak symbols may be defined */
#define HAVE_MULTIPLE_PRAGMA_WEAK 1

/* Define if a name publishing service is available */
#define HAVE_NAMEPUB_SERVICE 1

/* define if the compiler implements namespaces */
#define HAVE_NAMESPACES /**/

/* define if the compiler implements namespace std */
#define HAVE_NAMESPACE_STD /**/

/* Define if the Fortran types are not available in C */
#define HAVE_NO_FORTRAN_MPI_TYPES_IN_C 1

/* Define is the OSX thread affinity policy macros defined */
/* #undef HAVE_OSX_THREAD_AFFINITY */

/* Cray style weak pragma */
/* #undef HAVE_PRAGMA_CRI_DUP */

/* HP style weak pragma */
/* #undef HAVE_PRAGMA_HP_SEC_DEF */

/* Supports weak pragma */
#define HAVE_PRAGMA_WEAK 1

/* Define to 1 if you have the `pthread_cleanup_push' function. */
/* #undef HAVE_PTHREAD_CLEANUP_PUSH */

/* Define if pthread_cleanup_push is available, even as a macro */
/* #undef HAVE_PTHREAD_CLEANUP_PUSH_MACRO */

/* Define to 1 if you have the <pthread.h> header file. */
#define HAVE_PTHREAD_H 1

/* Define if PTHREAD_MUTEX_RECURSIVE is available in pthread.h */
#define HAVE_PTHREAD_MUTEX_RECURSIVE 1

/* Define if PTHREAD_MUTEX_RECURSIVE_NP is available in pthread.h */
#define HAVE_PTHREAD_MUTEX_RECURSIVE_NP 1

/* Define to 1 if you have the `pthread_yield' function. */
#define HAVE_PTHREAD_YIELD 1

/* Define to 1 if you have the `putenv' function. */
#define HAVE_PUTENV 1

/* Define to 1 if you have the `qsort' function. */
#define HAVE_QSORT 1

/* Define if ROMIO is enabled */
#define HAVE_ROMIO 1

/* Define if MPI supports MPI_THREAD_MULTIPLE with a runtime check for thread
   level */
#define HAVE_RUNTIME_THREADCHECK 1

/* Define to 1 if you have the `sched_getaffinity' function. */
#define HAVE_SCHED_GETAFFINITY 1

/* Define to 1 if you have the <sched.h> header file. */
#define HAVE_SCHED_H 1

/* Define to 1 if you have the `sched_setaffinity' function. */
#define HAVE_SCHED_SETAFFINITY 1

/* Define to 1 if you have the `sched_yield' function. */
#define HAVE_SCHED_YIELD 1

/* Define to 1 if you have the <search> header file. */
/* #undef HAVE_SEARCH */

/* Define to 1 if you have the `select' function. */
#define HAVE_SELECT 1

/* Define to 1 if you have the `setitimer' function. */
#define HAVE_SETITIMER 1

/* Define to 1 if you have the `sleep' function. */
#define HAVE_SLEEP 1

/* Define to 1 if you have the `snprintf' function. */
#define HAVE_SNPRINTF 1

/* Define to 1 if you have the <stdarg.h> header file. */
#define HAVE_STDARG_H 1

/* Define to 1 if you have the <stdbool.h> header file. */
#define HAVE_STDBOOL_H 1

/* Define to 1 if you have the <stddef.h> header file. */
#define HAVE_STDDEF_H 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdio.h> header file. */
/* #undef HAVE_STDIO_H */

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the `strdup' function. */
#define HAVE_STRDUP 1

/* Define to 1 if you have the `strerror' function. */
#define HAVE_STRERROR 1

/* Define to 1 if you have the `strerror_r' function. */
#define HAVE_STRERROR_R 1

/* Define to 1 if you have the <strings.h> header file. */
/* #undef HAVE_STRINGS_H */

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the `strncasecmp' function. */
#define HAVE_STRNCASECMP 1

/* Define if sys/bitypes.h exists */
#define HAVE_SYS_BITYPES_H 1

/* Define to 1 if you have the <sys/param.h> header file. */
#define HAVE_SYS_PARAM_H 1

/* Define to 1 if you have the <sys/socket.h> header file. */
#define HAVE_SYS_SOCKET_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
/* #undef HAVE_SYS_STAT_H */

/* Define to 1 if you have the <sys/time.h> header file. */
#define HAVE_SYS_TIME_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define if you have the <sys/uio.h> header file. */
#define HAVE_SYS_UIO_H 1

/* Define to 1 if you have the <thread.h> header file. */
/* #undef HAVE_THREAD_H */

/* Define to 1 if you have the `thread_policy_set' function. */
/* #undef HAVE_THREAD_POLICY_SET */

/* Define to 1 if you have the `thr_yield' function. */
/* #undef HAVE_THR_YIELD */

/* define to enable timing collection */
/* #undef HAVE_TIMING */

/* Define to 1 if you have the `tsearch' function. */
/* #undef HAVE_TSEARCH */

/* Define if uint16_t is supported by the C compiler */
#define HAVE_UINT16_T 1

/* Define if uint32_t is supported by the C compiler */
#define HAVE_UINT32_T 1

/* Define if uint64_t is supported by the C compiler */
#define HAVE_UINT64_T 1

/* Define if uint8_t is supported by the C compiler */
#define HAVE_UINT8_T 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define to 1 if you have the `usleep' function. */
#define HAVE_USLEEP 1

/* Define if we have va_copy */
#define HAVE_VA_COPY 1

/* Define to 1 if you have the `vsnprintf' function. */
#define HAVE_VSNPRINTF 1

/* Define to 1 if you have the `vsprintf' function. */
#define HAVE_VSPRINTF 1

/* Define to 1 if you have the `yield' function. */
/* #undef HAVE_YIELD */

/* Define to 1 if the system has the type `_Bool'. */
#define HAVE__BOOL 1

/* define if the compiler defines __FUNCTION__ */
#define HAVE__FUNCTION__ /**/

/* define if the compiler defines __func__ */
#define HAVE__FUNC__ /**/

/* Define if we have __va_copy */
/* #undef HAVE___VA_COPY */

/* Define which x86 cycle counter to use */
/* #undef LINUX86_CYCLE_CPUID_RDTSC32 */

/* Define which x86 cycle counter to use */
/* #undef LINUX86_CYCLE_CPUID_RDTSC64 */

/* Define which x86 cycle counter to use */
/* #undef LINUX86_CYCLE_RDTSC */

/* Define which x86 cycle counter to use */
/* #undef LINUX86_CYCLE_RDTSCP */

/* Name of installation directory intended for MPICH2 */
/* #undef MPICH2_LIBDIR */

/* Define to enable checking of handles still allocated at MPI_Finalize */
/* #undef MPICH_DEBUG_HANDLEALLOC */

/* Define to enable handle checking */
/* #undef MPICH_DEBUG_HANDLES */

/* Define if each function exit should confirm memory arena correctness */
/* #undef MPICH_DEBUG_MEMARENA */

/* Define to enable preinitialization of memory used by structures and unions
   */
/* #undef MPICH_DEBUG_MEMINIT */

/* Define to enable mutex debugging */
/* #undef MPICH_DEBUG_MUTEX */

/* Define to check nesting in mutexes */
/* #undef MPICH_DEBUG_MUTEXNESTING */

/* define to enable error messages */
#define MPICH_ERROR_MSG_LEVEL MPICH_ERROR_MSG_ALL

/* Define as the name of the debugger support library */
/* #undef MPICH_INFODLL_LOC */

/* Level of thread support selected at compile time */
#define MPICH_THREAD_LEVEL MPI_THREAD_MULTIPLE

/* a C type used to compute C++ bool reductions */
#define MPIR_CXX_BOOL_CTYPE _Bool

/* Define as the MPI Datatype handle for MPI::BOOL */
#define MPIR_CXX_BOOL_VALUE 0x4c000133

/* Define as the MPI Datatype handle for MPI::COMPLEX */
#define MPIR_CXX_COMPLEX_VALUE 0x4c000834

/* Define as the MPI Datatype handle for MPI::DOUBLE_COMPLEX */
#define MPIR_CXX_DOUBLE_COMPLEX_VALUE 0x4c001035

/* Define as the MPI Datatype handle for MPI::LONG_DOUBLE_COMPLEX */
#define MPIR_CXX_LONG_DOUBLE_COMPLEX_VALUE 0x4c002036

/* C type to use for MPI_INTEGER16 */
/* #undef MPIR_INTEGER16_CTYPE */

/* C type to use for MPI_INTEGER1 */
#define MPIR_INTEGER1_CTYPE char

/* C type to use for MPI_INTEGER2 */
#define MPIR_INTEGER2_CTYPE short

/* C type to use for MPI_INTEGER4 */
#define MPIR_INTEGER4_CTYPE int

/* C type to use for MPI_INTEGER8 */
#define MPIR_INTEGER8_CTYPE long

/* MPIR_PINT_FMT_DEC_SPEC is the format specifier for printing Pint as a
   decimal */
#define MPIR_PINT_FMT_DEC_SPEC "%ld"

/* MPIR_Pint is a pointer-sized integer */
#define MPIR_Pint long

/* C type to use for MPI_REAL16 */
#define MPIR_REAL16_CTYPE long double

/* C type to use for MPI_REAL4 */
#define MPIR_REAL4_CTYPE float

/* C type to use for MPI_REAL8 */
#define MPIR_REAL8_CTYPE double

/* MPIR_UPINT_FMT_DEC_SPEC is the format specifier for printing Upint as a
   decimal */
#define MPIR_UPINT_FMT_DEC_SPEC "%lu"

/* MPIR_Upint is an unsigned pointer-sized integer */
#define MPIR_Upint unsigned long

/* Method used to allocate MPI object handles */
#define MPIU_HANDLE_ALLOCATION_METHOD MPIU_HANDLE_ALLOCATION_MUTEX

/* Define to enable timing mutexes */
/* #undef MPIU_MUTEX_WAIT_TIME */

/* Set to a type that can express the size of the entire address space */
#define MPIU_SIZE_T unsigned long

/* Method used to implement atomic updates and access */
#define MPIU_THREAD_GRANULARITY MPIU_THREAD_GRANULARITY_GLOBAL

/* set to the name of the thread package */
#define MPIU_THREAD_PACKAGE_NAME MPIU_THREAD_PACKAGE_POSIX

/* Method used to implement refcount updates */
#define MPIU_THREAD_REFCOUNT MPIU_REFCOUNT_NONE

/* define to disable reference counting predefined objects like MPI_COMM_WORLD
   */
/* #undef MPIU_THREAD_SUPPRESS_PREDEFINED_REFCOUNTS */

/* If the compiler supports a TLS storage class define it to that here */
#define MPIU_TLS_SPECIFIER __thread

/* Define if fdopen needs a declaration */
#define NEEDS_FDOPEN_DECL 1

/* Define if mkstemp needs a declaration */
/* #undef NEEDS_MKSTEMP_DECL */

/* define if pointers must be aligned on pointer boundaries */
/* #undef NEEDS_POINTER_ALIGNMENT_ADJUST */

/* Define if putenv needs a declaration */
/* #undef NEEDS_PUTENV_DECL */

/* Define if snprintf needs a declaration */
/* #undef NEEDS_SNPRINTF_DECL */

/* Define if strdup needs a declaration */
/* #undef NEEDS_STRDUP_DECL */

/* Define if strerror_r needs a declaration */
/* #undef NEEDS_STRERROR_R_DECL */

/* Define if sys/time.h is required to get timer definitions */
/* #undef NEEDS_SYS_TIME_H */

/* Define if vsnprintf needs a declaration */
/* #undef NEEDS_VSNPRINTF_DECL */

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

/* Define to an expression that will result in an error checking mutex type.
   */
#define PTHREAD_MUTEX_ERRORCHECK_VALUE PTHREAD_MUTEX_ERRORCHECK

/* The size of `bool', as computed by sizeof. */
#define SIZEOF_BOOL 1

/* The size of `char', as computed by sizeof. */
#define SIZEOF_CHAR 1

/* The size of `Complex', as computed by sizeof. */
#define SIZEOF_COMPLEX 8

/* The size of `double', as computed by sizeof. */
#define SIZEOF_DOUBLE 8

/* The size of `DoubleComplex', as computed by sizeof. */
#define SIZEOF_DOUBLECOMPLEX 16

/* The size of `double_int', as computed by sizeof. */
#define SIZEOF_DOUBLE_INT 16

/* The size of `double _Complex', as computed by sizeof. */
#define SIZEOF_DOUBLE__COMPLEX 16

/* Define size of PAC_TYPE_NAME */
/* #undef SIZEOF_F77_DOUBLE_PRECISION */

/* Define size of PAC_TYPE_NAME */
/* #undef SIZEOF_F77_INTEGER */

/* Define size of PAC_TYPE_NAME */
/* #undef SIZEOF_F77_REAL */

/* The size of `float', as computed by sizeof. */
#define SIZEOF_FLOAT 4

/* The size of `float_int', as computed by sizeof. */
#define SIZEOF_FLOAT_INT 8

/* The size of `float _Complex', as computed by sizeof. */
#define SIZEOF_FLOAT__COMPLEX 8

/* The size of `int', as computed by sizeof. */
#define SIZEOF_INT 4

/* define if sizeof(int) = sizeof(MPI_Aint) */
/* #undef SIZEOF_INT_IS_AINT */

/* The size of `long', as computed by sizeof. */
#define SIZEOF_LONG 8

/* The size of `LongDoubleComplex', as computed by sizeof. */
#define SIZEOF_LONGDOUBLECOMPLEX 32

/* The size of `long double', as computed by sizeof. */
#define SIZEOF_LONG_DOUBLE 16

/* The size of `long_double_int', as computed by sizeof. */
#define SIZEOF_LONG_DOUBLE_INT 32

/* The size of `long double _Complex', as computed by sizeof. */
#define SIZEOF_LONG_DOUBLE__COMPLEX 32

/* The size of `long_int', as computed by sizeof. */
#define SIZEOF_LONG_INT 16

/* The size of `long long', as computed by sizeof. */
#define SIZEOF_LONG_LONG 8

/* The size of `MPIR_Bsend_data_t', as computed by sizeof. */
#define SIZEOF_MPIR_BSEND_DATA_T 88

/* The size of `OPA_ptr_t', as computed by sizeof. */
#define SIZEOF_OPA_PTR_T 8

/* The size of `short', as computed by sizeof. */
#define SIZEOF_SHORT 2

/* The size of `short_int', as computed by sizeof. */
#define SIZEOF_SHORT_INT 8

/* The size of `two_int', as computed by sizeof. */
#define SIZEOF_TWO_INT 8

/* The size of `unsigned char', as computed by sizeof. */
#define SIZEOF_UNSIGNED_CHAR 1

/* The size of `unsigned int', as computed by sizeof. */
#define SIZEOF_UNSIGNED_INT 4

/* The size of `unsigned long', as computed by sizeof. */
#define SIZEOF_UNSIGNED_LONG 8

/* The size of `unsigned long long', as computed by sizeof. */
#define SIZEOF_UNSIGNED_LONG_LONG 8

/* The size of `unsigned short', as computed by sizeof. */
#define SIZEOF_UNSIGNED_SHORT 2

/* The size of `void *', as computed by sizeof. */
#define SIZEOF_VOID_P 8

/* The size of `wchar_t', as computed by sizeof. */
#define SIZEOF_WCHAR_T 4

/* The size of `_Bool', as computed by sizeof. */
#define SIZEOF__BOOL 1

/* If using the C implementation of alloca, define if you know the
   direction of stack growth for your system; otherwise it will be
   automatically deduced at runtime.
	STACK_DIRECTION > 0 => grows toward higher addresses
	STACK_DIRECTION < 0 => grows toward lower addresses
	STACK_DIRECTION = 0 => direction of growth unknown */
/* #undef STACK_DIRECTION */

/* Define calling convention */
/* #undef STDCALL */

/* Define to 1 if you have the ANSI C header files. */
/* #undef STDC_HEADERS */

/* Define to 1 if strerror_r returns char *. */
/* #undef STRERROR_R_CHAR_P */

/* Define if MPI_Aint should be used instead of void * for storing attribute
   values */
/* #undef USE_AINT_FOR_ATTRVAL */

/* Define if alloca should be used if available */
/* #undef USE_ALLOCA */

/* Define if assembly language atomic update macros should be used (if
   available) */
/* #undef USE_ATOMIC_UPDATES */

/* Define if performing coverage tests */
/* #undef USE_COVERAGE */

/* Define to enable logging macros */
/* #undef USE_DBG_LOGGING */

/* Define if dynamic libraries are available and should be used */
/* #undef USE_DYNAMIC_LIBRARIES */

/* Define if file should be used for name publisher */
#define USE_FILE_FOR_NAMEPUB 1

/* Define to use ='s and spaces in the string utilities. */
/* #undef USE_HUMAN_READABLE_TOKENS */

/* define to choose logging library */
#define USE_LOGGING MPID_LOGGING_NONE

/* Define to enable memory tracing */
/* #undef USE_MEMORY_TRACING */

/* Define this to enable internal instrumentation */
/* #undef USE_MPIU_INSTR */

/* Define if the NMPI names should use MPI instead of PMPI */
/* #undef USE_MPI_FOR_NMPI */

/* Define if PMI2 API must be used */
/* #undef USE_PMI2_API */

/* define to enable SMP/multi-core aware collectives */
#define USE_SMP_COLLECTIVES 1

/* Define if tsearch requires char pointers */
/* #undef USE_TSEARCH_WITH_CHARP */

/* Define if weak symbols should be used */
#define USE_WEAK_SYMBOLS 1

/* Define WORDS_BIGENDIAN to 1 if your processor stores words with the most
   significant byte first (like Motorola and SPARC, unlike Intel). */
#if defined AC_APPLE_UNIVERSAL_BUILD
# if defined __BIG_ENDIAN__
#  define WORDS_BIGENDIAN 1
# endif
#else
# ifndef WORDS_BIGENDIAN
/* #  undef WORDS_BIGENDIAN */
# endif
#endif

/* Define if words are little endian */
#define WORDS_LITTLEENDIAN 1

/* Define if configure will not tell us, for universal binaries */
/* #undef WORDS_UNIVERSAL_ENDIAN */

/* Define for Solaris 2.5.1 so the uint32_t typedef from <sys/synch.h>,
   <pthread.h>, or <semaphore.h> is not used. If the typedef were allowed, the
   #define below would cause a syntax error. */
/* #undef _UINT32_T */

/* Define for Solaris 2.5.1 so the uint64_t typedef from <sys/synch.h>,
   <pthread.h>, or <semaphore.h> is not used. If the typedef were allowed, the
   #define below would cause a syntax error. */
/* #undef _UINT64_T */

/* Define for Solaris 2.5.1 so the uint8_t typedef from <sys/synch.h>,
   <pthread.h>, or <semaphore.h> is not used. If the typedef were allowed, the
   #define below would cause a syntax error. */
/* #undef _UINT8_T */

/* define if bool is a built-in type */
/* #undef bool */

/* Define to empty if `const' does not conform to ANSI C. */
/* #undef const */

/* Define to `__inline__' or `__inline' if that's what the C compiler
   calls it, or to nothing if 'inline' is not supported under any name.  */
#ifndef __cplusplus
/* #undef inline */
#endif

/* Define to the type of a signed integer type of width exactly 16 bits if
   such a type exists and the standard includes do not define it. */
/* #undef int16_t */

/* Define to the type of a signed integer type of width exactly 32 bits if
   such a type exists and the standard includes do not define it. */
/* #undef int32_t */

/* Define to the type of a signed integer type of width exactly 64 bits if
   such a type exists and the standard includes do not define it. */
/* #undef int64_t */

/* Define to the type of a signed integer type of width exactly 8 bits if such
   a type exists and the standard includes do not define it. */
/* #undef int8_t */

/* Define to the equivalent of the C99 'restrict' keyword, or to
   nothing if this is not supported.  Do not define if restrict is
   supported directly.  */
#define restrict __restrict
/* Work around a bug in Sun C++: it does not support _Restrict, even
   though the corresponding Sun C compiler does, which causes
   "#define restrict _Restrict" in the previous line.  Perhaps some future
   version of Sun C++ will work with _Restrict; if so, it'll probably
   define __RESTRICT, just as Sun C does.  */
#if defined __SUNPRO_CC && !defined __RESTRICT
# define _Restrict
#endif

/* Define to `unsigned int' if <sys/types.h> does not define. */
/* #undef size_t */

/* Define to the type of an unsigned integer type of width exactly 16 bits if
   such a type exists and the standard includes do not define it. */
/* #undef uint16_t */

/* Define to the type of an unsigned integer type of width exactly 32 bits if
   such a type exists and the standard includes do not define it. */
/* #undef uint32_t */

/* Define to the type of an unsigned integer type of width exactly 64 bits if
   such a type exists and the standard includes do not define it. */
/* #undef uint64_t */

/* Define to the type of an unsigned integer type of width exactly 8 bits if
   such a type exists and the standard includes do not define it. */
/* #undef uint8_t */

/* Define to empty if the keyword `volatile' does not work. Warning: valid
   code using `volatile' can become incorrect without. Disable with care. */
/* #undef volatile */

#endif

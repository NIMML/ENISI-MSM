/* -*- Mode: C; c-basic-offset:4 ; -*- */
/*  
 *  (C) 2007 by Argonne National Laboratory.
 *      See COPYRIGHT in top-level directory.
 */

/* This file creates strings for the most important configuration options.
   These are then used in the file src/mpi/init/initthread.c to initialize
   global variables that will then be included in both the library and 
   executables, providing a way to determine what version and features of
   MPICH2 were used with a particular library or executable. 
*/
#ifndef MPICH2INFO_H_INCLUDED
#define MPICH2INFO_H_INCLUDED

#define MPICH2_CONFIGURE_ARGS_CLEAN "--prefix=/home/ariana/workspace/enisi/hpylori_compartments/deps/src/project_repast/ext//MPICH --disable-f77 --disable-fc"
#define MPICH2_VERSION_DATE "Thu Sep  1 13:53:02 CDT 2011"
#define MPICH2_DEVICE "ch3:nemesis"
#define MPICH2_COMPILER_CC "gcc    -O2"
#define MPICH2_COMPILER_CXX "c++   -O2"
#define MPICH2_COMPILER_F77 "  "
#define MPICH2_COMPILER_FC "  "

#endif

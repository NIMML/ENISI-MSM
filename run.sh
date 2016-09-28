#!/bin/bash

DIR="$(dirname $0)"
CONFIG=$1

# Uncomment if you want to run Valgrind
#VALGRIND="/usr/bin/valgrind --track-origins=yes --log-file=memcheck.out.$$ --suppressions=/home/aherbst/.memcheck.suppression"

# Clear output and log files
(cd "$CONFIG"; rm *.tsv *.log)

cd "$DIR"

"$DIR"/deps/src/project_repast/ext/MPICH/bin/mpirun -n 4 -host localhost \
   ${VALGRIND} "${DIR}"/bin/main config=${CONFIG}


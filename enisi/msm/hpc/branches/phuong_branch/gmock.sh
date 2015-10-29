#!/bin/sh

ARGS="$@"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"
"$DIR"/deps/src/project_repast/ext/MPICH/bin/mpirun -n 2 \
  -host localhost "$DIR"/bin/testmain "$DIR"/config.props "$DIR"/model.props $ARGS

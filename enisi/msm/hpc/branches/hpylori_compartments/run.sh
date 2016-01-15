#!/bin/sh

ARGS="$@"
DIR="$PWD/"$(dirname $0)
cd "$DIR"
"$DIR"/deps/src/project_repast/ext/MPICH/bin/mpirun -n 2 \
  -host localhost "$DIR"/bin/main "$DIR"/config.props "$DIR"/model.props $ARGS

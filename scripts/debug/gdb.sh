SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJ_DIR="$SCRIPT_DIR/../../";

cd $PROJ_DIR;

./deps/src/project_repast/ext/MPICH/bin/mpirun -n 256 -host localhost \
  gdb --command="$SCRIPT_DIR"/backtrace.gdb --args \
  ./bin/main ./config.props ./model.props

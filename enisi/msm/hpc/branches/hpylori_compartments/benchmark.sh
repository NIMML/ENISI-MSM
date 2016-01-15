#!/bin/sh

PROJ_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$PROJ_DIR"

TEN_TO_10="10000000000"

AGENTS="$TEN_TO_10"
AREAS="100"
NODES="100"
TICKS="3"

for tick in $TICKS;
do
  for agent in $AGENTS;
  do
    for area in $AREAS;
    do
      for node in $NODES;
      do
	msg="$agent agents $area^2 area $tick ticks $node processes"

	let bact=$agent*1/5
	let tcell=$agent*2/5
	let dendr=$agent*2/5

	echo "$msg"

	"$PROJ_DIR"/deps/src/project_repast/ext/MPICH/bin/mpirun -n $node \
	  "$PROJ_DIR"/bin/benchmark \
	  "$PROJ_DIR"/config.props "$PROJ_DIR"/model.props \
	  stop.at="$tick" \
	  bacteria.count="$bact" tcell.count="$tcell" dendritic.count="$dendr" \
	  grid.width="$area" grid.height="$area" benchmark.msg="$msg"
      done
    done
  done
done

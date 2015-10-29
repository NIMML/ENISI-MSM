#!/bin/bash

# Example qsub script for the shadowfax cluster miep_q
# using the higher priority miep group

# NOTE:  You will need to edit the Walltime resource limit line
# and the Node and Processor Per Node (ppn) resource limits line
# to suit the requirements of your job.
 
# Set the walltime, which is the maximum time your job can run in HH:MM:SS
#PBS -lwalltime=08:00:00

# Set the number of nodes, and the number of processors per node (up to 12)
#PBS -lnodes=9:ppn=12

# Access group and queue
#PBS -W group_list=miep
#PBS -q miep_q

# If benchmark was run directly, re-run it as an argument to qsub for
# submission to shadowfax's job system
if [[ -t 1 ]]; then
  pid=$(qsub $0 | cut -d. -f 1)
  touch "$0.$pid"
  echo -e "\n Job number: $pid\n\n" \
          "Check status with:\n\tqstat -f $pid\n" \
          "Delete with\n\tqdel $pid\n"
  exit;
fi

# If modules are needed, source modules environment:
. /etc/profile.d/modules.sh

# Add any modules you might require:
module add mvapich2/gcc

cd $PBS_O_WORKDIR

# Below here enter the commands to start your job
PROJ_DIR="$( cd "$( dirname "${BASH_SOURCE[1]}" )"/../../ && pwd )"

mpirun -n 80 \
  "$PROJ_DIR"/bin/benchmark "$PROJ_DIR"/config.props "$PROJ_DIR"/model.props \
  stop.at=5 bacteria.count=200000000 tcell.count=400000000 dendritic.count=400000000 \
  grid.width=100 grid.height=100 \
  benchmark.msg="10^9 agents (1000)^2 area and 5 ticks (40 processes)"

#mpirun -n 10 \
  #"$PROJ_DIR"/bin/benchmark "$PROJ_DIR"/config.props "$PROJ_DIR"/model.props \
  #stop.at=5 bacteria.count=1000 tcell.count=2000 dendritic.count=2000 \
  #grid.width=1000 grid.height=1000 \
  #benchmark.msg="5000 agents (1000)^2 area and 5 ticks (10 processes)"

exit;

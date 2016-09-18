#!/bin/bash

# Example qsub script for the shadowfax cluster miep_q
# using the higher priority miep group

# NOTE:  You will need to edit the Walltime resource limit line
# and the Node and Processor Per Node (ppn) resource limits line
# to suit the requirements of your job.
 
# Set the walltime, which is the maximum time your job can run in HH:MM:SS
#PBS -lwalltime=168:00:00

# Set the number of nodes, and the number of processors per node (up to 12)
#PBS -lnodes=20:ppn=12

# Access group and queue
#PBS -W group_list=miep
#PBS -q miep_q

##Add the following two parameters if you want e-mail regarding your qsub job:

## The option below defines the set of conditions under which the queue
## will send a mail message about the job:
###     a -  mail is sent when the job is aborted by the batch system.
###     b -  mail is sent when the job begins execution.
###     e -  mail is sent when the job terminates.

#PBS -m abe

## The option below declares the list of users to whom mail is sent
### Substitute your e-mail address for <your-email> below:

#PBS -M nml5566@vbi.vt.edu

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

cd "$PROJ_DIR"

TEN_TO_11="100000000000"
TEN_TO_10="10000000000"
TEN_TO_09="1000000000"
TEN_TO_08="100000000"
FIVE_THOUSAND="5000"

AGENTS="$TEN_TO_10"
AREAS="100"
NODES="200"
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

	mpirun -n $node "$PROJ_DIR"/bin/benchmark \
	  "$PROJ_DIR"/config.props "$PROJ_DIR"/model.props \
	  stop.at="$tick" \
	  bacteria.count="$bact" tcell.count="$tcell" dendritic.count="$dendr" \
	  grid.width="$area" grid.height="$area" benchmark.msg="$msg"

      done
    done
  done
done

echo -e "Subject:Shadowfax job finished\n" | sendmail -f nathan@liles.com nml5566@gmail.com

exit;

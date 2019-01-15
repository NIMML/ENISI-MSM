#!/bin/bash

# Example qsub script for the shadowfax cluster miep_q
# using the higher priority miep group

# NOTE:  You will need to edit the Walltime resource limit line
# and the Node and Processor Per Node (ppn) resource limits line
# to suit the requirements of your job.
 
# Set the walltime, which is the maximum time your job can run in HH:MM:SS
#PBS -lwalltime=80:00:00

# Set the number of nodes, and the number of processors per node (up to 12)
#PBS -lnodes=1:ivybridge

# Access group and queue
#PBS -W group_list=sfx
#PBS -q shared_q

##Add the following two parameters if you want e-mail regarding your qsub job:

## The option below defines the set of conditions under which the queue
## will send a mail message about the job:
###     a -  mail is sent when the job is aborted by the batch system.
###     b -  mail is sent when the job begins execution.
###     e -  mail is sent when the job terminates.

#PBS -m abe

## The option below declares the list of users to whom mail is sent
### Substitute your e-mail address for <your-email> below:

#PBS -M <your-email>

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
module load mvapich2/gcc/64/2.0b

# THe following 2 variables need be adjusted
NODES=4
# CONFIG is the path of the folder where all the files required to run the model are placed. 
CONFIG=/home/meghna89/ENISI_experiments/allRuns/setting0/run0

# Below here enter the commands to start your job

mpirun -n ${NODES} "/home/meghna89/enisi_github/ENISI/ENISI-MSM/bin/ENISI-MSM" \
       "config=${CONFIG}"

exit;

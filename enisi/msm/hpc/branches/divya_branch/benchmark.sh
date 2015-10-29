#!/bin/sh

DIR="$PWD/"$(dirname $0)
cd "$DIR"

"$DIR"/deps/src/project_repast/ext/MPICH/bin/mpirun -n 2 \
  -host localhost "$DIR"/bin/benchmark "$DIR"/config.props "$DIR"/model.props \
  stop.at=20 bacteria.count=1000 tcell.count=2000 dendritic.count=2000 \
  grid.width=100 grid.height=100 \
  benchmark.msg="5,000 agents 100^2 area and 20 ticks"

#~/code/enisi-msm-repast-hpc/dependencies/RHPC_2.0/ext/MPICH/bin/mpirun -n 2 \
  #-host localhost ./bin/benchmark ./config.props ./model.props \
  #stop.at=20 bacteria.count=1000 tcell.count=2000 dendritic.count=2000 \
  #grid.width=1000 grid.height=1000 \
  #benchmark.msg="5,000 agents 1,000^2 area and 20 ticks"

#~/code/enisi-msm-repast-hpc/dependencies/RHPC_2.0/ext/MPICH/bin/mpirun -n 2 \
  #-host localhost ./bin/benchmark ./config.props ./model.props \
  #stop.at=20 bacteria.count=5000 tcell.count=10000 dendritic.count=10000 \
  #grid.width=100 grid.height=100 \
  #benchmark.msg="25,000 agents 100^2 area and 20 ticks"

#~/code/enisi-msm-repast-hpc/dependencies/RHPC_2.0/ext/MPICH/bin/mpirun -n 2 \
  #-host localhost ./bin/benchmark ./config.props ./model.props \
  #stop.at=20 bacteria.count=5000 tcell.count=10000 dendritic.count=10000 \
  #grid.width=1000 grid.height=1000 \
  #benchmark.msg="25,000 agents 1,000^2 area and 20 ticks"

#~/code/enisi-msm-repast-hpc/dependencies/RHPC_2.0/ext/MPICH/bin/mpirun -n 2 \
  #-host localhost ./bin/benchmark ./config.props ./model.props \
  #stop.at=20 bacteria.count=10000 tcell.count=20000 dendritic.count=20000 \
  #grid.width=100 grid.height=100 \
  #benchmark.msg="50,000 agents 100^2 area and 20 ticks"

#~/code/enisi-msm-repast-hpc/dependencies/RHPC_2.0/ext/MPICH/bin/mpirun -n 2 \
  #-host localhost ./bin/benchmark ./config.props ./model.props \
  #stop.at=20 bacteria.count=10000 tcell.count=20000 dendritic.count=20000 \
  #grid.width=1000 grid.height=1000 \
  #benchmark.msg="50,000 agents 1,000^2 area and 20 ticks"

#~/code/enisi-msm-repast-hpc/dependencies/RHPC_2.0/ext/MPICH/bin/mpirun -n 2 \
  #-host localhost ./bin/benchmark ./config.props ./model.props \
  #stop.at=20 bacteria.count=50000 tcell.count=100000 dendritic.count=100000 \
  #grid.width=100 grid.height=100 \
  #benchmark.msg="250,000 agents 100^2 area and 20 ticks"

#~/code/enisi-msm-repast-hpc/dependencies/RHPC_2.0/ext/MPICH/bin/mpirun -n 2 \
  #-host localhost ./bin/benchmark ./config.props ./model.props \
  #stop.at=20 bacteria.count=50000 tcell.count=100000 dendritic.count=100000 \
  #grid.width=1000 grid.height=1000 \
  #benchmark.msg="250,000 agents 1,000^2 area and 20 ticks"

#~/code/enisi-msm-repast-hpc/dependencies/RHPC_2.0/ext/MPICH/bin/mpirun -n 2 \
  #-host localhost ./bin/benchmark ./config.props ./model.props \
  #stop.at=20 bacteria.count=100000 tcell.count=200000 dendritic.count=200000 \
  #grid.width=100 grid.height=100 \
  #benchmark.msg="500,000 agents 100^2 area and 20 ticks"

#~/code/enisi-msm-repast-hpc/dependencies/RHPC_2.0/ext/MPICH/bin/mpirun -n 2 \
  #-host localhost ./bin/benchmark ./config.props ./model.props \
  #stop.at=20 bacteria.count=100000 tcell.count=200000 dendritic.count=200000 \
  #grid.width=1000 grid.height=1000 \
  #benchmark.msg="500,000 agents 1,000^2 area and 20 ticks"

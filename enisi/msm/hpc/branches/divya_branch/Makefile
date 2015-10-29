CC=$(HOME)/RHPC_2.0/ext/MPICH/bin/mpicxx
#CC_FLAGS=-std=c++0x -Woverloaded-virtual
CC_FLAGS=-std=c++0x 

BIN=./bin
SRC=./src
OBJ=./object

subdirs := $(wildcard src/)
sources := $(wildcard $(addsuffix *.cpp,$(subdirs)))
OBJECTS := $(patsubst %.cpp,$(OBJ)/%.o,$(sources))

PLATFORM=linux-x86_64_gcc-4.6

SZIP_DIR=/usr/local/szip/2.1/$(PLATFORM)
SZIP_CPPFLAGS=-I$(SZIP_DIR)/include
SZIP_LDFLAGS=-L$(SZIP_DIR)/lib
SZIP_LIBS=-lsz

HDF5_DIR=/usr/local/hdf5/1.8.7/$(PLATFORM)
HDF5_CPPFLAGS=-I$(HDF5_DIR)/include $(SZIP_CPPFLAGS)
HDF5_LDFLAGS=-L$(HDF5_DIR)/lib $(SZIP_LDFLAGS)
HDF5_LIBS=-lhdf5 $(SZIP_LIBS) -lz

SILO_DIR=/usr/local/silo/4.10.2/$(PLATFORM)
SILO_CPPFLAGS=-I$(SILO_DIR)/include $(HDF5_CPPFLAGS)
SILO_LDFLAGS=-L$(SILO_DIR)/lib $(HDF5_LDFLAGS)
SILO_LIBS=-lsiloh5 $(HDF5_LIBS) -lm

BOOST_INCLUDE=-I$(HOME)/RHPC_2.0/ext/Boost/Boost_1.54/include
REPAST_HPC_INCLUDE=-I$(HOME)/RHPC_2.0/include/repast_hpc/ $(SILO_CPPFLAGS)
COPASI_INCLUDE=-I$(HOME)/COPASI-master/ -I$(HOME)/COPASI-master/copasi 
CPPFLAGS=$(BOOST_INCLUDE) $(REPAST_HPC_INCLUDE) $(COPASI_INCLUDE)

BOOST_LIB_DIR=-L$(HOME)/RHPC_2.0/ext/Boost/Boost_1.54/lib
REPAST_HPC_LIB_DIR=-L$(HOME)/RHPC_2.0/lib 
COPASI_DEP_LIB_DIR=-L$(HOME)/copasi-dependencies/bin/lib
COPASI_LIB_DIR=-L$(HOME)/build_copasi/copasi $(COPASI_DEP_LIB_DIR)
LDFLAGS=$(BOOST_LIB_DIR) $(REPAST_HPC_LIB_DIR) $(COPASI_LIB_DIR) $(SILO_LDFLAGS)

BOOST_LIBS=-lboost_mpi-mt-s -lboost_serialization-mt-s -lboost_system-mt-s -lboost_filesystem-mt-s
REPAST_HPC_LIB=-lrepast_hpc-2.0 $(SILO_LIBS) -Wl,-rpath=$(SILO_DIR)/lib
COPASI_LIB=-lCOPASISE 
COPASI_DEP_LIB=-lraptor -lsbml-static -llapack -lblas -lf2c -lsedml-static -lexpat
LIBS=$(COPASI_LIB) $(COPASI_DEP_LIB) $(REPAST_HPC_LIB) $(BOOST_LIBS)

main: $(OBJECTS)
	$(CC) $(LDFLAGS) \
	  -o $(BIN)/$@ $(filter-out %test.o %benchmark.o,$(OBJECTS)) $(LIBS)

$(OBJECTS): $(OBJ)/%o: %cpp
	-mkdir -p $(shell dirname $@)
	$(CC) $(CC_FLAGS) $(CPPFLAGS) -c $< -o $@

test: $(OBJECTS)
	$(CC) $(LDFLAGS) \
	  -o $(BIN)/$@ $(filter-out %main.o %benchmark.o,$(OBJECTS)) $(LIBS)
	mpirun -n 2 $(BIN)/$@

benchmark: $(OBJECTS)
	$(CC) $(CC_FLAGS) $(LDFLAGS) \
	  -o $(BIN)/$@ $(filter-out %main.o %test.o,$(OBJECTS)) $(LIBS)


clean:
	rm -rf $(BIN)/*
	rm -rf $(OBJ)/*

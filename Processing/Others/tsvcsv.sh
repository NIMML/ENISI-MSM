#!/bin/bash

##====================================================================================================


####################################################
## configure parameters

current_dir=$1        # input a directory which include all the allRuns folders (~/alloutputs)
echo $current_dir is the current dir variable
lib="/home/meghna89/Bin" # my library of tools

## change directory 

`cd $current_dir`

####################################################
## input parameters

Usage()  
{  
  echo -e "Usage: `basename $0` [-h/--help] <-o/--output-dir string>\n";  
  exit 1;  
}  
 
name=""
ref=""
outdir=""
  
# flexible order (Note: the space after ":")
# ARG=`getopt h:n:r:o: $*`  
  
# reset parameters  
#set --$ARG;  
  
# parse options of shell's input 
while getopts :h:o: PARAM_VAL; do  
  case "${PARAM_VAL}" in  
  o|output-dir)  
    outdir=$OPTARG;
    ;;  
  h|help)  
    Usage
    ;;  
  *)  
    Usage
    ;;  
  esac  
done  

####################################################

## .tsv file to .csv file conversion pipeline 

folder_set=$(ls $current_dir)
set_folders=$(ls $current_dir/$folder_set)

echo $folder_set is the ls in current dir
echo $set_folders is the ls in the folder witin current dir

#for dir in $folder_set
#do
# if [[ -d $dir ]]; then 
# echo -e `date`": Reading within this $dir"
#  for runs in "$dir"/*
# do
#  echo -e `date`": Reading within this $runs"
#    for folders in "$runs"/*
#    do
#    echo -e `date`": Reading within this $folders"
#     for files in "$folders"/*
#     do
#      echo -e `date`": Converting the .tsv file $files to .csv"
#      python $lib/lp_code.py $files $files.csv
#     done
#    done
#  done
# fi
#done


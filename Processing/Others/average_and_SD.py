#===============================================================================================================
#   AUTHOR:   MEGHNA VERMA
#
#   PURPOSE:  This script is used to calculate the average and standard deviation for all the cell counts witin the run
#             folder.  Each run folder has multiple compartment files beginning with the names listed under file_types. 
#	      output:  One file per cell type per file type in corresponding file type folder.
#		       - First column of file denoted the Ticks. 
#    		       - Second column of file denotes average value of cell count at each tick, 
#    		       - Third column denotes standard deviation.
#    	     
#   USAGE:    python average_and_SD.py 
#	     
#   CREATED:  November 11, 2016
#   
#   LOCATION: ~/alloutputs/allRuns/setting0/average_and_SD.py
#
#===============================================================================================================

import re
import csv
import os, sys
from itertools import repeat
fileCount = 4  # number of compartments in each run folder
file_types = ["epithilium", "gastric_lymph_node", "lamina_propria", "lumen"]
colCount = 17
col_types = ["EpithelialCell_State0", "EpithelialCell_State1", "Dentritics_State0", 
                 "Dendritics_State1", "Dendritics_State2", "TCell_State0",
                 "TCell_State1", "TCell_State2", "TCell_State3", "TCell_State4",
                 "Macrophage_State0", "Macrophage_State1", "Macrophage_State2", "Macrophage_State3",
                 "HP_State0", "Bacteria_State2", "Bacteria_State1"]
    
setCount = 0 # number of total run folders. Incremented as folders are read


class File:
    
    #self variables:
        #filename
        #path
        #file_type
        #entries[][]
    def __init__(self, filename, file_type, path):
        self.filename = filename
        self.file_type = file_type
        self.path = path
        self.entries = []
    
    def readFile(self):
        f = open(self.path)
        rows = csv.reader(f)
        for row in rows:
            row.pop(0)  #not reading the "tick" column
            self.entries.append(row)
            
    #adds each element in the other file to this file's entries
    def addFile(self, other):
        if len(self.entries) == 0:  #if this file doesn't have entries to begin with,
            for row in other.entries:  #make copy "other" files entries to these entries
                self.entries.append(row)
        else:
            for rowIndex, row in enumerate(other.entries):
                if (rowIndex < len(self.entries)):
                    self.entries[rowIndex] = [int(x) + int(y) for x, y in zip(self.entries[rowIndex], row)]
            diff = len(self.entries) - len(other.entries)
            if diff > 0:
                for i in range(diff):
                    self.entries.pop()

class Set:
    
    #self variables:
        #files[]  an array with all the files in the run
        #paths[]  an array with all the pathnames for each file
    
    def __init__(self, setName):
        self.setName = setName
        self.paths = []
        self.files = []
        self.outputFiles = []
        self.readSet()
        for i in range(fileCount):
            self.outputFiles.append(File(file_types[i], i, file_types[i] + ".csv"))
        self.combineFiles()
        
    def combineFiles(self):
        for file in self.files:
            k = file.file_type
            self.outputFiles[k].addFile(file)
            

    def __str__(self):
        string = self.setName + "\n"
        for sum in self.sums:
            string = string + sum.__str__() + "\n"
        return string
        
        
    def readSet(self):
        names = os.listdir(self.setName)  #names[] has all the filenames
        index = 0
        for name in names:
            if name.endswith(".csv"):
                self.paths.append(self.setName + "/" + name)
                for filetypeindex, filetype in enumerate(file_types):
                    if name.startswith(filetype):
                        celltype = filetypeindex   #determines which type of cell we're currently processing
                k = File(name, celltype, self.paths[index])
                k.readFile()
                self.files.append(k)
                index += 1
                
                    
def getAverages(sets):
    #averages[] will be an array of files.
    averages = []
    for i in range(fileCount):
        averages.append(File(file_types[i], i, file_types[i] + ".csv"))
            
    for setIndex, set in enumerate(sets):
        for index, file in enumerate(sets[setIndex].outputFiles):
            averages[index].addFile(file)
            
    for file in averages:
        for row in file.entries:
            row[:] = [k / (setCount * 1.0) for k in row ]
    return averages

def getSDs(sets, averages): 
    if (setCount > 1):
        divBy = setCount - 1;
    else:
	    divBy = 1;
    sds = []
    for i in range(fileCount):
        sds.append(File(file_types[i], i, file_types[i] + ".csv"))

    for setIndex in range(setCount):
        if setIndex == 0:
            for filetype, file in enumerate(sets[setIndex].outputFiles):
                entries = []
                for rowIndex, row in enumerate(averages[filetype].entries):
                    newrow = []
                    for colIndex, ave in enumerate(row):
                        newrow.append((file.entries[rowIndex][colIndex] - ave) **2)
                    entries.append(newrow)
                sds[filetype].entries = entries
        else:
            for filetype, file in enumerate(sets[setIndex].outputFiles):
                for rowIndex, row in enumerate(averages[filetype].entries):
                    for colIndex, ave in enumerate(row):
                        #print rowIndex, colIndex
                        if rowIndex < len(file.entries):
                            sds[filetype].entries[rowIndex][colIndex] += ((file.entries[rowIndex][colIndex] - ave) ** 2 )             
    for file in sds:
        for row in file.entries:
            row[:] = [k / divBy for k in row]
            row[:] = [k ** (0.5) for k in row]
    return sds

def output(averages, sds):
    #output file folders
    outputFolders = []
    for i in range(fileCount):
        outputFolders.append("./" + file_types[i])
        if not os.path.exists(outputFolders[i]):
            os.makedirs(outputFolders[i])
    for fileIndex, file in enumerate(averages):
        for col in range(colCount):
            with open(file_types[fileIndex] + "/" + file_types[fileIndex] + "_" + col_types[col] + ".csv", 'wb') as csvfile:
                out = csv.writer(csvfile, delimiter=',', quoting=csv.QUOTE_NONE, quotechar=' ', escapechar=' ')
                tick = 0;
                for row in range(len(averages[fileIndex].entries)):
                    out.writerow([tick] + [ averages[fileIndex].entries[row][col] ] + [sds[fileIndex].entries[row][col]])
                    tick = tick + 1

def createSets():
    global setCount
    sets = []
    dirList = os.listdir("./")
    for d in dirList:     # creates a Set instance for every run folder in same directory as this script. 
        if os.path.isdir(d) and d not in file_types:
            sets.append(Set(d))
            setCount += 1
    return sets

sets = createSets()
averages = getAverages(sets)
sds = getSDs(sets, averages)
output(averages, sds)

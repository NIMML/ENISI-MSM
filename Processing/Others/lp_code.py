import sys
import re
import csv
from itertools import repeat
newlist = []
my_array = []; # Declare an empty list names my_array
numlist = []
den_num = [];
inFile = sys.argv[1]
outFile =sys.argv[2]
with open(inFile, 'rU') as tsv: # Opens a file
    tsv_file = csv.reader(tsv, delimiter='\t') # read the file with using tab as a seaprator. All the new line also have tab at the end
    data = list(tsv_file) # include everything in a list so that you can iterate over it
    for i, item in enumerate(data): # Here you take the indexes of all the occurences of TICK so that we can iterate to the line that has the information of cells and state
        if 'TICK:' in str(data[i]):
            numlist.append(i)
for j in range(0, len(numlist) - 1, 1):
    newlist.append(data[numlist[j]:numlist[j+1]]) #here we create a numlist to include all the sections of one TICK together
    number = 0
    number_list = [];
    number_damagedepi = 0
    number_damagedepi_list = [];
    number_th1 = 0;
    number_th1_list = [];
    number_naive = 0;
    number_naive_list = [];
    number_th17 = 0;
    number_th17_list = [];
    number_treg = 0;
    number_treg_list = [];
    number_tr = 0;
    number_tr_list = [];
    number_mono = 0;
    number_mono_list = [];
    number_minf = 0;
    number_minf_list = [];
    number_mreg = 0
    number_mreg_list = [];
    number_mresi = 0;
    number_mresi_list = [];
    number_hpylori = 0
    number_hpylori_list = [];
    number_infbact = 0;
    number_infbact_list = [];
    number_tolbact = 0;
    number_tolbact_list = []
    number_immaden = 0
    number_immaden_list = [];
    number_effdend = 0;
    number_effdend_list = [];
    number_toldend = 0;
    number_toldend_list = [];
    j_list = [];
    f = open(outFile, 'a') #Open a csv file that is being written with the count of variable
    writer = csv.writer(f)
        #writer.writerow(["tick", "immature dend", "effe den tol", "tol den", "naive t" "th1 cells", "th17 cells", "treg cells",
             #"tr cells", "monoytes", "inf macro", "number_mresi","number_mreg","number_hpylori"])
    for i in range(2,len(newlist[j]),1): #This is the row of data i.e row after X and Y..
        for k in range(4, len(newlist[j][i]), 5):
            if 'EpithelialCell' in str(newlist[j][i][k - 1]):
                if '0' in str(newlist[j][i][k]):
                    number +=1
                elif '1' in str(newlist[j][i][k]):
                    number_damagedepi += 1
            if 'Dentritics' in str(newlist[j][i][k - 1]):
                if '0' in str(newlist[j][i][k]):
                    number_immaden +=1
                elif '1' in str(newlist[j][i][k]):
                    number_effdend +=1
                elif '2' in str(newlist[j][i][k]):
                    number_toldend +=1
            if 'Tcell' in str(newlist[j][i][k - 1]):
                if '0' in str(newlist[j][i][k]):
                    number_naive += 1
                elif '1' in str(newlist[j][i][k]):
                    number_th1 += 1
                elif '2' in str(newlist[j][i][k]):
                    number_th17 += 1
                elif '3' in str(newlist[j][i][k]):
                    number_treg += 1
                elif '4' in str(newlist[j][i][k]):
                    number_tr += 1
            if 'Macrophage' in str(newlist[j][i][k - 1]):
                if '0' in str(newlist[j][i][k]):
                    number_mono += 1
                elif '1' in str(newlist[j][i][k]):
                    number_mresi += 1
                elif '2' in str(newlist[j][i][k]):
                    number_mreg += 1
                elif '3' in str(newlist[j][i][k]):
                    number_minf +=1
            if 'HPylori' in str(newlist[j][i][k - 1]):
                if '0' in str(newlist[j][i][k]):
                    number_hpylori += 1
            if 'Bacteria' in str(newlist[j][i][k - 1]):
                if '1' in str(newlist[j][i][k]):
                    number_infbact += 1
                if '2' in str(newlist[j][i][k]):
                    number_tolbact += 1
    number_list.append(number)
    number_damagedepi_list.append(number_damagedepi)
    number_immaden_list.append(number_immaden)
    number_effdend_list.append(number_effdend)
    number_toldend_list.append(number_toldend)
    number_naive_list.append(number_naive)
    number_th1_list.append(number_th1)
    number_th17_list.append(number_th17)
    number_treg_list.append(number_treg)
    number_tr_list.append(number_tr)
    number_mono_list.append(number_mono)
    number_minf_list.append(number_minf)
    number_mresi_list.append(number_mresi)
    number_mreg_list.append(number_mreg)
    number_hpylori_list.append(number_hpylori)
    number_infbact_list.append(number_infbact)
    number_tolbact_list.append(number_tolbact)
        #print("End of TICK", j)
    j_list.append(j)
        #print("epi health", number)
        #print("epi damage", number_damagedepi)
    rows = zip(j_list, number_list, number_damagedepi_list, number_immaden_list, number_effdend_list, number_toldend_list,number_naive_list, number_th1_list, number_th17_list, number_treg_list, number_tr_list, number_mono_list,number_mresi_list,number_mreg_list, number_minf_list, number_hpylori_list, number_tolbact_list, number_infbact_list)
    for row in rows:
        writer = csv.writer(f)
        writer.writerow(row)
        # print("den eff", number_effdend)
        # print("den tol", number_toldend)
        # print("den immature", number_den)
        # print("th1 cells", number_th1)
        # print("th17 cells", number_th17)
        # print("treg cells", number_treg)
        # print("tr cells", number_tr)
        # print("monoytes", number_mono)
        # print("number_mreg", number_mreg)
        # print("number_hpylori", number_hpylori)


%Author: Meghna Verma
%Date: June 19, 2017
% This file is used to create cell arrays using ENISI output files

%The code mainly uses the csv files from the csvs output folders in each
%setting folder inside ENISI outputs and assisgns that as 1 element in the
%cell array.

%Cellarray_template = cell(180,10,152); % cell array will have 10 columns 
%representing the 10 replicates and 152 cells show the different sets

%sample1 = csv2cell('output.csv', 'fromfile'); 
% The function converts csv file to cell array 
files = dir('*.csv');
output_LP_HP = {};

for i=1:1:length(files)
    design = csvread(files(i).name);
    output_LP_HP(end+1) = {design};
end

for i = 1:267
     Avg = output_LP_HP{i}; 
     stage1_new {i} = Avg(:,2);
end

final = cell2mat(stage1_new);
save('LP-HP-copy.mat','final')




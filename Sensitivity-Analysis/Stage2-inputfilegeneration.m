% Author: Meghna Verma
% Last Updated date: June 19, 2017
% This file is used to create cell arrays using ENISI output files
% Keep this in the same folder as where the outputs from the hybrid
% computer model are.

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




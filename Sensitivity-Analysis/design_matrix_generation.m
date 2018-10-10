% Code for generation of Input Parameter design sets
% Adapted and Modified from (Moon, Dean et al. 2012). Author: Xi Chen and Meghna Verma
% Last modified: October 9, 2018
% This file contains the code for design matrix generation for sensitivity analysis. 
%%%%%%%%%%%%%%%%%%%%%%% Information of Problem %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% name of problem
info.problem = 'initialdesign_BI';
info.exname = 'initial'; % name used in the function for calculating output

% number of inputs
info.f = 38;

% original range of the inputs
info.min = zeros(1,info.f);
info.max = ones(1,info.f);
temp = xlsread('Parameters.xlsx','Organized','B2:C39');
info.min(1:38) = temp(:,1);
info.max(1:38) = temp(:,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%% Parameters to be assigned %%%%%%%%%%%%%%
% number of candidated designs to find the best design in each stage
info.r = 10000;

% number of final MCMC draws
info.nburn = 100;

% sample interval for the production MCMC draws
info.nlev = 11;

% maximum group size for automatic grouping
info.maxsi = 5;  

% overal significance level for sign test
info.alpha = 0.2;

% low-impact effect
info.tau = 14;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Stage 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% (1) Create the best Stage 1 preliminary design
% number of runs proposed for Stage 1
stage1.n1 = 4*info.f;

% call the function to find the best Stage 1 design
stage1.design = stage1_design_search(info.f, stage1.n1,...
                min(stage1.n1-info.f-1, 50), info.r);
stage1.design
 
save('init_design.mat','stage1','info');

%% 
%%%%%%%%%% (2) Transform the values of the inputs to values in respective
%%%%%%%%%% ranges.

X = zeros(stage1.n1, info.f);
for i = 1:info.f
X(:,i)  = stage1.design.x(:,i)*(info.max(i)-info.min(i))+info.min(i);
end

save('init_design.mat','stage1','info','X');

% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%% Stage 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%  (3) Create the best Stage 2 design number of new design points

temp = xlsread('PRCC_activeinactiveinputs-added','Sheet1','Q2:Q39');
stage1.selection.actx = find(temp~=0);   % active input indices
stage1.selection.actxn = length(stage1.selection.actx);   % active input numbers

stage1.selection.nctx = find(temp==0);  % inactive input indices
stage1.selection.nctxn = info.f - stage1.selection.actxn; % inactive input numbers



stage2.n2 = 5*stage1.selection.actxn;  % number of additional input combinations to add in stage 2 experiment

% number of low-impact columns at Stage 2
% stage2.dn2 = min(stage1.n1-info.f-1, stage2.n2-stage1.selection.actxn-1);
stage2.dn2 = 0;

% 
% % call the function to find the best Stage 2 design
stage2.design = stage2_design_search(info.f, stage1.n1, stage2.n2, info.r,...
                stage1.selection.actx, stage1.selection.nctx, stage2.dn2);
stage2.design


%% 
%%%%%%%%%% Transform the values of the inputs to values in respective
%%%%%%%%%% ranges.

X2 = zeros(stage2.n2, info.f);
for i = 1:info.f
X2(:,i)  = stage2.design.x(:,i)*(info.max(i)-info.min(i))+info.min(i);
end

save('Full_design.mat','stage1','stage2','info','X','X2');



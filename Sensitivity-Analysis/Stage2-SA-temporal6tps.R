# Author: Xi Chen; Modified by Meghna Verma 
# NIMML
# Last Update : 3/23/2018

path <- getwd()
setwd(path)

rm(list=ls());



library(mlegp)
library(R.matlab)

# Load the data generated from Stage2-BuildTempMM.R
load('HP_temporal.Rdata')
N_SA = 10^4;

# Test dataset generated using LHD 
data_temp = readMat('X_SA_10k.mat');
X_SA = data_temp$X;
X_SA = X_SA[,1:38];

# -----------------------------------------------------------------------

 
D_hat =array(0,dim=c(1:6)) # 1-dim: 6 time segments
 
 

for (i in 1:6)
{ 
  g0_hat = NULL;
  t_col = do.call(rbind, replicate(N_SA, i, simplify=FALSE));
  t_col = matrix(t_col, ncol = 1, byrow = FALSE);
  g0_hat  = predict(skriging_model_est1,  cbind(X_SA,t_col));
  D_hat[i] = mean(g0_hat^2)-mean(g0_hat)^2;  # The estimated total variance
}
 
S1_hat=array(0,dim=c(6,38)) # 1-dim: 6 time segments; 2-dim: 38 different input parameters  

ST_hat=array(0,dim=c(6,38)) # 1-dim: 6 time segments; 2-dim: 38 different input parameters  

# 1 -----------------------------------------------------------------------
 

file_list = c("D1","D2", "D3","D4","D5","D6","D7","D8","D9", "D10", "D11","D12","D13","D14","D15","D16","D17","D18","D19","D20","D21","D22", "D23","D24","D25","D26", "D27", "D28", "D29", "D30", "D31", "D31", "D32", "D33", "D34", "D35", "D36", "D37", "D38");

ptm <- proc.time();

for (i in 1:6)
{
  for (j in 1:38)
  {  
    D1_hat = NULL;
    Dt_hat = NULL;
    
    file_idx = j;
    file_name = paste("X_SA_", file_list[file_idx], "_10k_norm_38.mat", sep = ""); 
    data_temp = readMat(file_name);
    X_SA_D1 = data_temp[[2]];
    X_SA_D2 = data_temp[[3]];
    
    X_SA_T1 = data_temp[[5]];
    X_SA_T2 = data_temp[[6]];
    
    t_col = do.call(rbind, replicate(N_SA, i, simplify=FALSE));
    t_col = matrix(t_col, ncol = 1, byrow = FALSE);
    
    
   
    g0_hat_D1 = predict(skriging_model_est1, cbind(X_SA_D1,t_col));
    g0_hat_D2 = predict(skriging_model_est1, cbind(X_SA_D2,t_col));


    D1_hat = D_hat[i] - 1/2*mean((g0_hat_D1-g0_hat_D2)^2);  #  method 2
    
    S1_hat[i,j] = D1_hat/D_hat[i];  # The estimated 1st-order Sobol's index 
    
    
    
    g0_hat_T1 = predict(skriging_model_est1, cbind(X_SA_T1,t_col));
    g0_hat_T2 = predict(skriging_model_est1, cbind(X_SA_T2,t_col));
   
  
    Dt_hat = 1/2*mean((g0_hat_T1-g0_hat_T2)^2);  # The estimated total variance  (guaranteed to be non-negative)
    
    ST_hat[i,j] =  Dt_hat/D_hat[i];  # The estimated total sensitivity index 
    
  }
}

proc.time()-ptm

label <- c("epiinfbctdam", "epiTh1dam", "epiTh17dam", "Epiprolifer.","Epicelldeath","EpiIL10h","nTrep","nTdeath","allTrep","iTregtoTh17","Th17toiTreg","nTtoTr","nTtoiTreg", "nTtoTh17","Th1death","Th17death","iTregdeath","Trdeath", "IL10Tr","dummy","Bactkill","Bactdeath", "HPdeathduetoTcells","HPdeath","DCdeath","Monocytedeath","Resmacdeath","TrmacKill","MregDiff","ResmMacrep","Monorep","IFNg","IL10","IL17","IL21","IL6","TGFb","IL12")

pdf(paste0("S1_hat-HPLP-temp.pdf"), 7, 5)
barplot(S1_hat, horiz=TRUE, col=topo.colors(12), names.arg = label, mgp=c(0.001,0.00001,.0001), las=1, cex.names = 0.54, cex.axis = 0.55)
dev.off()

pdf(paste0("ST_hat-HPLP-temp.pdf"), 7, 5)
barplot(ST_hat, horiz=TRUE, col=topo.colors(12), names.arg = label, mgp=c(0.001,0.00001,.0001), las=1, cex.names = 0.54, cex.axis = 0.55)
dev.off()

save.image("SA_HP_LP_norm_log_6T.Rdata");


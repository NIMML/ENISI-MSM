# Author: Xi Chen; Modified by Meghna Verma 
# NIMML
# Last update : 3/23/2018

# install.packages("mlegp", lib="~/R/lib");
# install.packages("R.matlab", lib="~/R/lib");

path <- getwd()
setwd(path)

rm(list=ls());

library(mlegp)
library(R.matlab)

Correponding_cells <- read.csv("Correponding_cells-March8.csv")
SAMPLE1 <- Correponding_cells
sorted_matlab <- sort.int(SAMPLE1$MATLAB, index.return = TRUE)

X <- read.csv("Parameters.csv", header = FALSE)
X <- X[,-1]
min_max = read.csv("ranges.csv" , header = FALSE);
min_max <- t(min_max[-1,-1])
ranges_df <- as.matrix(data.frame(min_max), ncol = 1, byrow = FALSE);
ranges_numeric <- mapply(ranges_df, FUN=as.numeric)
ranges <- matrix(data=ranges_numeric, ncol = 38, nrow = 2)

for (k in 1:38)
{
  X[,k] = (X[,k]-ranges[1,k])/(ranges[2,k]-ranges[1,k]);  # standadize the parameter to [0,1]
}

X_full = do.call(rbind, replicate(6, X, simplify=FALSE));   # replicate the design points for 6 times
data_input = readMat('LP-HP-temp.mat')

ymean <- data.frame(data_input)
ymean <- t(ymean)
ymean_df <- data.frame(ymean)
ymean_df$index = sorted_matlab$ix
data_temp <- ymean_df[order(ymean_df$index),]
data_temp = as.matrix(data_temp, ncol = 1, byrow = FALSE);
data_temp <- data_temp[,-202]

t_full = NULL;
y_mean = NULL;


for (k in c(1:4)) 
{
t = k; # period index, each period includes multiple days of interest
t_col = do.call(rbind, replicate(267, t, simplify=FALSE));
t_col = matrix(t_col, ncol = 1, byrow = FALSE);
t_full = cbind(t_full, t_col);

time_seg = switch(k, 1:14, 15:21, 22:30, 31:42, 43:90, 91:201);

#specify the time index to look at, range of values of days;
days = as.matrix(c(time_seg));  
y_temp =  data_temp[, days];
y_temp = as.matrix(y_temp, ncol = 1, byrow = FALSE);
y_mean_temp = as.matrix(rowMeans(y_temp)); 
y_mean = cbind(y_mean, y_mean_temp); 
}

dim(t_full) = c(267*6,1);
dim(y_mean) = c(267*6,1);

y_mean_max =  y_mean + matrix(1,267*6,1);  
# transform the counts to reduce the output variation
log_y_mean = log(y_mean_max); 

Xt_full = cbind(X_full, t_full);


# === >>> SK fit and predict

skriging_model_est0 = mlegp(Xt_full,log_y_mean, constantMean = 0, nugget = 1, nugget.known = 0);
skriging_model_est1 = mlegp(Xt_full,log_y_mean, constantMean = 1, nugget = 1, nugget.known = 0);
# save the fitted SK metamodel for one output type, remember to rename it for different outputs differently

save.image('HP_temporal.Rdata');  
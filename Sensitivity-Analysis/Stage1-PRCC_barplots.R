# Author: Meghna Verm
# NIMML
# Last Modified: 10/9/2018
## Plots barplots for Stage 1 data obtained after running the hybrid model. The active inputs (p< 0.05) are
## colored in blue whereas inactive are highlighted in gray. 

getwd()
setwd("/Users/meghnaverma/Documents/MATLAB/NIMML/Round2_SA/Coefficients-values")


coeff_pcc_Mres <- read.csv("Mres_prcc.csv")
p_values_Mres <- read.csv("Mres_p.csv")

coeff_pcc_HP <- read.csv("HPLP_prcc.csv")
p_values_HP <- read.csv("HPLP_p.csv")
label <- c("epiinfbctdam", "epiTh1dam", "epiTh17dam", "Epiprolifer.","Epicelldeath","EpiIL10h","nTrep","nTdeath","allTrep","iTregtoTh17","Th17toiTreg","nTtoTr","nTtoiTreg", "nTtoTh17","Th1death","Th17death","iTregdeath","Trdeath", "IL10Tr","dummy","Bactkill","Bactdeath", "HPdeath-Tcells","HPdeath","DCdeath","Monocytedeath","Resmacdeath","TrmacKill","MregDiff","ResmMacrep","Monorep","IFNg","IL10","IL17","IL21","IL6","TGFb","IL12")

cols1 <- c("gray", "blue")[(p_values_Mres$p.value < 0.05)+1]
cols2 <- c("gray", "blue")[(p_values_HP$p.value < 0.05)+1]
pdf(paste0("Fig_PCC",".pdf"), 7, 5)

par(mar=c(1,5,7,2), las=1, mgp=c(3.5,0,0), mfrow=c(1,2)) 
barplot(coeff_pcc_HP$original, horiz=TRUE, col=cols2, names.arg = label, cex.names = 0.6,cex.lab = 0.9, cex.main = 0.65, cex.axis = 0.65,
        xlim = c(-0.4, 0.4), ylim = c(0,30), ylab = 'Parameters')
title("Helicobacter pylori in \n Lamina propria", line = 5.5, cex.main = 0.7)

barplot(coeff_pcc_Mres$original, horiz=TRUE, col=cols1, names.arg = label, cex.names = 0.6,cex.lab = 0.9, cex.main = 0.65, cex.axis = 0.65,
        xlim = c(-0.4, 0.4), ylim = c(0,30))
title("Resident macrophages in \nLamina propria", line = 5.5, cex.main = 0.7)

dev.off()




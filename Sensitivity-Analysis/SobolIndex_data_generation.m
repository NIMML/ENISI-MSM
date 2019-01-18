% Author: Xi Chen
%-------------------------Last update on 01/26/2018-------------------------

%-----------------calculate g0_hat and D_hat------------------------
X = lhsdesign(10^4,38,'criterion','maximin');
save('X_SA_10k.mat');

%%
%-----------------calculate X1's first-order and total Sobol indices------------------------
X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D11 = X_D(:,1:38);
X_D12 = X_D(:,[1,39:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T11 = X_D(:,[38,1:37]);
X_T12 = X_D(:,[39,1:37]);

save('X_SA_D1_10k_norm_38');


%%
%-----------------calculate X2's first-order and total Sobol indices------------------------
clear;
X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D21 = X_D(:,[2, 1, 3:38]);
X_D22 = X_D(:,[39, 1, 40:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T21 = X_D(:,[1,38, 2:37]);
X_T22 = X_D(:,[1,39, 2:37]);

save('X_SA_D2_10k_norm_38');

%%
%-----------------calculate X3's first-order and total Sobol indices------------------------
clear;
X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D31 = X_D(:,[2:3, 1, 4:38]);
X_D32 = X_D(:,[39:40, 1, 41:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T31 = X_D(:,[1:2, 38, 3:37]);
X_T32 = X_D(:,[1:2, 39, 3:37]);

save('X_SA_D3_10k_norm_38');


%%
%-----------------calculate X4's first-order and total Sobol indices------------------------
clear;
X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D41 = X_D(:,[2:4, 1, 5:38]);
X_D42 = X_D(:,[39:41, 1, 42:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T41 = X_D(:,[1:3, 38, 4:37]);
X_T42 = X_D(:,[1:3, 39, 4:37]);

save('X_SA_D4_10k_norm_38');

%%
%-----------------calculate X5's first-order and total Sobol indices------------------------
clear;
X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D51 = X_D(:,[2:5, 1, 6:38]);
X_D52 = X_D(:,[39:42, 1, 43:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T51 = X_D(:,[1:4, 38, 5:37]);
X_T52 = X_D(:,[1:4, 39, 5:37]);

save('X_SA_D5_10k_norm_38');

%%
%-----------------calculate X6's first-order and total Sobol indices------------------------
clear;
X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D61 = X_D(:,[2:6, 1, 7:38]);
X_D62 = X_D(:,[39:43, 1, 44:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T61 = X_D(:,[1:5, 38, 6:37]);
X_T62 = X_D(:,[1:5, 39, 6:37]);

save('X_SA_D6_10k_norm_38');

%%
%-----------------calculate X7's first-order and total Sobol indices------------------------
clear;
X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D71 = X_D(:,[2:7, 1, 8:38]);
X_D72 = X_D(:,[39:44, 1, 45:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T71 = X_D(:,[1:6, 38, 7:37]);
X_T72 = X_D(:,[1:6, 39, 7:37]);

save('X_SA_D7_10k_norm_38');
 
%%
%-----------------calculate X8's first-order and total Sobol indices------------------------
clear;
X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D81 = X_D(:,[2:8, 1, 9:38]);
X_D82 = X_D(:,[39:45, 1, 46:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T81 = X_D(:,[1:7, 38, 8:37]);
X_T82 = X_D(:,[1:7, 39, 8:37]);

save('X_SA_D8_10k_norm_38');

%%
%-----------------calculate X9's first-order and total Sobol indices------------------------
clear;
X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D91 = X_D(:,[2:9, 1, 10:38]);
X_D92 = X_D(:,[39:46, 1, 47:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T91 = X_D(:,[1:8, 38, 9:37]);
X_T92 = X_D(:,[1:8, 39, 9:37]);

save('X_SA_D9_10k_norm_38');

%%
%-----------------calculate X10's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D101 = X_D(:,[2:10, 1, 11:38]);
X_D102 = X_D(:,[39:47, 1, 48:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T101 = X_D(:,[1:9, 38, 10:37]);
X_T102 = X_D(:,[1:9, 39, 10:37]);

 
save('X_SA_D10_10k_norm_38');

%%
%-----------------calculate X11's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D111 = X_D(:,[2:11, 1, 12:38]);
X_D112 = X_D(:,[39:48, 1, 49:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T111 = X_D(:,[1:10, 38, 11:37]);
X_T112 = X_D(:,[1:10, 39, 11:37]);

 
save('X_SA_D11_10k_norm_38');

%%
%-----------------calculate X12's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D121 = X_D(:,[2:12, 1, 13:38]);
X_D122 = X_D(:,[39:49, 1, 50:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T121 = X_D(:,[1:11, 38, 12:37]);
X_T122 = X_D(:,[1:11, 39, 12:37]);

 
save('X_SA_D12_10k_norm_38');

%%
%-----------------calculate X13's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D131 = X_D(:,[2:13, 1, 14:38]);
X_D132 = X_D(:,[39:50, 1, 51:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T131 = X_D(:,[1:12, 38, 13:37]);
X_T132 = X_D(:,[1:12, 39, 13:37]);

 
save('X_SA_D13_10k_norm_38');

%%
%-----------------calculate X14's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D141 = X_D(:,[2:14, 1, 15:38]);
X_D142 = X_D(:,[39:51, 1, 52:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T141 = X_D(:,[1:13, 38, 14:37]);
X_T142 = X_D(:,[1:13, 39, 14:37]);

 
save('X_SA_D14_10k_norm_38');

%%
%-----------------calculate X15's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D151 = X_D(:,[2:15, 1, 16:38]);
X_D152 = X_D(:,[39:52, 1, 53:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T151 = X_D(:,[1:14, 38, 15:37]);
X_T152 = X_D(:,[1:14, 39, 15:37]);

 
save('X_SA_D15_10k_norm_38');

%%
%-----------------calculate X16's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D161 = X_D(:,[2:16, 1, 17:38]);
X_D162 = X_D(:,[39:53, 1, 54:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T161 = X_D(:,[1:15, 38, 16:37]);
X_T162 = X_D(:,[1:15, 39, 16:37]);

 
save('X_SA_D16_10k_norm_38');

%%
%-----------------calculate X17's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D171 = X_D(:,[2:17, 1, 18:38]);
X_D172 = X_D(:,[39:54, 1, 55:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T171 = X_D(:,[1:16, 38, 17:37]);
X_T172 = X_D(:,[1:16, 39, 17:37]);

 
save('X_SA_D17_10k_norm_38');


%%
%-----------------calculate X18's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D181 = X_D(:,[2:18, 1, 19:38]);
X_D182 = X_D(:,[39:55, 1, 56:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T181 = X_D(:,[1:17, 38, 18:37]);
X_T182 = X_D(:,[1:17, 39, 18:37]);

 
save('X_SA_D18_10k_norm_38');

%%
%-----------------calculate X19's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D191 = X_D(:,[2:19, 1, 20:38]);
X_D192 = X_D(:,[39:56, 1, 57:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T191 = X_D(:,[1:18, 38, 19:37]);
X_T192 = X_D(:,[1:18, 39, 19:37]);

 
save('X_SA_D19_10k_norm_38');

%%
%-----------------calculate X20's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D201 = X_D(:,[2:20, 1, 21:38]);
X_D202 = X_D(:,[39:57, 1, 58:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T201 = X_D(:,[1:19, 38, 20:37]);
X_T202 = X_D(:,[1:19, 39, 20:37]);

 
save('X_SA_D20_10k_norm_38');


%%
%-----------------calculate X21's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D211 = X_D(:,[2:21, 1, 22:38]);
X_D212 = X_D(:,[39:58, 1, 59:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T211 = X_D(:,[1:20, 38, 21:37]);
X_T212 = X_D(:,[1:20, 39, 21:37]);

 
save('X_SA_D21_10k_norm_38');


%%
%-----------------calculate X22's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D221 = X_D(:,[2:22, 1, 23:38]);
X_D222 = X_D(:,[39:59, 1, 60:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T221 = X_D(:,[1:21, 38, 22:37]);
X_T222 = X_D(:,[1:21, 39, 22:37]);

 
save('X_SA_D22_10k_norm_38');


%%
%-----------------calculate X23's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D231 = X_D(:,[2:23, 1, 24:38]);
X_D232 = X_D(:,[39:60, 1, 61:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T231 = X_D(:,[1:22, 38, 23:37]);
X_T232 = X_D(:,[1:22, 39, 23:37]);

 
save('X_SA_D23_10k_norm_38');


%%
%-----------------calculate X24's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D241 = X_D(:,[2:24, 1, 25:38]);
X_D242 = X_D(:,[39:61, 1, 62:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T241 = X_D(:,[1:23, 38, 24:37]);
X_T242 = X_D(:,[1:23, 39, 24:37]);

 
save('X_SA_D24_10k_norm_38');


%%
%-----------------calculate X25's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D251 = X_D(:,[2:25, 1, 26:38]);
X_D252 = X_D(:,[39:62, 1, 63:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T251 = X_D(:,[1:24, 38, 25:37]);
X_T252 = X_D(:,[1:24, 39, 25:37]);

 
save('X_SA_D25_10k_norm_38');

%%
%-----------------calculate X26's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D261 = X_D(:,[2:26, 1, 27:38]);
X_D262 = X_D(:,[39:63, 1, 64:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T261 = X_D(:,[1:25, 38, 26:37]);
X_T262 = X_D(:,[1:25, 39, 26:37]);

 
save('X_SA_D26_10k_norm_38');

%%
%-----------------calculate X27's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D271 = X_D(:,[2:27, 1, 28:38]);
X_D272 = X_D(:,[39:64, 1, 65:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T271 = X_D(:,[1:26, 38, 27:37]);
X_T272 = X_D(:,[1:26, 39, 27:37]);

 
save('X_SA_D27_10k_norm_38');

%%
%-----------------calculate X28's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D281 = X_D(:,[2:28, 1, 29:38]);
X_D282 = X_D(:,[39:65, 1, 66:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T281 = X_D(:,[1:27, 38, 28:37]);
X_T282 = X_D(:,[1:27, 39, 28:37]);

 
save('X_SA_D28_10k_norm_38');


%%
%-----------------calculate X29's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D291 = X_D(:,[2:29, 1, 30:38]);
X_D292 = X_D(:,[39:66, 1, 67:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T291 = X_D(:,[1:28, 38, 29:37]);
X_T292 = X_D(:,[1:28, 39, 29:37]);

 
save('X_SA_D29_10k_norm_38');

%%
%-----------------calculate X30's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D301 = X_D(:,[2:30, 1, 31:38]);
X_D302 = X_D(:,[39:67, 1, 68:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T301 = X_D(:,[1:29, 38, 30:37]);
X_T302 = X_D(:,[1:29, 39, 30:37]);

 
save('X_SA_D30_10k_norm_38');

%%
%-----------------calculate X31's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D311 = X_D(:,[2:31, 1, 32:38]);
X_D312 = X_D(:,[39:68, 1, 69:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T311 = X_D(:,[1:30, 38, 31:37]);
X_T312 = X_D(:,[1:30, 39, 31:37]);

 
save('X_SA_D31_10k_norm_38');

%%
%-----------------calculate X32's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D321 = X_D(:,[2:32, 1, 33:38]);
X_D322 = X_D(:,[39:69, 1, 70:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T321 = X_D(:,[1:31, 38, 32:37]);
X_T322 = X_D(:,[1:31, 39, 32:37]);

 
save('X_SA_D32_10k_norm_38');


%%
%-----------------calculate X33's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D331 = X_D(:,[2:33, 1, 34:38]);
X_D332 = X_D(:,[39:70, 1, 71:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T331 = X_D(:,[1:32, 38, 33:37]);
X_T332 = X_D(:,[1:32, 39, 33:37]);

 
save('X_SA_D33_10k_norm_38');


%%
%-----------------calculate X34's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D341 = X_D(:,[2:34, 1, 35:38]);
X_D342 = X_D(:,[39:71, 1, 72:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T341 = X_D(:,[1:33, 38, 34:37]);
X_T342 = X_D(:,[1:33, 39, 34:37]);

 
save('X_SA_D34_10k_norm_38');

%%
%-----------------calculate X35's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D351 = X_D(:,[2:35, 1, 36:38]);
X_D352 = X_D(:,[39:72, 1, 73:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T351 = X_D(:,[1:34, 38, 35:37]);
X_T352 = X_D(:,[1:34, 39, 35:37]);

 
save('X_SA_D35_10k_norm_38');

%%
%-----------------calculate X36's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D361 = X_D(:,[2:36, 1, 37:38]);
X_D362 = X_D(:,[39:73, 1, 74:75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T361 = X_D(:,[1:35, 38, 36:37]);
X_T362 = X_D(:,[1:35, 39, 36:37]);

 
save('X_SA_D36_10k_norm_38');

%%
%-----------------calculate X37's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D371 = X_D(:,[2:37, 1,  38]);
X_D372 = X_D(:,[39:74, 1,  75]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T371 = X_D(:,[1:36, 38, 37]);
X_T372 = X_D(:,[1:36, 39, 37]);

 
save('X_SA_D37_10k_norm_38');

%%
%-----------------calculate X38's first-order and total Sobol indices------------------------
clear;

X_D = lhsdesign(10^4,38*2-1,'criterion','maximin');

X_D381 = X_D(:,[2:38, 1]);
X_D382 = X_D(:,[39:75, 1]);


X_T = lhsdesign(10^4,39,'criterion','maximin');
X_T381 = X_D(:,[1:37, 38]);
X_T382 = X_D(:,[1:37, 39]);

 
save('X_SA_D38_10k_norm_38');
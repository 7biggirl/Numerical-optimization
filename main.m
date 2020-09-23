clear all ;
clc ;
%%
x0 = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];%0;0;0;0;0;0;0;0;0;0;0] ;
eps = 1.0e-3 ;
n = length(x0) ;
disp('----------------------------------------------------');
disp('优化工具箱') ;
tic
options = optimoptions('fmincon','MaxFunctionEvaluations',1000000) ;
[x_min, f_min, eixt, output] = fminunc(@cal_min, x0, options)
toc
%%
disp('----------------------------------------------------');
disp('计算函数:') ;
tic
global f G flag 
cal(n) ;
toc
%% 负梯度法
disp('----------------------------------------------------');
disp('负梯度法') ;
tic
[x1,f1,k1] = opt_steepest(eps,x0) 
toc

%% FR法
disp('----------------------------------------------------');
disp('FR法');
tic
[x2, f2, k2] = Conjugate_grad(eps, x0) 
toc

%% DFP法
disp('----------------------------------------------------');
disp('DFP法');
tic
[x3, f3, k3] = DFP(eps, x0) 
toc

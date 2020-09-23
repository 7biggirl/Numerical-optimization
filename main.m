clear all ;
clc ;
%%
x0 = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0];%0;0;0;0;0;0;0;0;0;0;0] ;
eps = 1.0e-3 ;
n = length(x0) ;
disp('----------------------------------------------------');
disp('�Ż�������') ;
tic
options = optimoptions('fmincon','MaxFunctionEvaluations',1000000) ;
[x_min, f_min, eixt, output] = fminunc(@cal_min, x0, options)
toc
%%
disp('----------------------------------------------------');
disp('���㺯��:') ;
tic
global f G flag 
cal(n) ;
toc
%% ���ݶȷ�
disp('----------------------------------------------------');
disp('���ݶȷ�') ;
tic
[x1,f1,k1] = opt_steepest(eps,x0) 
toc

%% FR��
disp('----------------------------------------------------');
disp('FR��');
tic
[x2, f2, k2] = Conjugate_grad(eps, x0) 
toc

%% DFP��
disp('----------------------------------------------------');
disp('DFP��');
tic
[x3, f3, k3] = DFP(eps, x0) 
toc

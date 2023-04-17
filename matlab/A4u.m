function [A4uData] = A4u()

syms x1 x2 x3 x4 a real
%% 支付矩阵
% payoff_matrix = [0 -1 0 1; 1 0 -1 0; 0 1 0 -1; -1 0 1 0]
payoff_matrix = [0 0 0 a;  1 0 0 0; 0 1 0 0; 0 0 1 0];
%% 空间各个点的支付向量
Payoff_vector_field_F = payoff_matrix *[x1 x2 x3 x4]'
%% 各点的支付均值
mean_U = [x1 x2 x3 x4] * Payoff_vector_field_F
%% 动力学方程
V_F = [x1 x2 x3 x4]'.*(Payoff_vector_field_F - mean_U)
%% 全微分矩阵
D_V_F = [diff(V_F,'x1') diff(V_F,'x2') diff(V_F,'x3') diff(V_F,'x4')]
%% 求0点
% S=solve(V_F);
%
x1=a/(3*a + 1);x2=a/(3*a + 1);x3=a/(3*a + 1);1/4;x4=1/(3*a + 1);
Ne = [x1 x2 x3 x4];


[eigen_vector eigen_value w] = eig(eval(D_V_F))
V2 = payoff_matrix*eigen_vector
V21=V2(:,1)
[Ymn1]= from_eigenvector_out_am(double(subs(eval(V21),'a',1/4)))
[Ymn3]= from_eigenvector_out_am(double(subs(eval(V21),'a',4)))

A4uData.Ymn1 = Ymn1;
A4uData.Ymn3 = Ymn3;

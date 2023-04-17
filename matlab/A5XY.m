function [A5XYData] = A5XY()

syms x1 x2 x3 x4 x5 a real
%% 支付矩阵
% payoff_matrix = [0 -1 0 1; 1 0 -1 0; 0 1 0 -1; -1 0 1 0]
payoff_matrix = [0 a 1 -1 -a;-a 0 a 1 -1;-1 -a 0 a 1; 1 -1 -a 0 a ;a 1 -1 -a 0 ];
%payoff_matrix = [0 4.236 1 -1 -4.236;-4.236 0 4.236 1 -1;-1 -4.236 0 4.236 1; 1 -1 -4.236 0 4.236 ;4.236 1 -1 -4.236 0 ];
%% 空间各个点的支付向量
Payoff_vector_field_F = payoff_matrix *[x1 x2 x3 x4 x5]'
%% 各点的支付均值
mean_U = [x1 x2 x3 x4 x5] * Payoff_vector_field_F
%% 动力学方程
V_F = [x1 x2 x3 x4 x5]'.*(Payoff_vector_field_F - mean_U)
%% 全微分矩阵
D_V_F = [diff(V_F,'x1') diff(V_F,'x2') diff(V_F,'x3') diff(V_F,'x4') diff(V_F,'x5')]
%% 求0点
% S=solve(V_F);
%
%x1=a/(3*a + 1);x2=a/(3*a + 1);x3=a/(3*a + 1);1/4;x4=1/(3*a + 1);
%Ne = [x1 x2 x3 x4];


%[eigen_vector eigen_value w] = eig(eval(D_V_F))
[eigen_vector eigen_value w] = eig(subs(subs(subs(subs(subs(D_V_F,x1,1/5),x2,1/5),x3,1/5),x4,1/5),x5,1/5))
V2 = payoff_matrix*eigen_vector
V21=V2(:,3)
[Ymn1 Xmn1]= from_eigenvector_out_XY(double(subs(eval(V21),'a',-4.236)))
[Ymn2 Xmn2]= from_eigenvector_out_XY(double(subs(eval(V21),'a',-0.618)))
[Ymn3 Xmn3]= from_eigenvector_out_XY(double(subs(eval(V21),'a',0.234)))
[Ymn4 Xmn4]= from_eigenvector_out_XY(double(subs(eval(V21),'a',1.618)))
[Ymn5 Xmn5]= from_eigenvector_out_XY(double(subs(eval(V21),'a',4.236)))


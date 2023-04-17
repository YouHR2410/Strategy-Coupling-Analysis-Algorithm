function [A4oData] = A4o()
% Y5o - A function that calculates the replicator dynamics of a 5-strategy game
%
% Output:
%   - Y5oData: A structure containing the following fields:
%               * x1, x2, x3, x4, x5: The equilibrium frequencies of each strategy
%               * Ao: The equilibrium point of the game
%               * eigen_vector: The eigenvectors of the Jacobian at the equilibrium point
%               * eigen_value: The eigenvalues of the Jacobian at the equilibrium point
%
% Usage:
%   Y5o()
%
% Example:
%   Y5o()
%
% Author: [Wang Zhijian]
% Date: [20230214]

% Define symbolic variables
syms x1 x2 x3 x4  a real

% Define the payoff matrix
payoff_matrix = [0 0 0 a ; 1 0 0 0 ; 0 1 0 0; 0 0 1 0];

% Calculate the payoff vector field for each point in the space
Payoff_vector_field_F = payoff_matrix *[x1 x2 x3 x4]';

% Calculate the mean payoff
mean_U = [x1 x2 x3 x4] * Payoff_vector_field_F;

% Define the replicator dynamics equation
V_F = [x1 x2 x3 x4]'.*(Payoff_vector_field_F-mean_U);

% Calculate the Jacobian matrix
D_V_F = [diff(V_F,'x1') diff(V_F,'x2') diff(V_F,'x3') diff(V_F,'x4')];
Jac = eval(D_V_F);

% Find the equilibrium point
%S = solve(V_F);
%S = double(struct2array(S));
%Ao = S(abs(prod(S, 2))>0, :);

% Calculate the equilibrium frequencies for each strategy
%Ne = Ao(length(Ao(:,1)),:);
%x1 = Ne(1); x2 = Ne(2); x3 = Ne(3); x4 = Ne(4);

% Calculate the eigenvectors and eigenvalues of the Jacobian matrix
[eigen_vector, eigen_value, left_eivecto] = eig(eval(Jac));

[eigen_vector2 eigen_value2 w] = eig(eval(D_V_F))
V2 = payoff_matrix*eigen_vector
V21=V2(:,1); 
[Ymn1 Xmn1]= from_eigenvector_out_XY(double(subs(eval(V21),'a',1/4)))
[Ymn3 Xmn3]= from_eigenvector_out_XY(double(subs(eval(V21),'a',4)))

% Store the results in a structure
A4oData = struct();
A4oData.x1 = x1;
A4oData.x2 = x2;
A4oData.x3 = x3;
A4oData.x4 = x4;
%A4oData.Ao = Ao;
A4oData.eigen_vector = eigen_vector;
A4oData.eigen_value = eigen_value;
A4oData.left_eivecto = left_eivecto;
A4oData.Ymn1 = Ymn1;
A4oData.Ymn3 = Ymn3;

% Save the results in a .mat file
save('A4oReplicator.mat', 'A4oData');
end

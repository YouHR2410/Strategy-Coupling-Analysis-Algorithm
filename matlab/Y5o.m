function [Y5oData] = Y5o()
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
syms x1 x2 x3 x4 x5 a real

% Define the payoff matrix
payoff_matrix = [0 3 4 11 11 ; 5 0 2 11 12 ; 2 5 0 9 12 ; 6 10 10 0 3 ; 10 10 10 4 0];
%payoff_matrix = [0 a 1 -1 -a ; -a 0 a 1 -1 ; -1 -a 0 a 1 ; 1 -1 -a 0 a ; a 1 -1 -a 0];
% Calculate the payoff vector field for each point in the space
Payoff_vector_field_F = payoff_matrix *[x1 x2 x3 x4 x5]';

% Calculate the mean payoff
mean_U = [x1 x2 x3 x4 x5] * Payoff_vector_field_F;

% Define the replicator dynamics equation
V_F = [x1 x2 x3 x4 x5]'.*(Payoff_vector_field_F-mean_U);

% Calculate the Jacobian matrix
D_V_F = [diff(V_F,'x1') diff(V_F,'x2') diff(V_F,'x3') diff(V_F,'x4') diff(V_F,'x5')];
Jac = eval(D_V_F);

% Find the equilibrium point
S = solve(V_F);
S = double(struct2array(S));
Ao = S(abs(prod(S, 2))>0, :);

% Calculate the equilibrium frequencies for each strategy
Ne = Ao(length(Ao(:,1)),:);
x1 = Ne(1); x2 = Ne(2); x3 = Ne(3); x4 = Ne(4); x5 = Ne(5);

% Calculate the eigenvectors and eigenvalues of the Jacobian matrix
[eigen_vector, eigen_value, left_eivecto] = eig(eval(Jac));


% Store the results in a structure
Y5oData = struct();
Y5oData.x1 = x1;
Y5oData.x2 = x2;
Y5oData.x3 = x3;
Y5oData.x4 = x4;
Y5oData.x5 = x5;
Y5oData.Ao = Ao;
Y5oData.eigen_vector = eigen_vector;
Y5oData.eigen_value = eigen_value;
Y5oData.left_eivecto = left_eivecto;

% Save the results in a .mat file
save('Y5oReplicator.mat', 'Y5oData');
end

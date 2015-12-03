function [PC,V] =twodpca(A)

% twodPCA: Perform two-dimensional PCA using covariance.
% dataimage - MxN matrix of input data
% (M dimensions, N trials)
% PC - each column is a PC
% V - Mx1 matrix of variances

% A is the image matrix(MxN = 28x28)
[~,N] = size(A);
[m,n] = size(A{1});
%ones[1,N] = X;

%Y = A*X;
% M is the column, and N is the row, in this traindata, we have 784 in M
% and 300 in N

Gt =zeros(n,n);
suma =zeros(m,n);
for i= 1:N
    suma = suma +A{i};
    
end
    averageA = suma/300;
% calculate the image cavariance matrix(Gt)
for i= 1:N
    Gt = Gt + (A{i}-averageA)'*(A{i}-averageA);
end
Gt = 1 / N .* Gt;
    
% find the eigenvectors and eigenvalues
[PC, V] = eig(Gt);

% extract diagonal of matrix as vector
V = diag(V);

% sort the variances in decreasing order
[~, rindices] = sort(-1*V);
V = V(rindices);
PC = PC(:,rindices);



end
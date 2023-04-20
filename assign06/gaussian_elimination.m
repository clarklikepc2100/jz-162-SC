%Gaussian Elimination
% Initial
close all, clear all,  clc;


A=[3 5 7;
    2 4 8;
    1 2 9;];
b=[1 1 3];


% Algorithm 20.1 
% copy of A
U = A;
% get row, col
[m,n]=size(A);
L=eye(n);

% for all n-1 column
for j = 1:n-1
    % Subtract multiples of row j to 0
    % U(i,j) for i > j
    for i = j+1:n
        L(i,j)=U(i,j)/U(j,j);
        U(i,:) = U(i,:) - L(i,j) * U(j,:);
    end
end

disp(U)
disp('A=LU=')
disp(L*U)

% Algorithm Outer Product
% Remove one 'for' loop
Uout=A;
Lout=eye(n);
for j = 1:n-1
    % Subtract  row j to 0 out U(i,j) for i > j
    Lout(j+1:n,j)=Uout(j+1:n,j)/Uout(j,j)
    Uout(j+1:n,:) = Uout(j+1:n,:) - Lout(j+1:n,j)*Uout(j,:);
end

disp(Uout)
disp('A=Lout*Uout=')
disp(Lout*Uout)



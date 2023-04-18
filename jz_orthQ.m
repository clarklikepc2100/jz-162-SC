function [Q] = jz_orthQ(W)
% Usage: [Q] = orthQ(W)
%
% This routine that uses the captured Householder transformations from
% matrix W to construct the orthogonal matrix Q.
%
% Inputs:  W      Lower-triangular matrix of Householder reflections
%                 
% Outputs: Q      The orthogonal matrix: Q
%

[m,n]=size(W);
Q = eye(m);

for j = n:-1:1
    Q(j:m,:)=Q(j:m,:)-2*W(j:m,j)*(W(j:m,j)'*Q(j:m,:));
end

end
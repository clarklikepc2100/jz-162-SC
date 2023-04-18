function [W,R] = jz_qr_house2(A)
% Usage: [W,R] = jz_qr_house2(A)
%
% This routine numerically approximates a full QR Decomposition of A by
% Householder reflection.
%
% Inputs:  A      Randomly generated a m-by-n sized Matrix
%                 
% Outputs: Q      The orthogonal matrix: Q
%          R      The upper triangular matrix: R
%

[m,n] = size(A);
W=zeros(m,n);

for k = 1:n
    v=A(k:m,k);
    v(1)=v(1)+mysign(v(1))*norm(v);
    v=v/norm(v);
    A(k:m,k:n)=A(k:m,k:n)-2*v*(v'*A(k:m,k:n));
    W(k:m,k)=v;
end
R=triu(A);
end
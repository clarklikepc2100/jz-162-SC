
% Initial
close all, clear all, fclose all,clc;

% Matlab Intital Matrix
m=50; n=12;
ls=linspace(0,1,m);

v_ls=vander(ls);
A=fliplr(v_ls);

A=A(:,1:n);
b=cos(4*ls)';
 
% (a) 
[R,~] = chol(A'*A);
v1=R\(R'\(A'*b))
error_a = norm((A*v1) - b)


%QR factorization computed by  (modified Gram-Schmid)

[Q,R] = jz_qr_mgs(A)
v2=R\(Q'*b)
error_b = norm((A*v2) - b)


%QR factorization computed by (Householder triangularization)

[Q,R]=jz_qr_house1(A);
v3=R\(Q'*b)
error_c = norm((A*v3) - b)


%QR factorization computed 
[Q,R]=qr(A,0);
v4=R\(Q'*b)
error_d = norm((A*v4) - b)


% Matlab code
v=A
v5=A\b
error_e = norm((v*v5) - b)

%SVD, MATLAB 
[U,S,V]=svd(A);
v6=V*(S\(U'*b))
error_f = norm((A*v6) - b)

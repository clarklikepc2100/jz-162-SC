% Matlab Intital Matrix
m=50; n=12;
t=linspace(0,1,m);

A=fliplr(vander(t));
A=A(:,1:n);
b=cos(4*t)';
 
% (a) 
[R,~] = chol(A'*A);
x1=R\(R'\(A'*b))
Error1 = norm((A*x1) - b)


%QR factorization computed by mgs.m (modified Gram-Schmid Exercise 8.2)
% Matlab Code #7
[Q,R] = jz_mgs(A)
x2=R\(Q'*b)
Error2 = norm((A*x2) - b)


%QR factorization computed by house.m (Householder triangularization, Exercise 10.2)
% Matlab Code #8
%[W1,R] = house(A);
%Q = formQ(W1);
%x3=R\(Q'*b)
%Error3 = norm((A*x3) - b)



%QR factorization computed by MATLAB%s qr.m (also Householder triangularization)
% Matlab Code #9
[Q,R]=qr(A,0);
x4=R\(Q'*b)
Error4 = norm((A*x4) - b)



x=A
% Matlab Code #10
x5=A\b
Error5 = norm((A*x5) - b)


%SVD, MATLAB svd.m
% Matlab Code #11
[U,S,V]=svd(A);
x6=V*(S\(U'*b))
Error6 = norm((A*x6) - b)



%The calculations above will produce six lists of twelve coefficients. In each list, shade with red the digits that appear to be wrong (affected by rounding error). Comment on what differences you observe. Do the normal equations exhibit instability? You do not have to explain your explain your obervations.
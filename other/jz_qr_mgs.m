%% Caclulate QR Factorization by Modified Gram-Schmidt Algorithm
function [Q,R]=jz_mgs(A)
[m,n]=size(A);

%Initial Q, R matirx
Q=zeros(m,n);
R=zeros(n,n);

% m<n error
if(m<n)
    error('m>=0 is the initial conditions')
end

% Intial Q
for i=1:n
    V(:,i)=A(:,i);
end


for i=1:n
  R(i,i)=norm(V(:,i),2);
  Q(:,i)=V(:,i)/R(i,i);
  for j=(i+1):n
    R(i,j)=Q(:,i)'*V(:,j);
    V(:,j)=V(:,j)-R(i,j)*Q(:,i);
  end

end
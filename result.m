% Initial
close all, clear all, fclose all,clc;

n=10:10:1000;
Factorization_Error=zeros(length(n),3); Orthogonality_Error=zeros(length(n),3);
FactError=zeros(length(n),1); OrthoError=zeros(length(n),1);

for i=1:length(n)
    A=randn(n(i),n(i));
    I = eye(n(i),n(i));
    [Q,R] = jz_qr_mgs(A);
    FactError(i)=norm(A - (Q*R));
    OrthoError(i)=norm(I - (Q'*Q));
end
Factorization_Error(:,1)=FactError(:);
Orthogonality_Error(:,1)=OrthoError(:);

for i=1:length(n)
    A=randn(n(i),n(i));
    I = eye(n(i),n(i));
    [W,R] = house(A);
    Q = formQ(W);
    FactError(i)=norm(A - (Q*R));
    OrthoError(i)=norm(I - (Q'*Q));
end
Factorization_Error(:,2)=FactError(:);
Orthogonality_Error(:,2)=OrthoError(:);

for i=1:length(n)
    A=randn(n(i),n(i));
    I = eye(n(i),n(i));
    [Q,R]=qr(A,0);
    FactError(i)=norm(A - (Q*R));
    OrthoError(i)=norm(I - (Q'*Q));
end
Factorization_Error(:,3)=FactError(:);
Orthogonality_Error(:,3)=OrthoError(:);

figure (1)
hold on
plot(n,Factorization_Error(:,1))
plot(n,Factorization_Error(:,2))
plot(n,Factorization_Error(:,3))
title('Factorization Error for QR Factorization Algorithms')
xlabel('size of Matrix A')
ylabel('Factorization Error')
legend({'MGS','House', 'qr'})
hold off


figure (2)
hold on
plot(n,Orthogonality_Error(:,1))
plot(n,Orthogonality_Error(:,2))
plot(n,Orthogonality_Error(:,3))
title('Orthogonality Error for QR factorization Algorithms')
xlabel('size of Matrix A')
ylabel('Orthogonality Error')
legend({'MGS','House', 'qr'})
hold off
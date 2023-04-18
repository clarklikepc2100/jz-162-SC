% Initial
close all, clear all, fclose all,clc;
% plot the result
n=10:10:500;
Factor_Error_All=zeros(length(n),3); 
Ortho_Error_All=zeros(length(n),3);
A_QR=zeros(length(n),1); 
I_QQ=zeros(length(n),1);

for i=1:length(n)
    A=randn(n(i),n(i));
    I = eye(n(i),n(i));
    [Q,R] = jz_qr_mgs(A);
    A_QR(i)=norm(A - (Q*R));
    I_QQ(i)=norm(I - (Q'*Q));
end
Factor_Error_All(:,1)=A_QR(:);
Ortho_Error_All(:,1)=I_QQ(:);

for i=1:length(n)
    A=randn(n(i),n(i));
    I = eye(n(i),n(i));
    [Q,R]=jz_qr_house1(A);
    A_QR(i)=norm(A - (Q*R));
    I_QQ(i)=norm(I - (Q'*Q));
end
Factor_Error_All(:,2)=A_QR(:);
Ortho_Error_All(:,2)=I_QQ(:);

for i=1:length(n)
    A=randn(n(i),n(i));
    I = eye(n(i),n(i));
    [Q,R]=qr(A,0);
    A_QR(i)=norm(A - (Q*R));
    I_QQ(i)=norm(I - (Q'*Q));
end
Factor_Error_All(:,3)=A_QR(:);
Ortho_Error_All(:,3)=I_QQ(:);

figure(1)
hold on
plot(n,Factor_Error_All(:,1))
plot(n,Factor_Error_All(:,2))
plot(n,Factor_Error_All(:,3))
title('Factorization Error for QR Factorization Algorithms')
xlabel('size of Matrix A')
ylabel('Factorization Error')
legend({'MGS','House', 'qr'})
hold off


figure (2)
hold on
plot(n,Ortho_Error_All(:,1))
plot(n,Ortho_Error_All(:,2))
plot(n,Ortho_Error_All(:,3))
title('Orthogonality Error for QR factorization Algorithms')
xlabel('size of Matrix A')
ylabel('Orthogonality Error')
legend({'MGS','House', 'qr'})
hold off
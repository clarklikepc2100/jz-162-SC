
% Initial
close all, clear all, fclose all,clc;


%cal p(x) coefficient
p= [1 -2];

%cal q(x) coefficient
q=p;
for indexi=1:8
    q=conv(q,p);
end

x= 1.92:0.001:2.08;
PX= polyval(p,x).^9
QX=polyval(q,x);

%plot p(x)=(x-2)^9
subplot(1,2,1);
plot(x,PX,'-');
xlabel('x');
ylabel('y');
title('p(x)=(x-2)^9');

%plot q(x)
subplot(1,2,2);
plot(x,QX,'-');
xlabel('x');
ylabel('y');
title('q(x)=x^9-18x^8...');


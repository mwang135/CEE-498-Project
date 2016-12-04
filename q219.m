clear all
close all

load('matrixS.mat')

f = repmat(-1,11,1);
A(1:14,1:11) = [S(8,:);S(3,:);S(7,:);S(1,:);S(2,:);S(3,:);S(4,:);S(5,:);S(6,:);S(7,:);S(8,:);S(9,:);S(10,:);S(11,:);];
A(15:25,1:11) = -[S(1,:);S(2,:);S(3,:);S(4,:);S(5,:);S(6,:);S(7,:);S(8,:);S(9,:);S(10,:);S(11,:);];
A(26:36,1:11) = eye(11);
A(37:47,1:11) = -eye(11);

b = zeros(47,1);
b(1:3,:) = [0.2 0.3 0.35];
b(4:14,:) = 1;
b(15:25,:) = 0;
b(26:36,:) = 1;
b(37:47,:) = 0;

[x,FVAL,EXITFLAG] = linprog(f,A,b);

X=S*x;
subplot(2,1,1)
bar(x);
xlabel('Sector ID');
ylabel('f_m_a_x');
title('Maximum initial impact f_m_a_x system can absorb');
axis([0 12 0 1.2]);

subplot(2,1,2)
bar(X);
xlabel('Sector ID');
ylabel('Degradation level');
title('Level of degradation in various sectors');
axis([0 12 0 1.2]);

saveas(gcf,'fmax.png')
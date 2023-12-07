n=-2:11;%计算时间序号
RN=(n>=0)&(n<10); %产生矩形脉冲序列
subplot(2,1,1) ,stem(n,RN,'.')
axis([-2 11 -0.2 1.2])
title('宽度为 10 的矩形脉冲序列');
 
n=-2:5;%计算时间序号
delta_n=(n==0)+2.5*(n==1)+2.5*(n==2)+(n==3); 
subplot(2,1,2), stem(n,delta_n,'.')
axis([-2 5 -0.2 3])
ylabel('x_{12}(n)');

T = 2*pi/(0.1*pi);% 计算周期
n = 0:3*T-1;% 计算三个周期的长度
x13 = 5 * sin(0.1 * pi * n);
noise = randn(size(n));% 生成高斯白噪声
x13_noisy = x13 + noise;% 叠加正弦序列和高斯白噪声
figure;
stem(n, x13_noisy,'.');
title('正弦序列叠加高斯白噪声');
xlabel('n');
ylabel('x_{13}(n)');
grid on;
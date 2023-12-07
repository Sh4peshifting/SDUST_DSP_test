x=[-4 -2 0 -4 -6 -4 -2 -4 -6 -6 -4 -4 -6 -6 -2 6 12 8 0 -16 -38 -60 -84 -90 -66 -32 -4 -2 -4-8 12 12 10 6 6 6 4 0 0 0 0 0 -2 -4 0 0 0 -2 -2 0 0 -2 -2 -2 -2 0];
N=length(x); % 信号长度
n=0:N-1; % 采样点

wp=0.2*pi; % 通带截止频率
ws=0.3*pi; % 阻带截止频率
wdelta=ws-wp; % 过渡带宽度
N=ceil(6.6*pi/wdelta); % 滤波器阶数，向上取整，设计中应查验 N 的奇偶是否适合。
Wc=(0.2+0.3)/2; % 理想滤波器的截止频率
b=fir1(N-1,Wc,hamming(N)); % 用 Hamming 窗函数设计 FIR 滤波器

y = filter(b, 1, x); % 用设计的滤波器滤波

% 绘制时域波形图
figure(1);subplot(2,1,1);stem(n, x);% 绘制输入序列
title('输入序列');xlabel('n');ylabel('x(n)');
subplot(2,1,2);stem(n, y);% 绘制输出序列
title('输出序列');xlabel('n');ylabel('y(n)');

% 绘制频谱图
figure(2);[h1,w1]=freqz(x,1);% 绘制输入序列的频谱图
subplot(2,1,1);plot(w1/pi,20*log10(abs(h1)))
title('输入序列的频谱图');xlabel('w/pi');ylabel('幅度/dB');
[h2,w2]=freqz(y,1);% 绘制输出序列的频谱图
subplot(2,1,2);plot(w2/pi,20*log10(abs(h2)))
title('输出序列的频谱图');xlabel('w/pi');ylabel('幅度/dB');
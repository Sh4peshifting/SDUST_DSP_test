% 设计高通FIR滤波器
wp=0.6*pi; % 通带截止频率
ws=0.45*pi; % 阻带截止频率
wdelta=wp-ws; %过渡带宽度
N=ceil(6.6*pi/wdelta); % 计算滤波器阶数
N1=N+mod(N+1,2); % 确保N1为奇数
wc=(wp+ws)/2/pi; %理想滤波器的截止频率
hn=fir1(N1-1,wc,'high',hamming(N1)); % 使用fir1()函数设计滤波器
figure(1); % 创建新的图形窗口
stem(hn,'filled'); % 绘制滤波器单位脉冲响应序列波形图
xlabel('n');ylabel('h(n)');title('单位脉冲响应');
fvtool(hn,1); % 绘制滤波器的幅频响应曲线

% 检验指标
omega=[wp ws];h = freqz(hn,1,omega);
fprintf('Ap= %.4f\n',-20*log10(abs(h(1))));
fprintf('As= %.4f\n',-20*log10(abs(h(2))));
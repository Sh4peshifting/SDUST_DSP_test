wp=0.2*pi; % 通带截止频率
ws=0.3*pi; % 阻带截止频率
wdelta=ws-wp; %过渡带宽度
N=ceil(6.6*pi/wdelta); % 滤波器阶数，向上取整，设计中应查验 N 的奇偶是否适合。
Wc=(0.2+0.3)/2; %理想滤波器的截止频率
b=fir1(N-1,Wc,hamming(N)); % 用 Hamming 窗函数设计 FIR 滤波器
figure(1);stem(b,'filled'); % 绘制滤波器的单位脉冲响应
xlabel('n');ylabel('h(n)');title('单位脉冲响应');
fvtool(b,1) % 绘制滤波器的幅频响应和相频响应

% 检验指标
omega=[wp ws];h = freqz(b,1,omega);
fprintf('Ap= %.4f\n',-20*log10(abs(h(1))));
fprintf('As= %.4f\n',-20*log10(abs(h(2))));
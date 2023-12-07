Fs=8000; % 抽样频率
wp=0.25*pi; % 通带截止频率
ws=0.35*pi; % 阻带截止频率
ap=1; % 通带最大衰减
as=40; % 阻带最小衰减

% 用冲激响应不变法设计低通滤波器
Wp1=wp*Fs; % 通带截止频率（数字）
Ws1=ws*Fs; % 阻带截止频率（数字）
[N1,Wc1]=buttord(Wp1,Ws1,ap,as,'s'); % 计算滤波器阶数和截止频率
[BS1,AS1]=butter(N1,Wc1,'s'); % 计算模拟滤波器系数
[BZ1,AZ1]=impinvar(BS1,AS1,Fs); % 冲激响应不变法转换为数字滤波器系数
[H1,w1]=freqz(BZ1,AZ1); % 计算数字滤波器的频率响应

% 检验指标
omega1=[wp ws];h = freqz(BZ1,AZ1,omega1);
fprintf('Ap= %.4f\n',-20*log10(abs(h(1))));
fprintf('As= %.4f\n',-20*log10(abs(h(2))));

% 用双线性变换法设计低通滤波器
Wp2=2*Fs*tan(wp/2); % 通带截止频率（数字）
Ws2=2*Fs*tan(ws/2); % 阻带截止频率（数字）
[N2,Wc2]=buttord(Wp2,Ws2,ap,as,'s'); % 计算滤波器阶数和截止频率
[BS2,AS2]=butter(N2,Wc2,'s'); % 计算模拟滤波器系数
[BZ2,AZ2]=bilinear(BS2,AS2,Fs); % 双线性变换法转换为数字滤波器系数
[H2,w2]=freqz(BZ2,AZ2); % 计算数字滤波器的频率响应

% 检验指标
omega2=[wp ws];h = freqz(BZ2,AZ2,omega2);
fprintf('Ap= %.4f\n',-20*log10(abs(h(1))));
fprintf('As= %.4f\n',-20*log10(abs(h(2))));

% 绘制数字滤波器幅频特性曲线
hfvt = fvtool(BZ1,AZ1,BZ2,AZ2);
legend(hfvt,'冲激响应不变法','双线性变换法');

disp(['滤波器阶数（冲激响应不变法）：', num2str(N1)]);
disp('滤波器系数（冲激响应不变法）：');
disp(['BZ1：', num2str(BZ1)]);
disp(['AZ1：', num2str(AZ1)]);

disp(['滤波器阶数（双线性变换法）：', num2str(N2)]);
disp('滤波器系数（双线性变换法）：');
disp(['BZ2：', num2str(BZ2)]);
disp(['AZ2：', num2str(AZ2)]);
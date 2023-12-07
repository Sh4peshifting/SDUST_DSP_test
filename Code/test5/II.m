% 定义参数
Fs = 8000; % 采样频率
f1 = 3500; % 带通滤波器的低频截止频率
f2 = 3800; % 带通滤波器的高频截止频率
N = 5*Fs; % 噪声序列的长度，对应5秒

% 生成白噪声
noise = randn(N, 1);

% 设计带通滤波器
[b, a] = butter(4, [f1 f2]/(Fs/2)); % 8阶巴特沃斯带通滤波器

% 对噪声信号进行滤波
filtered_noise = filter(b, a, noise);

% 绘制滤波器的频率响应
freqz(b, a, [], Fs);

% 计算并绘制噪声信号和滤波后信号的频谱
fft_noise = abs(fft(noise));
fft_filtered_noise = abs(fft(filtered_noise));

figure;
subplot(2,1,1);
plot((0:N-1)/N*Fs, fft_noise);
xlim([0 Fs/2]);
title('原始噪声信号的频谱');
xlabel('频率 (Hz)');
ylabel('幅度');

subplot(2,1,2);
plot((0:N-1)/N*Fs, fft_filtered_noise);
xlim([0 Fs/2]);
title('滤波后噪声信号的频谱');
xlabel('频率 (Hz)');
ylabel('幅度');

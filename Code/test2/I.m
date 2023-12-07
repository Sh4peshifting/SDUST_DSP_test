A = 200;
alpha = 75 * pi;
Omega_0 = 75 * pi;
t = linspace(0, 0.01, 1000);
x_a = A * exp(-alpha * t) .* sin(Omega_0 * t) .* (t >= 0);

figure(1);
plot(t, x_a);
title('时域波形');
xlabel('时间 t');
ylabel('x_a(t)');

f = linspace(-1000, 1000, 1000);
X_a = A * (Omega_0) ./ ((1i * 2 * pi * f + alpha).^2 + Omega_0^2);

figure(2);
plot(f, abs(X_a));
title('幅度谱');
xlabel('频率 f');
ylabel('|X_a(j\Omega)|');

fs = [2000, 1000, 400];
T = 0.1;

for i = 1:length(fs)
    t = 0:1/fs(i):T;
    x_n = A * exp(-alpha * t) .* sin(Omega_0 * t);
    X_n = fft(x_n);
    f_n = (0:length(X_n)-1) * fs(i) / length(X_n);
    
    figure(3);
    subplot(3, 1, i),plot(f_n, abs(X_n));
    title(['幅度谱 (fs = ' num2str(fs(i)) ' Hz)']);
    xlabel('频率 f');
    ylabel('|X_n(j\Omega)|');

    X_n_normalized = X_n / max(abs(X_n));
    figure(4);
    subplot(3, 1, i),plot(f_n, abs(X_n_normalized));
    title(['归一化幅度谱 (fs = ', num2str(fs(i)), ' Hz)']);
    xlabel('频率 f');
    ylabel('归一化 |X_a(j\Omega)|');
end


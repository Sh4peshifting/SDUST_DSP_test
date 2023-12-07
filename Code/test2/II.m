n = 1:100;
x1 = cos(0.04 * pi * n);
x2 = cos(0.24 * pi * n);
x3 = cos(0.32 * pi * n);

numerator = 0.0007289 * conv(conv(conv([1, 1], [1, 1]), conv([1, 1], [1, 1])),conv([1, 1], [1, 1]));
denominator = conv(conv([1, -1.2686, 0.7051], [1, -1.0106, 0.3583]), [1, -0.9044, 0.2155]);

y1 = filter(numerator, denominator, x1);
y2 = filter(numerator, denominator, x2);
y3 = filter(numerator, denominator, x3);

x4 = x1 + x2 + x3;
y4 = filter(numerator, denominator, x4);

figure(1);
subplot(2, 2, 1);
stem(n, x1,'.');
title('x_1(n)');
subplot(2, 2, 2);
stem(n, y1,'.');
title('y_1(n)');
subplot(2, 2, 3);
stem(n, x2,'.');
title('x_2(n)');
subplot(2, 2, 4);
stem(n, y2,'.');
title('y_2(n)');

figure(2);
subplot(2, 2, 1);
stem(n, x3,'.');
title('x_3(n)');
subplot(2, 2, 2);
stem(n, y3,'.');
title('y_3(n)');
subplot(2, 2, 3);
stem(n, x4,'.');
title('x_4(n)');
subplot(2, 2, 4);
stem(n, y4,'.');
title('y_4(n)');

y = y1 + y2 + y3;
figure(3);
stem(n, y, '.');
title('y_4(n)');

[H, w] = freqz(numerator, denominator, 512);

figure(4);
subplot(2, 1, 1);
plot(w / pi, abs(H));
title('幅频响应特性');
xlabel('\omega/\pi');
ylabel('|H(e^{j\omega})|');
subplot(2, 1, 2);
plot(w / pi, angle(H));
title('相频响应特性');
xlabel('\omega/\pi');
ylabel('Phase (radians)');

figure(5);
plot(w / pi, 20 * log10(abs(H)));
title('对数幅频特性');
xlabel('\omega/\pi');
ylabel('|H(e^{j\omega})| (dB)');


omega = [0.04 * pi, 0.24 * pi, 0.32 * pi];
H_omega = freqz(numerator, denominator, omega);

figure(6);
plot(w / pi, abs(H));
hold on;
plot(omega / pi, abs(H_omega), 'ro');
title('幅频响应特性');
xlabel('\omega/\pi');
ylabel('|H(e^{j\omega})|');
hold off;


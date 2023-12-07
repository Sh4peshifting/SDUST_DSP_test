hn = [-0.014534,0.006316,0.049630,0.030960,-0.064914,-0.065690,0.161875,0.432748,0.432748,0.161875,-0.065690,-0.064914,0.030960,0.049630,0.006316,-0.014534];
n = 0:999;k = 1:128;m = 0:15;
xn = 0.9.^n + cos(0.25*pi*n) + sin(0.75*pi*n);
x1n = [zeros(1,15),xn(1:113)];x2n = xn(99:226);x3n = xn(212:339);
x4n = xn(325:452);x5n = xn(438:565);x6n = xn(551:678);
x7n = xn(664:791);x8n = xn(777:904);x9n = [xn(890:1000),zeros(1,17)];
Hn = [hn,zeros(1,128-16)];Y = zeros(9,128);
for i = 1:9
    XiN = fft(eval(['x',num2str(i),'n']),128);
    Y(i,:) = ifft(XiN.*fft(Hn,128));
end
yn_overlap_save = Y(:,16:128)';
yn_overlap_save_1000 = yn_overlap_save(1:1000);
figure(1);
subplot(2,1,1);stem(n,xn,'.');xlabel('n');ylabel('x(n)');
subplot(2,1,2);stem(m,hn,'.');xlabel('n');ylabel('h(n)');axis([-1 16 -0.1 0.5]);
figure(2);
stem(n,yn_overlap_save_1000,'.');xlabel('n');ylabel('y(n)');title('重叠保留法');

figure;
y = fftfilt(hn, xn, 32);
stem(0:999, y,'.');xlabel('n');ylabel('y(n)');
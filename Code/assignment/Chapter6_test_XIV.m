Fs=80000; T=1/Fs; 
wp=2*pi*4000/Fs; ws=2*pi*20000/Fs; rp=0.5; rs=45;
[N,wc]=buttord(wp/pi,ws/pi,rp,rs);
[B,A]=butter(N,wc);

figure;
subplot(2,1,1);
[H,w]= freqz(B,A,1000);
plot(w/pi,20*log10(abs(H)));grid on;
title('损耗函数曲线');
xlabel('\omega/\pi');
ylabel('幅度(dB)');
subplot(2,1,2);
plot(w/pi,angle(H));grid on;
title('相频特性曲线');
xlabel('\omega/\pi');
ylabel('相位');
axis([0 1 -2*pi 2*pi]);

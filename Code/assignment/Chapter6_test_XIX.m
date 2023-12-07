Fs=80000; T=1/Fs;
fp=4000; fs=20000; rp=0.5; rs=45; 
wp=2*pi*fp; ws=2*pi*fs; 
[N,wc]=buttord(wp,ws,rp,rs,'s');
[B,A]=butter(N,wc,'s');

[Bz,Az]=impinvar(B,A,Fs);
fk=0:10:Fs/2; omega=2*pi*fk;
Hs=freqs(B,A,omega);
ms=abs(Hs); ps=angle(Hs);
[H,W]=freqz(Bz,Az,1000);
m=abs(H); p=angle(H);
msmin=20*log10(ms(end)/max(ms))
mmin=20*log10(m(end)/max(m))

% Plotting the magnitude and phase response of the analog filter
figure;
subplot(2,2,1);
plot(fk,20*log10(ms));
title('Analog Filter Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;

subplot(2,2,3);
plot(omega/(2*pi),ps);
title('Analog Filter Phase Response');
xlabel('\omega/\pi');
ylabel('Phase (rad)');
grid on;

% Plotting the magnitude and phase response of the digital filter
subplot(2,2,2);
fk_interp = linspace(min(fk), 1000, length(20*log10(m)));
plot(fk_interp,20*log10(m));
title('Digital Filter Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
ylim([-80, 0]);
grid on;

subplot(2,2,4);
plot(W/pi,p);
title('Digital Filter Phase Response');
xlabel('\omega/\pi');
ylabel('Phase (rad)');
grid on;
%3
b=[1,1];
a=[1,-1.273,0.81];
[H,w]=freqz(b,a,521,'whole');
figure;subplot(121);zplane(b,a);
xlabel('Re(z)');ylabel('Im(z)');title('零极点图' );
subplot(122);plot(w,abs(H));
xlabel('w');ylabel('|H(jw)|');title('幅频特性曲线');

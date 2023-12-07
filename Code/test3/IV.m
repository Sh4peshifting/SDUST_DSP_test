%4
b=[1,5,-50];
a=[2,-2.98,0.17, 2.3418 ,-1.5147];
[H,w]=freqz(b,a,512,'whole');
figure;
zplane(b,a);
xlabel('Re(z)');
ylabel('Im(z)');
title('零极点图' );
figure
dimpulse(b,a,66)
title('单位脉冲响应' );
figure
dstep(b,a,66);
title('单位阶跃响应' );

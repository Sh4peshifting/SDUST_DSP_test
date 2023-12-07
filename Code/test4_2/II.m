fs = 400;
T = 1/fs;
L = 4096;

for i = 1:3
    if i ~= 1
        Tp = 0.04*(2^i);
    else
        Tp = 0.04;
    end
    N = Tp/T;t = (0:N-1)*T;
    x = cos(50*pi*t) + sin(100*pi*t) + cos(200*pi*t);
    X = fft(x, L);
    figure(1);subplot(3,1,i);plot(t, x);
    xlabel('t/s');title(['时域图 Tp=', num2str(Tp)]);

    w = (0:L-1)*fs/L;
    figure(2);subplot(3,1,i);plot(w, abs(X));
    xlabel('f/Hz');title(['幅度谱 Tp=', num2str(Tp)]);
    

    wh = hamming(N)';xwin = x(1:N).*wh;
    Y = fft(xwin,L);
    figure(3); subplot(3,1,i); plot(t(1:N), xwin); 
    xlabel('t/s'); title(['hamming窗时域图Tp=', num2str(Tp)]);
    figure(4); subplot(3,1,i); plot((0:L-1)*(fs/L), abs(Y)); 
    xlabel('f/Hz'); title(['hamming窗幅度谱Tp=', num2str(Tp)]);
end

x1=[1,1,1,1];
x2=[1,2,3,4,4,3,2,1];
x3=[4,3,2,1,1,2,3,4];

% Plotting x1
figure;
for N = [8, 16, 32]
    subplot(3, 1, log2(N/8)+1);
    stem(abs(fft(x1, N)));
    title(sprintf('x1, N=%d', N));
end

% Plotting x2 and x3
figure;
for i = 1:2
    if i == 1
        x = x2;
        title_str = 'x2';
    else
        x = x3;
        title_str = 'x3';
    end
    for N = [8, 16]
        subplot(2, 2, (i-1)*2+log2(N/8)+1);
        stem(abs(fft(x, N)));
        title(sprintf('%s, N=%d', title_str, N));
    end
end
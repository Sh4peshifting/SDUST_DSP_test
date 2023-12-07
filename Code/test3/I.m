a = [1, -0.7];
b = [1, 0];

figure(1);
for i = 1:3
    % Update the value of a(2)
    a(2) = -0.7 - 0.1*(i-1);
    
    % Compute the frequency response
    [H, w] = freqz(b, a, 512, 'whole');
    

    subplot(3, 2, 2*i-1);
    zplane(b, a);
    xlabel('Re(z)');
    ylabel('Im(z)');
    title('零极点图');
    
    subplot(3, 2, 2*i);
    plot(w, abs(H));
    xlabel('w');
    ylabel('|H(jw)|');
    title('幅频特性曲线');
end
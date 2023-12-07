% Define the denominator polynomial
a = [1, 0];

% Loop through different numerator coefficients
for i = 1:3
    % Define the numerator polynomial
    b = [1, 0.6+i*0.1];
    
    % Compute frequency response
    [H, w] = freqz(b, a, 521, 'whole');
    
    % Plot results
    figure(2);
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
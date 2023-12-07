% Define the sequences
n = 0:3;
RN=(n>=0)&(n<4);
x = (n+1).*RN;
h = (4-n).*RN;

% Compute the linear convolution
y = conv(x, h);
stem(0:length(y)-1, y);
xlabel('n');
ylabel('y(n)');
title('Linear Convolution of x(n) and h(n)');

% Compute the circular convolutions
yc5=circonv([x,0],[h,0]);
yc6=circonv([x,0,0],[h,0,0]);
yc7=circonv([x,0,0,0],[h,0,0,0]);
yc8=circonv([x,0,0,0,0],[h,0,0,0,0]);
figure;
subplot(221);stem(0:4,yc5);title('x(n)⑤h(n)');
subplot(222);stem(0:5,yc6);title('x(n)⑥h(n)');
subplot(223);stem(0:6,yc7);title('x(n)⑦h(n)');
subplot(224);stem(0:7,yc8);title('x(n)⑧h(n)');

% Compute the circular convolution using FFT and IFFT
N = 8;
X = fft(x, N);
H = fft(h, N);
Y = ifft(X.*H);
figure
stem(0:7, Y);
xlabel('n');
ylabel('x(n)⑧h(n)');
title('Circular Convolution of x(n) and h(n) using FFT and IFFT');
%%
function y=circonv(x1,x2)
    xn2=[x2(1),fliplr(x2)];
    xn2(length(xn2))=[];
    C=xn2;
    R=x2;
    M=toeplitz(C,R);
    y=x1*(M); 
end
n=-11:11;%计算时间序号
RN=(n>=0)&(n<10); %产生矩形脉冲序列
x21=n.*RN;

y21=fliplr(x21);% 翻转 x21 序列
figure;stem(n,y21,'.')
axis([-11 2 -0.2 11])
xlabel('n');
ylabel('y_{21}(n)');
grid on;


y211= sigshift (y21,2,23);% 对 y21 序列进行移位
y22 = (y211(1:end-2) + x21) .* (n >= -2);
figure;stem(n, y22,'.')
axis([-3 10 -0.2 11])
xlabel('n');
ylabel('y_{22}(n)');
grid on;


n = -11:56;
% 对序列进行移位
x211 = sigshift (x21,15,length(x21));
x212 = sigshift (x21,30,length(x21));
x213 = sigshift (x21,45,length(x21));
% 对序列进行延拓
x2 = cont(x21,-11,56);
x211 = cont(x211,-11,56);
x212 = cont(x212,-11,56);
x213 = cont(x213,-11,56);

y23 = x2+x211+x212+x213;
figure;stem(n, y23,'.')
axis([-2 58 -0.2 11])
xlabel('n');
ylabel('y_{23}(n)');
grid on;


n=-22:22;
% 计算 y24 序列（卷积）
y24 = conv(x21, y22);
figure;stem(n, y24,'.')
axis([-7 20 -0.2 259])
xlabel('n');
ylabel('y_{24}(n)');
grid on;


% 定义 sigshift 函数，实现序列移位
function y = sigshift(x,m,N)
    y=zeros(1,N);
    for k=m+1:m+N
        y(k)=x(k-m);
    end
end

% 定义 cont 函数，实现序列延拓
function y = cont(x,ns,nf)
    n=ns:nf;
    y=zeros(1,length(n));
    y((n>=ns)&(n<=(-11+length(x)-1))==1)=x;
end
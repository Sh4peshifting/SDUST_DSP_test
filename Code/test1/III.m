% 定义两个有限长序列
x = [1, 2, 3, 4];
h = [5, 6, 7];

% 使用编写的 linear_conv 函数计算卷积
y1 = linear_conv(x, h);

% 使用 MATLAB 的内置 conv 函数计算卷积
y2 = conv(x, h);

% 比较两个结果
if isequal(y1, y2)
    disp('编写的 linear_conv 函数计算结果与 conv 函数相同，程序正确。');
else
    disp('编写的 linear_conv 函数计算结果与 conv 函数不同，请检查程序。');
end

function y = linear_conv(x, h)
    % x: 输入序列1
    % h: 输入序列2
    % y: 输出序列，线性卷积和运算的结果

    % 获取输入序列的长度
    len_x = length(x);
    len_h = length(h);

    % 初始化输出序列
    y = zeros(1, len_x + len_h - 1);

    % 计算线性卷积和运算
    for i = 1:len_x
        for j = 1:len_h
            y(i + j - 1) = y(i + j - 1) + x(i) * h(j);
        end
    end
end

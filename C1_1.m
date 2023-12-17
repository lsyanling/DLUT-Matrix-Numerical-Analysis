function C1_1
    format long;
    disp('(3)-------------------------------------------')
    N = single([1e2, 1e4, 1e6]);
    sum_min_N = N;
    sum_max_N = N;

    for i = 1:length(N)
        sum_min_N(i) = sum_min(N(i));
        sum_max_N(i) = sum_max(N(i));
    end

    [sum_min_N', sum_max_N']

    disp('(4)-------------------------------------------')
    disp('计算机计算存在舍入误差，应避免大数吃小数的情况发生')
end

% disp('(1)-------------------------------------------')
function [sum] = sum_min(n)
    sum = single(0);
    for i = n:-1:2
        sum = sum + 1 / (i * i - 1);
    end
end

% disp('(2)-------------------------------------------')
function [sum] = sum_max(n)
    sum = single(0);
    for i = 2:n
        sum = sum + 1 / (i * i - 1);
    end
end

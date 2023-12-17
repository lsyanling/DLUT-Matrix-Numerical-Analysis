function C1_3
    format long;
    fx = f(1.00001, 50)
end

function [fx] = f(x, n)
    % n是最高次项系数
    fx = 1;
    for i = 1:n
        fx = x * fx + 1;
    end
end

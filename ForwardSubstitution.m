function [Y] = ForwardSubstitution(L, B)
    %ForwardSubstitution    前向替换
    %   L: 下三角矩阵
    %   B: 常数矩阵
    n = size(L, 1);
    Y = zeros(n, 1);

    for i = 1:n
        Y(i) = (B(i) - L(i, 1:i - 1) * Y(1:i - 1)) / L(i, i);
    end
end

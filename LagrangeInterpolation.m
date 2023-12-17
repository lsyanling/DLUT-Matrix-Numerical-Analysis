function [f] = LagrangeInterpolation(x, xi, yi)
    %LagrangeInterpolation    Lagrange插值
    %   x: 函数变量
    %   xi, yi: 插值节点
    n = length(xi);
    f = zeros(size(x));

    for i = 1:n
        Li = ones(size(x));
        for j = [1:i - 1, i + 1:n]
            Li = Li .* (x - xi(j)) / (xi(i) - xi(j));
        end
        f = f + yi(i) * Li;
    end
end

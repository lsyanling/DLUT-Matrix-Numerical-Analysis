function [L] = CholeskyDecomposition(A)
    %CholeskyDecomposition   LL'分解
    %   A: 系数矩阵，对称正定方阵
    [n, ~] = size(A);
    L = zeros(n);

    for i = 1:n
        for j = 1:i
            if i == j
                % 对角元素
                L(i, i) = sqrt(A(i, i) - sum(L(i, 1:i - 1) .^ 2));
            else
                % 非对角元素
                L(i, j) = (A(i, j) - sum(L(i, 1:j - 1) .* L(j, 1:j - 1))) / L(j, j);
            end
        end
    end
end

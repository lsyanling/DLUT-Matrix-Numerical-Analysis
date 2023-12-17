function [L, U] = LUDecomposition(A)
    %LUDecomposition   LU分解
    %   A: 系数矩阵，方阵
    [n, ~] = size(A);
    L = eye(n);
    U = A;

    for i = 1:n - 1
        for j = i + 1:n
            L(j, i) = U(j, i) / U(i, i);
            U(j, i:n) = U(j, i:n) - L(j, i) * U(i, i:n);
        end
    end
end

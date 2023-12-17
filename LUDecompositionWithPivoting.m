function [L, U, P] = LUDecompositionWithPivoting(A)
    %LUDecompositionWithPivoting   带列主元的LU分解
    %   A: 系数矩阵，方阵
    [n, ~] = size(A);
    L = eye(n);
    U = A;
    P = eye(n);

    for i = 1:n - 1
        % 列主元选择
        [~, maxIndex] = max(abs(U(i:n, i)));
        maxIndex = maxIndex + i - 1;

        % 交换 U 的行
        temp = U(i, :);
        U(i, :) = U(maxIndex, :);
        U(maxIndex, :) = temp;

        % 交换 P 的行
        temp = P(i, :);
        P(i, :) = P(maxIndex, :);
        P(maxIndex, :) = temp;

        % 交换 L 的行和调整 L 的列
        if i > 1
            temp = L(i, 1:i - 1);
            L(i, 1:i - 1) = L(maxIndex, 1:i - 1);
            L(maxIndex, 1:i - 1) = temp;
        end
        
        % LU 分解
        for j = i + 1:n
            L(j, i) = U(j, i) / U(i, i);
            U(j, i:n) = U(j, i:n) - L(j, i) * U(i, i:n);
        end
    end
end

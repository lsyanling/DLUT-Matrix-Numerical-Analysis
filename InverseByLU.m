function [A_Inverse] = InverseByLU(A)
    %InverseByLU   通过LU分解求逆矩阵
    %   A: 系数矩阵，方阵

    % LU 分解（带列主元）
    [L, U, P] = LUDecompositionWithPivoting(A);
    n = size(A, 1);
    A_Inverse = zeros(n);

    % 对于 A 的每一列
    for i = 1:n
        e = zeros(n, 1);
        e(i) = 1;

        % 前向替换解 LY = Pe_i
        Y = ForwardSubstitution(L, P * e);

        % 回代解 UX = Y
        X = BackwardSubstitution(U, Y);

        % 构建 A 的逆
        A_Inverse(:, i) = X;
    end
end

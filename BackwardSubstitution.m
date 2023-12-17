function [X] = BackwardSubstitution(U, Y)
    %BackwardSubstitution    回代
    %   U: 上三角矩阵
    %   Y: 前向替换得到的中间矩阵
    n = size(U, 1);
    X = zeros(n, 1);

    for i = n:-1:1
        X(i) = (Y(i) - U(i, i + 1:n) * X(i + 1:n)) / U(i, i);
    end
end

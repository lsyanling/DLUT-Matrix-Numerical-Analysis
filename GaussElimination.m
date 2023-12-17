function [x] = GaussElimination(A, b)
    %GaussElimination   高斯消元法解方程组
    %   A: 系数矩阵，方阵
    %   b: 常数向量
    % 矩阵的大小
    [n, ~] = size(A);
    Ab = [A, b];

    % 消元，i为列，j为行
    for i = 1:n - 1
        for j = i + 1:n
            factor = Ab(j, i) / Ab(i, i);
            Ab(j, i:n + 1) = Ab(j, i:n + 1) - factor * Ab(i, i:n + 1);
        end
    end

    % 回代
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (Ab(i, n + 1) - Ab(i, i + 1:n) * x(i + 1:n)) / Ab(i, i);
    end
end

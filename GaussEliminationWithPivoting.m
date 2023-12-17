function [x] = GaussEliminationWithPivoting(A, b)
    %GaussEliminationWithPivoting   高斯列主元消元法解方程组
    %   A: 系数矩阵，方阵
    %   b: 常数向量
    % 矩阵的大小
    [n, ~] = size(A);
    Ab = [A, b];

    % 前向消元
    for i = 1:n - 1
        % 选择列主元
        [~, maxIndex] = max(abs(Ab(i:n, i)));
        maxIndex = maxIndex + i - 1;

        % 交换行
        if i ~= maxIndex
            temp = Ab(i, :);
            Ab(i, :) = Ab(maxIndex, :);
            Ab(maxIndex, :) = temp;
        end
        
        % 消元
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

function [x] = GaussIterate(A, b, x0, tol, max_iter)
    %GaussIterate  Gauss迭代求解线性方程组
    %   A: 系数矩阵
    %   b: 常数向量
    %   x0: 初始猜测
    %   tol: 容差
    %   max_iter: 最大迭代次数

    n = size(A, 1);
    L = tril(A);
    U = triu(A, 1);

    for k = 1:max_iter
        x = L \ (b - U * x0);
        if norm(x - x0, inf) < tol
            return;
        end
        x0 = x;
    end
    warning('未在最大迭代次数内达到指定容差，返回当前近似值');
end

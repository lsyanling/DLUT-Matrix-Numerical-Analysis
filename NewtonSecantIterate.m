function [root] = NewtonSecantIterate(f, x, x0, x1, tol, max_iter)
    %NewtonSecantIterate  Newton弦截法迭代求根
    %   f: 目标函数
    %   x: 函数变量
    %   x0: 初始值
    %   tol: 容差
    %   max_iter: 最大迭代次数

    f_numeric = matlabFunction(f);

    for i = 1:max_iter
        xt = x1 - f_numeric(x1) / ((f_numeric(x1) - f_numeric(x0)) / (x1 - x0));
        x0 = x1;
        x1 = xt;
        if abs(x1 - x0) < tol
            root = x1;
            return
        end
    end

    root = x1;
    warning('未在最大迭代次数内达到指定容差，返回当前近似值');
end

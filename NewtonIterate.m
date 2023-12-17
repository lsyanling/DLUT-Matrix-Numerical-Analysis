function [root] = NewtonIterate(f, x, x0, tol, max_iter)
    %NewtonIterate  Newton迭代求根
    %   f: 目标函数
    %   x: 函数变量
    %   x0: 初始值
    %   tol: 容差
    %   max_iter: 最大迭代次数

    df = diff(f, x);
    f_numeric = matlabFunction(f);
    df_numeric = matlabFunction(df);

    for i = 1:max_iter
        x1 = x0 - f_numeric(x0) / df_numeric(x0);
        if abs(x1 - x0) < tol
            root = x1;
            return
        end
        x0 = x1;
    end

    root = x1;
    warning('未在最大迭代次数内达到指定容差，返回当前近似值');
end

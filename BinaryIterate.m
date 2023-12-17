function [root] = BinaryIterate(f, x0, x1, tol)
    %BinaryIterate  二分查找求根
    %   f: 目标函数
    %   x0: 区间左端点
    %   x1: 区间右端点
    %   tol: 容差
    f_numeric = matlabFunction(f);

    while abs(x1 - x0) > tol
        fx0 = f_numeric(x0);
        fx1 = f_numeric(x1);
        xm = (x0 + x1) / 2;
        fxm = f_numeric(xm);

        if fxm == 0
            root = xm;
            return
        else
            if fx0 * fxm < 0
                x1 = xm;
            else
                x0 = xm;
            end
        end
    end
    root = (x0 + x1) / 2;
end

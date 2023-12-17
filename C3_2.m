function C3_2
    format long;
    syms x;

    disp('二分查找-------------------------------------------')
    f = x * cos(x) + 2;
    x0 = -4;
    x1 = 4;
    tol = 1e-6;
    root = BinaryIterate(f, x0, x1, tol)

    disp('Newton迭代-----------------------------------------')
    f = x ^ 3 + 2 * x ^ 2 + 10 * x - 100;
    x0 = 0;
    tol = 1e-6;
    max_iter = 10;
    root = NewtonIterate(f, x, x0, tol, max_iter)

    disp('弦截法---------------------------------------------')
    f = x ^ 3 + 2 * x ^ 2 + 10 * x - 100;
    x0 = 0;
    x1 = 1;
    tol = 1e-6;
    max_iter = 10;
    root = NewtonSecantIterate(f, x, x0, x1, tol, max_iter)

    disp('迭代值列表-----------------------------------------')
    Newton = [];
    Secant = [];
    tol = 1e-16; % double的最大精度
    max_iter = 12;

    for i = 1:max_iter
        Newton(i) = NewtonIterate(f, x, x0, tol, i);
        Secant(i) = NewtonSecantIterate(f, x, x0, x1, tol, i);
    end

    [Newton', Secant']
    disp('Newton迭代法收敛更快-------------------------------')
end

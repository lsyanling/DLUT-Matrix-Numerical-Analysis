function C4_12
    format long;
    syms x;

    disp('(1)-------------------------------------------')
    f = x ^ 3 - x ^ 2 - x - 1;
    x0 = 2;
    tol = 1e-5;
    max_iter = 4;
    root = NewtonIterate(f, x, x0, tol, max_iter)

    disp('(2)-------------------------------------------')
    f = x - exp(-x);
    x0 = 0.6;
    tol = 1e-5;
    max_iter = 3;
    root = NewtonIterate(f, x, x0, tol, max_iter)
end

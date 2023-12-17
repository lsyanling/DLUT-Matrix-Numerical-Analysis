function C3_6
    format long;
    syms x;

    disp('函数图像-----------------------------------------')
    f = 54 * x ^ 6 + 45 * x ^ 5 - 102 * x ^ 4 - 69 * x ^ 3 + 35 * x ^ 2 + 16 * x - 4;
    f_numeric = matlabFunction(f);
    x_value = -2:0.01:2;
    fx_value = f_numeric(x_value);

    plot(x_value, fx_value);
    xlabel('x∈[-2,2]');
    ylabel('f(x)');
    grid on;
    title('f(x) = 54x^6+45x^5-102x^4-69x^3+35x^2+16x-4');

    disp('(1)求5个根---------------------------------------')
    x0 = [-1.5 -0.7 0.2 0.48 1];
    tol = 1e-16;
    max_iter = 20;
    roots = [];

    for i = 1:length(x0)
        roots(i) = NewtonIterate(f, x, x0(i), tol, max_iter);
    end

    roots'

    disp('(1)判断收敛阶数----------------------------------')
    all_roots = [];
    e1 = ones(1, length(x0));
    e2 = ones(1, length(x0));
    max_iter = 10;

    for j = 1:max_iter
        for i = 1:length(x0)
            all_roots(i, j) = NewtonIterate(f, x, x0(i), tol, j);

            if j > 1
                e1(i, j) = (all_roots(i, j) - roots(i)) / (all_roots(i, j - 1) - roots(i));
                e2(i, j) = (all_roots(i, j) - roots(i)) / (all_roots(i, j - 1) - roots(i)) ^ 2;
            end
        end
    end

    e1'
    e2'
    disp('-1.6附近的根，e1减小，e2稳定，二阶收敛------------------------------------')
    disp('-0.7附近的根，e1稳定，e2增大，一阶收敛------------------------------------')
    disp(' 0.2附近的根，e1减小，e2稳定，二阶收敛------------------------------------')
    disp('0.48附近的根，e1减小，e2稳定，二阶收敛------------------------------------')
    disp(' 1.1附近的根，e1减小，e2稳定，二阶收敛------------------------------------')

    disp('(1)求5个根---------------------------------------')
    x0 = [-1.5 -0.7 0.2 0.48 1];
    x1 = [-1.4 -0.6 0.3 0.6 1.1];
    tol = 1e-16;
    max_iter = 20;
    roots = [];

    for i = 1:length(x0)
        roots(i) = NewtonSecantIterate(f, x, x0(i), x1(i), tol, max_iter);
    end

    roots'

    disp('(2)判断收敛阶数----------------------------------')
    all_roots = [];
    e1 = ones(1, length(x0));
    e2 = ones(1, length(x0));
    max_iter = 10;

    for j = 1:max_iter
        for i = 1:length(x0)
            all_roots(i, j) = NewtonSecantIterate(f, x, x0(i), x1(i), tol, j);

            if j > 1
                e1(i, j) = (all_roots(i, j) - roots(i)) / (all_roots(i, j - 1) - roots(i));
                e2(i, j) = (all_roots(i, j) - roots(i)) / (all_roots(i, j - 1) - roots(i)) ^ 2;
            end
        end
    end

    e1'
    e2'
    disp('-1.5附近的根，e1减小，e2增大，超线性收敛----------------------------------')
    disp('-0.7附近的根，e1稳定，e2增大，线性收敛------------------------------------')
    disp(' 0.2附近的根，e1减小，e2增大，超线性收敛----------------------------------')
    disp('0.48附近的根，e1减小，e2增大，超线性收敛----------------------------------')
    disp(' 1.1附近的根，e1减小，e2增大，超线性收敛----------------------------------')
end

function C2_7
    format long;

    n = [10 20 30 50 100];
    A = {};
    b = {};

    for i = 1:length(n)
        Ai = 3 .* eye(n(i));
        % 主对角线上、下的对角线设为-1
        for j = 1:n(i) - 1
            Ai(j, j + 1) = -1;
            Ai(j + 1, j) = -1;
        end

        A{i} = Ai;

        bi = ones(n(i), 1);
        bi(1) = 2;
        bi(n(i)) = 2;
        b{i} = bi;
    end

    disp('Jacobi迭代---------------------------------------------------')
    x_Jacobi = {};
    for i = 1:length(n)
        xi = JacobiIterate(A{i}, b{i}, b{i}, 1e-6, 50);
        x_Jacobi{i} = xi;
    end

    disp('Gauss迭代---------------------------------------------------')
    x_Gauss = {};
    for i = 1:length(n)
        xi = GaussIterate(A{i}, b{i}, b{i}, 1e-6, 50);
        x_Gauss{i} = xi;
    end

    x_true = {};
    for i = 1:length(n)
        x_true{i} = A{i} \ b{i};
    end

    % 对比
    for i = 1:length(n)
        [x_Jacobi{i}, x_Gauss{i}, x_true{i}]
    end

end

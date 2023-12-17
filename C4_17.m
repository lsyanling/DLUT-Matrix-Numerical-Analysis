function C4_17
    format long;
    syms x;
    f = cos(x) * sinh(x) - 1;
    x0_array = [5, 8, 10, 14, 17];
    root_array = x0_array;
    tol = 1e-5;
    max_iter = 100;

    for i = 1:length(x0_array)
        x0 = x0_array(i);
        root = NewtonIterate(f, x, x0, tol, max_iter);
        root_array(i) = root;
    end

    root_array'
end

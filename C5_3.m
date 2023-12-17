function C5_3
    format long;
    syms x;

    f = exp(3 * x) * cos(pi * x);
    f_numeric = matlabFunction(f);

    h = 2 * pi ./ [50 100 200 500 1000];
    x_array = {};
    fx_array = {};
    for i = 1:length(h)
        x_array{i} = 0:h(i):2 * pi;
        fx_array{i} = f_numeric(x_array{i});
    end

    sum_T = [];
    sum_S = [];
    for i = 1:length(h)
        ni = length(x_array{i});
        % 复化梯形
        sum = 0;
        for j = 1:ni - 1
            sum = sum + fx_array{i}(j) + fx_array{i}(j + 1);
        end
        sum = (x_array{i}(ni) - x_array{i}(1)) / (2 * (ni - 1)) * sum;
        sum_T(i) = sum;

        % 复化Simpson
        sum = 0;
        for j = 1:2:ni - 2
            sum = sum + fx_array{i}(j) + 4 * fx_array{i}(j + 1) + fx_array{i}(j + 2);
        end
        sum = (x_array{i}(ni) - x_array{i}(1)) / (6 * (ni - 1) / 2) * sum;
        sum_S(i) = sum;
    end

    % 对比
    f_integral = exp(3 * x) * (3 * cos(pi * x) + pi * sin(pi * x)) / (9 + pi ^ 2);
    f_integral_numeric = matlabFunction(f_integral);
    integral_value = f_integral_numeric(2 * pi) - f_integral_numeric(0);
    sum_true = ones(1, 5) * integral_value;
    [sum_T', sum_S', sum_true'];
    % 误差
    [sum_true' - sum_T', sum_true' - sum_S']
    disp('复化Simpson公式的误差比复化梯形公式小-------------------------')
end

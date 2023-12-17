function C6_1
    format long;
    syms x u;

    f = 2 * u / x + x ^ 2 * exp(x);
    f_numeric = matlabFunction(f); % f(u,x)
    u1 = 0;

    h = [0.1 0.05 0.01];
    x_array = {};
    for i = 1:length(h)
        x_array{i} = 1:h(i):2;
    end

    ux_value_Euler = {};
    ux_value_Euler_improved = {};
    ux_value_Runge = {};

    for i = 1:length(h)
        ni = length(x_array{i});
        ux_value_Euler{i}(1) = u1;
        ux_value_Euler_improved{i}(1) = u1;
        ux_value_Runge{i}(1) = u1;

        % Euler
        for j = 1:ni - 1
            uj = ux_value_Euler{i}(j);
            xj = x_array{i}(j);
            ux_value_Euler{i}(j + 1) = uj + h(i) * f_numeric(uj, xj);

            % 改进的Euler
            uj_1 = ux_value_Euler{i}(j + 1);
            xj_1 = x_array{i}(j + 1);
            ux_value_Euler_improved{i}(j + 1) = uj + 0.5 * h(i) * (f_numeric(uj, xj) + f_numeric(uj_1, xj_1));
        end

        % Runge-Kutta
        for j = 1:ni - 1
            uj = ux_value_Runge{i}(j);
            xj = x_array{i}(j);
            k1 = f_numeric(uj, xj);
            xj_h_2 = xj + h(i) / 2;
            k2 = f_numeric(uj + h(i) * k1 / 2, xj_h_2);
            k3 = f_numeric(uj + h(i) * k2 / 2, xj_h_2);
            k4 = f_numeric(uj + h(i) * k3, xj + h(i));
            ux_value_Runge{i}(j + 1) = uj + h(i) * (k1 + 2 * k2 + 2 * k3 + k4) / 6;
        end
    end

    % 对比
    for i = 1:length(h)
        figure;
        [x_array{i}', ux_value_Euler{i}', ux_value_Euler_improved{i}', ux_value_Runge{i}']
        disp('蓝色Euler法----------------------------------------------')
        plot(x_array{i}, ux_value_Euler{i});
        hold on;
        disp('橙色改进的Euler法----------------------------------------')
        plot(x_array{i}, ux_value_Euler_improved{i});
        hold on;
        disp('黄色Runge-Kutta法----------------------------------------')
        plot(x_array{i}, ux_value_Runge{i});
        grid on;
        legend('Euler', 'Euler improved', 'Runge-Kutta');
    end
end

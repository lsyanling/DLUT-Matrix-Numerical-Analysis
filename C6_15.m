function C6_15
    format long;
    syms x t;

    % 被积函数
    gt = exp(-t ^ 2/2);
    gt_numeric = matlabFunction(gt);

    % 求积节点
    t_array = 0:0.1:3;
    gt_array = t_array;
    for i = 1:length(t_array)
        ti = t_array(i);
        gti = gt_numeric(ti);
        gt_array(i) = gti;
    end

    % 求积
    integral_value = t_array;
    for i = 2:length(t_array)
        sum = 0;
        % 偶数个节点，复化梯形
        if 0 == mod(i, 2)
            for j = 1:i - 1
                sum = sum + gt_array(j) + gt_array(j + 1);
            end
            sum = (t_array(i) - t_array(1)) / (2 * (i - 1)) * sum;
        else
        % 奇数个节点，复化Simpson
            for j = 1:2:i - 2
                sum = sum + gt_array(j) + 4 * gt_array(j + 1) + gt_array(j + 2);
            end
            sum = (t_array(i) - t_array(1)) / (6 * (i - 1) / 2) * sum;
        end
        integral_value(i) = sum;
    end

    f = 0.5 + integral_value / sqrt(2 * pi);

    % matlab计算的值
    true_integral = t_array;
    true_f = t_array;
    for i = 1:length(t_array)
        true_integral(i) = integral(gt_numeric, 0, 0.1 * (i - 1));
        true_f(i) = 0.5 + true_integral(i) / sqrt(2 * pi);
    end

    % 对比
    [integral_value', true_integral']
    [f', true_f']
end

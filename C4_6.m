function C4_6
    format long;
    syms x;

    x_value = 1994:2003;
    fx_value = [67.052 68.008 69.803 72.024 73.400 72.063 74.669 74.487 74.065 76.777];

    disp('Lagrange插值求9阶多项式---------------------------------------')
    f_lagrange = LagrangeInterpolation(x, x_value, fx_value);
    f_lagrange_numeric = matlabFunction(f_lagrange);
    fx_lagrange_value = f_lagrange_numeric(2010)

    x_interpolation = 1994:2010;
    fx_interpolation_value = f_lagrange_numeric(x_interpolation);
    plot(x_interpolation, fx_interpolation_value);
    xlabel('x∈[1994, 2010]');
    ylabel('f(x)');
    grid on;
    title('Lagrange插值得到9阶多项式f(x)');
    disp('2005年起产量预测下降，2010年产量预测为负，Runge现象出现，插值多项式不是好的模型')

    disp('(1)橙色最小二乘直线拟合---------------------------------------')
    p1 = polyfit(x_value, fx_value, 1);
    p1_value = polyval(p1, x_interpolation);
    figure;
    plot(x_value, fx_value, 'o', x_interpolation, p1_value, '-');
    grid on;
    hold on;

    disp('(2)紫色最小二乘抛物线拟合-------------------------------------')
    p2 = polyfit(x_value, fx_value, 2);
    p2_value = polyval(p2, x_interpolation);
    plot(x_value, fx_value, 'o', x_interpolation, p2_value, '-');
    grid on;
    hold on;

    disp('(3)蓝色最小二乘三次拟合---------------------------------------')
    p3 = polyfit(x_value, fx_value, 3);
    p3_value = polyval(p3, x_interpolation);
    plot(x_value, fx_value, 'o', x_interpolation, p3_value, '-');
    grid on;

    legend('原始数据', '最小二乘直线拟合', '最小二乘抛物线拟合', '最小二乘三次拟合');

    disp('计算均方误差-------------------------------------------------')
    p1_mean = mean((fx_value - p1_value(1:length(fx_value))) .^ 2)
    p2_mean = mean((fx_value - p2_value(1:length(fx_value))) .^ 2)
    p3_mean = mean((fx_value - p3_value(1:length(fx_value))) .^ 2)
    disp('在均方误差意义下，最小二乘三次拟合最好------------------------')
end

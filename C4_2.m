function C4_2
    format long;
    syms x;

    f = 1 / (1 + x ^ 2);
    f_numeric = matlabFunction(f);

    disp('蓝色原函数图像------------------------------------------------')
    x_value = -5:0.01:5;
    fx_value = f_numeric(x_value);
    plot(x_value, fx_value);
    xlabel('x∈[-5,5]');
    ylabel('f(x)');
    grid on;
    title('f(x) = 1/(1+x^2)');
    hold on;

    disp('橙色h=2等距节点插值-------------------------------------------')
    x_interpolation = -5:2:5;
    fx_interpolation = f_numeric(x_interpolation);
    fx_spline_value = spline(x_interpolation, fx_interpolation, x_value);
    plot(x_value, fx_spline_value);
    hold on;

    disp('黄色h=1等距节点插值-------------------------------------------')
    x_interpolation = -5:1:5;
    fx_interpolation = f_numeric(x_interpolation);
    fx_spline_value = spline(x_interpolation, fx_interpolation, x_value);
    plot(x_value, fx_spline_value);
    hold on;

    disp('紫色h=1/2等距节点插值-----------------------------------------')
    x_interpolation = -5:1/2:5;
    fx_interpolation = f_numeric(x_interpolation);
    fx_spline_value = spline(x_interpolation, fx_interpolation, x_value);
    plot(x_value, fx_spline_value);

    legend('原函数', 'h=2等距节点插值', 'h=1等距节点插值', 'h=1/2等距节点插值');
    disp('三次样条插值，插值节点越多，拟合效果越好----------------------')
end

function [Q, R] = QRDecomposition(A)
    %QRDecomposition   QR分解
    %   A: 系数矩阵
    [m, n] = size(A);
    Q = eye(m);
    R = A;

    for k = 1:n
        % 求 Householder 矩阵
        x = R(k:m, k);
        e = zeros(length(x), 1);
        e(1) = 1;
        w = sign(x(1)) * norm(x) * e + x;
        w = w / norm(w);

        H = eye(m);
        H(k:m, k:m) = H(k:m, k:m) - 2 * (w * w');

        % 将 Householder 矩阵乘到Q上
        R = H * R;
        Q = Q * H;
    end

    % 取R的上三角
    R = triu(R(1:n, :));
    Q = Q(:, 1:n);
end

function C2_4
    format short;
    A = [
         1 1 0 0
         -1 3 -1/2 1/2
         -2 2 3/2 1/2
         -2 2 -1/2 5/2
         ];

    disp('QR分解---------------------------------------------------')
    [Q, R] = QRDecomposition(A);
    [q, r] = qr(A);
    % 对比
    [Q, q]
    [R, r]
end

function C2_1
    format short;
    A = [
         31 -13 0 0 0 -10 0 0 0
         -13 35 -9 0 -11 0 0 0 0
         0 -9 31 -10 0 0 0 0 0
         0 0 -10 79 -30 0 0 0 -9
         0 0 0 -30 57 -7 0 -5 0
         0 0 0 0 -7 47 -30 0 0
         0 0 0 0 0 -30 41 0 0
         0 0 0 0 -5 0 0 27 -2
         0 0 0 -9 0 0 0 -2 29
         ];
    b = [-15 27 -23 0 -20 12 -7 7 10]';

    disp('Gauss消元法----------------------------------------------')
    gauss_x = GaussElimination(A, b)

    disp('Gauss列主元消元法----------------------------------------')
    gauss_Pivoting_x = GaussEliminationWithPivoting(A, b);

    disp('LU分解---------------------------------------------------')
    [L1, U1] = LUDecomposition(A);

    disp('列主元LU分解---------------------------------------------')
    [L2, U2, P2] = LUDecompositionWithPivoting(A);

    disp('LU分解求逆矩阵-------------------------------------------')
    A_inv = InverseByLU(A);
    % 对比
    [A_inv, inv(A)]

    disp('LU分解求行列式-------------------------------------------')
    n = size(A);
    det_A = 1;

    for i = 1:n
        det_A = det_A * L1(i, i) * U1(i, i);
    end

    % 对比
    [det_A, det(A)]'
end

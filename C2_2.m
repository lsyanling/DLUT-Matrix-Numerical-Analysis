function C2_2
    format short;
    A = [
         7 1 -5 1
         1 9 2 7
         -5 2 7 -1
         1 7 -1 9
         ];
    b = [13 -9 6 0]';

    disp('LLT分解--------------------------------------------------')
    L = CholeskyDecomposition(A)
    LT = L';

    disp('LLT分解求解方程组----------------------------------------')
    y = ForwardSubstitution(L, b);
    x = BackwardSubstitution(LT, y);
    % 对比
    [x, A \ b]
end

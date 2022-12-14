function [x] = lu_lgs(A, b)

    % lieber immer backslash operator verwenden, dieser berücksichtigt
    % alles und nimmt den günstigsten weg

    % wenn die Matrix symmetrisch positiv definit ist, kann auch
    % die Cholesky-Zerlegung angewendet werden
    
    % Bei der Cholesky-Zerlegung gilt: A=R'*R
    % => L = R' und U = R

    try R = chol(A);
        disp('Using Cholesky decomposition');
        L = R';
        U = R;
    catch
        disp('Using standard LU decomposition');
        [L, U] = decompose(A);
    end

    % Vorwärtssubstitution
    % L*y = b

    y = zeros(size(L,2), 1);

    for i = 1:size(b,1)

        currentResult = b(i);

        for i2 = 1:i-1

            currentResult = currentResult - y(i2)*L(i,i2);

        end

        currentResult = currentResult / L(i,i);

        y(i) = currentResult;
    end

    % Rückwärtssubstitution
    % U*x = y

    x = zeros(size(A,2), 1);

    for i = fliplr(1:size(y,1))

        currentResult = y(i);

        for i2 = fliplr(i+1:size(U,2))

            currentResult = currentResult - x(i2)*U(i,i2);

        end

        currentResult = currentResult / U(i,i);

        x(i) = currentResult;
    end
end


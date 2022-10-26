function [x] = lu_lgs(A, b)

    % U = M*A
    % U: Untere Dreiecksmatrix
    % M: Dreiecksmatrix, die A zu einer Dreiecksmatrix macht
    % -> Elemente für die Dreiecksform eliminieren

    % A = L*U




    % Rückwärtssubstitution

    x = zeros(1, size(A,2));

    for i = fliplr(1:size(b,1))

        currentResult = b(i);

        disp(size(A,2):i);

        for i2 = fliplr(i:size(A,2))

            currentResult = currentResult - x(i2)*A(i,i2);

        end

        currentResult = currentResult / A(i,i);

        x(i) = currentResult;
    end
end


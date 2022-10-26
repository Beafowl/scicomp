function [L,U] = decompose(A)

    % LU decomposition
    % assumption: square matrix

    L = eye(size(A,1));

    for i = 1:size(A,1)-1

        % create elimination matrix for i-th column

        E = eye(size(A,1));

        for i2 = fliplr(i+1:size(A,1))

            E(i2,i) = -A(i2,i)/A(i,i);
            L(i2,i) = -E(i2,i);

        end

        % apply elimination on A

        A = E*A;
    end

    % A will eventually become the U matrix

    U = A;
end


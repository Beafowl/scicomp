function x = mylinsolve(A, b)

    if size(A,1) ~= size(A,2)
        error("Matrix is not a square matrix");
    end

    for j = 1:size(A,2)

        M = eye(size(A,2));

        for i = 1:size(A,1)

            if i == j
                continue;
            end

            M(i,j) = -A(i,j)/A(j,j);

        end

        A = M*A;
        b = M*b;
    end

    x = zeros(size(A,1), 1);

    for i = 1:size(A,1)

        x(i,1) = b(i,1)/A(i,i);

    end
end


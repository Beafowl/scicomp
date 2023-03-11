function Ainv = myinv_gauss(A)

    if size(A,1) ~= size(A,2)
        error("Matrix is not a square matrix");
    end

    Ainv = eye(size(A,1));

    for j = 1:size(A,2)

        M = eye(size(A,2));

        for i = 1:size(A,1)

            if i == j
                continue;
            end

            M(i,j) = -A(i,j)/A(j,j);

        end

        A = M*A;
        Ainv = M*Ainv;
    end

    for i = 1:size(A,1)

        Ainv(i,:) = Ainv(i,:)/A(i,i);

    end

end


function x = determinante(A)

    if size(A,1) ~= size(A,2)
        error("Matrix ist nicht quadratisch");
    end

    if size(A,1) == 1
        x = A(1,1);
        return
    end

    x = 0;

    for j = 1:size(A,2)

        D = A;
        D(1,:) = [];
        D(:,j) = [];

        x = x + A(1,j)*(-1).^(1+j)*determinante(D);

    end

end

